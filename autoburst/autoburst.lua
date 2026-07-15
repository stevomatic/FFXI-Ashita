--[[
* AutoBurst - Ashita v4
*
* Originally forked from DanielHazzard's Windower/Ashita v3 addon.
* Ported to the Ashita v4 API and substantially rewritten since.
*
* See CHANGES.md in this folder for what changed and why.
--]]

addon.name    = 'AutoBurst';
addon.author  = 'DanielHazzard, v4 port and changes by Kommissar';
addon.version = '2.2';
addon.desc    = 'Automatically casts elemental magic bursts when a skillchain resonance packet is detected.';

-- v3's 'common' helper library is intentionally not required here; it isn't
-- a valid v4 module and a failed require() during chunk load would kill the
-- addon before it reaches the event registrations below. All helpers this
-- addon needs are defined locally instead.

-- 'ffxi.recast' populates ashita.ffxi.recast, used by SpellRecast() below.
-- Wrapped in pcall so SpellRecast() can degrade gracefully (skip the recast
-- check) rather than crash if this module path isn't valid on a given build.
local recast_lib_ok = pcall(require, 'ffxi.recast');

-- ============================================================================
-- Skillchain resonance property IDs -> element/name.
-- These are the packet "prop" values, not weaponskill IDs.
-- ============================================================================
local SkillchainID = {
    [288] = 'Light',
    [289] = 'Darkness',
    [290] = 'Gravitation',
    [291] = 'Fragmentation',
    [292] = 'Distortion',
    [293] = 'Fusion',
    [294] = 'Compression',
    [295] = 'Liquefaction',
    [296] = 'Induration',
    [297] = 'Reverberation',
    [298] = 'Transfixion',
    [299] = 'Scission',
    [300] = 'Detonation',
    [301] = 'Impaction',
    [385] = 'Light',
    [386] = 'Darkness',
    [387] = 'Gravitation',
    [388] = 'Fragmentation',
    [389] = 'Distortion',
    [390] = 'Fusion',
    [391] = 'Compression',
    [392] = 'Liquefaction',
    [393] = 'Induration',
    [394] = 'Reverberation',
    [395] = 'Transfixion',
    [396] = 'Scission',
    [397] = 'Detonation',
    [398] = 'Impaction',
    [767] = 'Radiance',
    [768] = 'Umbra',
    [769] = 'Radiance',
    [770] = 'Umbra',
};

local JobIDs = {
    [0]  = 'NON', [1]  = 'WAR', [2]  = 'MNK', [3]  = 'WHM',
    [4]  = 'BLM', [5]  = 'RDM', [6]  = 'THF', [7]  = 'PLD',
    [8]  = 'DRK', [9]  = 'BST', [10] = 'BRD', [11] = 'RNG',
    [12] = 'SAM', [13] = 'NIN', [14] = 'DRG', [15] = 'SMN',
    [16] = 'BLU', [17] = 'COR', [18] = 'PUP', [19] = 'DNC',
    [20] = 'SCH', [21] = 'GEO', [22] = 'RUN', [23] = 'MON',
};

-- Status buffs that should prevent bursting outright.
-- (KO, Sleep, Silence, Petrify, Stun, Charm, Terror, Mute, Lullaby, Omerta)
local DISABLING_BUFFS = {
    [0] = true, [2] = true, [6] = true, [7] = true, [10] = true,
    [14] = true, [28] = true, [29] = true, [193] = true, [262] = true,
};

-- Numeric rank for comparing spell tiers, used to enforce MaxTierByJob (see
-- AutoBurst_config.lua). Needed because some jobs' spell resource data
-- reports a Job Point unlock for tiers the server ruleset doesn't actually
-- grant (e.g. RDM + tier VI nukes) -- that would pass CanUseSpell but then
-- fail server-side when actually cast.
local TIER_RANK = { I = 1, II = 2, III = 3, IV = 4, V = 5, VI = 6 };

-- ============================================================================
-- Load configuration (unchanged file format, see AutoBurst_config.lua)
-- ============================================================================
require('AutoBurst_config');

-- ============================================================================
-- Addon-local state
-- ============================================================================
local zoning           = false;
local isCasting         = false;   -- reserved for future use; nothing currently sets this to true.
local silence_was_active = false;

-- ============================================================================
-- Helpers
-- ============================================================================

local function DebugMessage(message)
    if (DebugMode) then
        print(('\31\200[\31\05AutoBurst\31\200]\31\207 %s'):format(tostring(message)));
    end
end

local function table_contains(t, element)
    for _, value in pairs(t) do
        if (value == element) then
            return true;
        end
    end
    return false;
end

-- Reads bitOffset/bitLength out of a packet using the real Ashita v4 API:
--   ashita.bits.unpack_be(e.data_raw, 0, bitOffset, bitLength)
-- Requires e.data_raw (the raw/FFI packet data), not e.data (the plain Lua
-- string); byteOffset is always 0, with the full bit offset in the third
-- argument. The bit-offset constants used elsewhere in this file (82, 271,
-- 299, 150, etc.) are field positions within the action packet and don't
-- need to change if this call itself is ever swapped out.
--
-- unpack_be_fallback is a pure-Lua equivalent that reads from e.data
-- instead, used only if the real API call ever fails on some other build.
local function unpack_be_fallback(data, bitOffset, bitLength)
    local value = 0;

    for i = 0, bitLength - 1 do
        local bitPos    = bitOffset + i;
        local bytePos   = math.floor(bitPos / 8) + 1; -- Lua strings are 1-indexed
        local bitInByte = 7 - (bitPos % 8);            -- 0 = LSB, 7 = MSB within the byte

        local byteVal = data:byte(bytePos) or 0;
        local bitVal  = math.floor(byteVal / (2 ^ bitInByte)) % 2;

        value = value * 2 + bitVal;
    end

    return value;
end

local unpack_be_use_real_api = true;

-- data_raw: e.data_raw, used for the real API call.
-- data_str: e.data, used only if the real API call fails and we fall back.
local function unpack_be(data_raw, data_str, bitOffset, bitLength)
    if (unpack_be_use_real_api) then
        local ok, result = pcall(ashita.bits.unpack_be, data_raw, 0, bitOffset, bitLength);
        if (ok) then
            return result;
        end
        unpack_be_use_real_api = false;
        DebugMessage(('unpack_be: real API call failed (%s) -- falling back to pure-Lua extraction.'):format(tostring(result)));
    end

    return unpack_be_fallback(data_str, bitOffset, bitLength);
end

-- Returns true if the local player currently has the given buff id active.
local function BuffActive(buffId)
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    local buffs  = player:GetBuffs();

    for i = 0, 31 do
        if (buffs[i] == buffId) then
            return true;
        end
    end

    return false;
end

local function CheckIfPlayerDisabled()
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    local buffs  = player:GetBuffs();

    for i = 0, 31 do
        if (DISABLING_BUFFS[buffs[i]]) then
            return true;
        end
    end

    return false;
end

-- Returns the remaining recast (in seconds) for a spell, or nil if the spell
-- name couldn't be resolved (e.g. a typo, or "void" from BurstMagic config).
--
-- If ashita.ffxi.recast isn't available on this build (require failed, see
-- recast_lib_ok above), this degrades to always reporting "ready" (0)
-- instead of crashing. Bursting still works, it just can't tell if a spell
-- is on cooldown, so it may occasionally attempt a cast that fails
-- server-side silently.
local recast_warning_shown = false;

local function SpellRecast(spellName)
    local resources = AshitaCore:GetResourceManager();
    local spell     = resources:GetSpellByName(spellName, 0);

    if (spell == nil) then
        return nil;
    end

    if (not recast_lib_ok or ashita.ffxi == nil or ashita.ffxi.recast == nil) then
        if (not recast_warning_shown) then
            recast_warning_shown = true;
            DebugMessage('ashita.ffxi.recast is unavailable on this build -- skipping recast checks (spells will be treated as always ready).');
        end
        return 0;
    end

    local ok, recast = pcall(ashita.ffxi.recast.get_spell_recast_by_index, spell.Index);
    if (not ok) then
        if (not recast_warning_shown) then
            recast_warning_shown = true;
            DebugMessage(('get_spell_recast_by_index failed (%s) -- skipping recast checks.'):format(tostring(recast)));
        end
        return 0;
    end

    DebugMessage(('Current recast for %s: %d'):format(spellName, recast));
    return recast;
end

-- Returns the total count of the given item id across the player's inventory.
local function ItemCount(itemId)
    local inventory = AshitaCore:GetMemoryManager():GetInventory();
    local total     = 0;

    for index = 1, inventory:GetContainerMax(0) do
        local item = inventory:GetItem(0, index);
        if (item ~= nil and item.Id == itemId) then
            total = total + item.Count;
        end
    end

    return total;
end

local function QueueCmd(command)
    -- v4 QueueCommand takes (mode, command) -- the order is reversed from v3.
    -- Mode 1 sends the command directly to the game client.
    AshitaCore:GetChatManager():QueueCommand(1, command);
end

-- Can the player currently cast this spell? Checks MP, main/sub job level
-- requirements, and (for Job Point unlocked spells) live JP-spent totals via
-- player:GetJobPointsSpent(jobId) -- no hand-maintained JP table needed.
local levelrequired_dump_shown = false;

local function CanUseSpell(spellName)
    local resources = AshitaCore:GetResourceManager();
    local player    = AshitaCore:GetMemoryManager():GetPlayer();
    local party     = AshitaCore:GetMemoryManager():GetParty();

    local spell = resources:GetSpellByName(spellName, 0);
    if (spell == nil) then
        DebugMessage(('Spell lookup failed (skipping): %s'):format(spellName));
        return false;
    end

    local jobId     = player:GetMainJob();
    local currentMp = party:GetMemberMP(0);

    DebugMessage(('Checking %s -- MP: %d / cost: %d'):format(spellName, currentMp, spell.ManaCost));

    if (currentMp <= spell.ManaCost) then
        return false;
    end

    -- Shift index by +1 to compensate for the 1-indexed job data array structure
    local levelRequired = spell.LevelRequired[jobId + 1];
    DebugMessage(('LevelRequired for %s on job id %d (%s): %s (mainLv=%d, subLv=%d)')
        :format(spellName, jobId, tostring(JobIDs[jobId]), tostring(levelRequired), player:GetMainJobLevel(), player:GetSubJobLevel()));

    -- One-time diagnostic: if the direct-index lookup comes back unusable,
    -- dump the entire LevelRequired array (job ids 0-23) for this spell so
    -- we can see whether the data landed at a different index than expected.
    -- Prints unconditionally (not gated by DebugMode) since it only fires once.
    if ((levelRequired == nil or levelRequired == -1) and not levelrequired_dump_shown) then
        levelrequired_dump_shown = true;
        local parts = {};
        for i = 0, 23 do
            local ok, val = pcall(function () return spell.LevelRequired[i]; end);
            parts[#parts + 1] = ('%d:%s=%s'):format(i, tostring(JobIDs[i]), ok and tostring(val) or 'ERR');
        end
        print(('\31\200[\31\05AutoBurst\31\200]\31\207 LevelRequired dump for %s -- %s'):format(spellName, table.concat(parts, ', ')));
    end

    if (levelRequired == nil or levelRequired == -1) then
        return false;
    end

    -- Job Point "master level" spells are flagged with an inflated
    -- LevelRequired (100 / 550 / 1200) rather than a real job level.
    if (levelRequired >= 100) then
        local jpSpent = player:GetJobPointsSpent(jobId) or 0;
        local passed  = jpSpent >= levelRequired;
        DebugMessage(('JP check for %s (%s): spent %d, need %d -- %s')
            :format(spellName, JobIDs[jobId], jpSpent, levelRequired, passed and 'PASSED' or 'FAILED'));
        return passed;
    end

    if (levelRequired <= player:GetMainJobLevel()) then
        return true;
    end

    if (levelRequired <= player:GetSubJobLevel()) then
        return true;
    end

    return false;
end

local function CheckIfBurstingAllowed()
    local player   = AshitaCore:GetMemoryManager():GetPlayer();
    local jobShort = JobIDs[player:GetMainJob()];

    if (not table_contains(BurstJobs, jobShort)) then
        DebugMessage(('Burst control is blocked -- current main job (%s) is not in BurstJobs.'):format(tostring(jobShort)));
        return false;
    end

    if (CheckIfPlayerDisabled()) then
        DebugMessage('Burst control is blocked due to a status ailment.');
        return false;
    end

    return true;
end

local function IsPartyMember(serverId)
    if (serverId == nil or serverId == 0) then return false; end
    local party = AshitaCore:GetMemoryManager():GetParty();

    for i = 0, 17 do
        if (party:GetMemberName(i) ~= nil) then
            local memberId = party:GetMemberServerId(i);
            -- Force both to string to bypass any signed vs unsigned variable width matching errors
            if (tostring(memberId) == tostring(serverId)) then
                return true;
            end
        end
    end

    return false;
end

local function IsPetPartyMember(petTargetIndex)
    if (petTargetIndex == nil or petTargetIndex == 0) then return false; end
    local party  = AshitaCore:GetMemoryManager():GetParty();
    local entity = AshitaCore:GetMemoryManager():GetEntity();

    for i = 0, 17 do
        if (party:GetMemberName(i) ~= nil) then
            local memberIndex   = party:GetMemberTargetIndex(i);
            local memberPetIdx  = entity:GetPetTargetIndex(memberIndex);

            if (memberPetIdx ~= nil and memberPetIdx ~= 0) then
                local petServerId = entity:GetServerId(memberPetIdx);
                if (tostring(petServerId) == tostring(petTargetIndex)) then
                    return true;
                end
            end
        end
    end

    return false;
end

-- ============================================================================
-- Delayed-task queue.
--
-- Schedules a function to run after `delay` seconds, checked once per frame
-- from the d3d_beginscene poll further down. Used instead of ashita.tasks.once,
-- which isn't reliable across builds -- this has no dependency on Ashita's
-- own scheduling API, just os.clock() comparisons.
local scheduled_tasks = {};
local unpack_fn        = unpack or table.unpack; -- LuaJIT exposes the global 'unpack'; this covers either.

local function ScheduleOnce(delay, fn, ...)
    table.insert(scheduled_tasks, { run_at = os.clock() + delay, fn = fn, args = { ... } });
end

local function RunDueScheduledTasks()
    local now = os.clock();
    for i = #scheduled_tasks, 1, -1 do
        local task = scheduled_tasks[i];
        if (now >= task.run_at) then
            table.remove(scheduled_tasks, i);
            task.fn(unpack_fn(task.args));
        end
    end
end

-- Returns (name, hpPercent) for the currently selected target, or (nil, 0)
-- if nothing is targeted. ITarget only tracks *which entity index* is
-- targeted, so the actual name/HP lookup goes through the Entity manager.
local function GetCurrentTargetInfo()
    local target = AshitaCore:GetMemoryManager():GetTarget();
    local entity = AshitaCore:GetMemoryManager():GetEntity();

    local targetIndex = target:GetTargetIndex(0); -- 0 = primary target slot
    if (targetIndex == nil or targetIndex == 0) then
        return nil, 0;
    end

    return entity:GetName(targetIndex), entity:GetHPPercent(targetIndex);
end

-- Attempts to burst using `chain`'s elemental spell, starting from tier
-- index `startIndex` in TierOrder. On a successful cast, if we haven't hit
-- MaxBurstsPerChain yet, automatically schedules another attempt starting
-- from the *next* tier down the list after BurstChainDelay seconds -- this
-- is what lets AutoBurst chain several bursts within one skillchain window
-- (e.g. tier I, then tier II, then tier III...) instead of stopping after
-- the first successful cast, matching what you'd otherwise do by hand.
local function AttemptElementalBurstTier(chain, startIndex, burstsSoFar)
    local maxBursts = MaxBurstsPerChain or 1;
    if (burstsSoFar >= maxBursts) then
        return;
    end

    -- Re-check the target every time, in case it died or changed between chained burst attempts.
    local targetName, targetHpPercent = GetCurrentTargetInfo();
    if (targetName == nil or targetHpPercent < 1) then
        return;
    end

    -- Instantiate engine dependencies and scoping criteria
    local resources   = AshitaCore:GetResourceManager();
    local player      = AshitaCore:GetMemoryManager():GetPlayer();
    local jobShort     = JobIDs[player:GetMainJob()];
    local maxTierName  = MaxTierByJob and MaxTierByJob[jobShort] or 'VI';
    local maxTierRank  = TIER_RANK[maxTierName] or TIER_RANK['VI'];

    local SPELL_MAPPING_OVERRIDES = {
        ['Aspir']   = { ['I'] = 'Aspir', ['II'] = 'Aspir II', ['III'] = 'Aspir III' },
        ['Drain']   = { ['I'] = 'Drain', ['II'] = 'Drain II', ['III'] = 'Drain III' },
        ['Bio']     = { ['I'] = 'Bio',   ['II'] = 'Bio II',   ['III'] = 'Bio III'   },
        ['Death']   = { ['I'] = 'Death' },   
        ['Kaustra'] = { ['I'] = 'Kaustra' }, 
        ['Impact']  = { ['I'] = 'Impact' },  
    }

    for i = startIndex, #TierOrder do
        local tier     = TierOrder[i];
        local tierRank = TIER_RANK[tier];

        if (tierRank ~= nil and tierRank > maxTierRank) then
            DebugMessage(('Skipping tier %s -- above configured cap (%s) for %s.'):format(tier, maxTierName, jobShort));
        else
            local baseSpell = BurstMagic[chain];
            local spellName = nil;

            if (baseSpell ~= nil and baseSpell ~= 'void') then
                if (tier == 'Helix') then
                    spellName = HelixMagic and HelixMagic[baseSpell] or nil;
                elseif (tier == 'Helix II') then
                    local baseHelixName = HelixMagic and HelixMagic[baseSpell];
                    spellName = baseHelixName and (baseHelixName .. ' II') or nil;
                elseif SPELL_MAPPING_OVERRIDES[baseSpell] then
                    spellName = SPELL_MAPPING_OVERRIDES[baseSpell][tier];
                else
                    if (tier == 'I') then
                        spellName = baseSpell;
                    else
                        spellName = baseSpell .. ' ' .. tier;
                    end
                end
            end

            if (spellName ~= nil and spellName ~= 'void') then
                DebugMessage(('Checking spell: %s'):format(spellName));
                if (CanUseSpell(spellName) and SpellRecast(spellName) == 0) then
                    DebugMessage(('Spell can be used: %s'):format(spellName));

                    local cmd = ('/ma "%s" <t>'):format(spellName);
                    DebugMessage(('Attempting cast (%d/%d): %s'):format(burstsSoFar + 1, maxBursts, cmd));
                    QueueCmd(cmd);

                    if (burstsSoFar + 1 < maxBursts) then
                        local resSpell = resources:GetSpellByName(spellName, 0);
                        local dynamicDelay = BurstChainDelay or 3;
    
                        if resSpell and (string.match(spellName, "[Hh]elix") or spellName == "Death" or spellName == "Kaustra") then
                            dynamicDelay = dynamicDelay + 2.5; 
                        end

                        ScheduleOnce(dynamicDelay, AttemptElementalBurstTier, chain, i + 1, burstsSoFar + 1);
                    end

                    return;
                end
            end
        end
    end
end

-- ============================================================================
-- Burst logic
-- ============================================================================

local function RunBurst_Part2(prop, targetId)
    local chain = SkillchainID[prop];
    if (chain == nil) then
        return;
    end

    local party = AshitaCore:GetMemoryManager():GetParty();

    local targetName, targetHpPercent = GetCurrentTargetInfo();
    if (targetName == nil or targetHpPercent < 1) then
        return;
    end

    DebugMessage(('Current target: %s'):format(targetName));

    -- Chain-name check is parenthesized so all four names (Darkness, Umbra,
    -- Compression, Gravitation) share the same Aspir conditions -- otherwise
    -- Lua operator precedence lets the "and" clauses bind only to the last
    -- name, so the others would always try to Aspir regardless of buffs/MP.
    --
    -- No longer gated on KnownMP_monsters: that list requires hand-maintaining
    -- exact target names and silently blocks Aspir against anything not on
    -- it (e.g. this just missed on "Temenos Orc"). Casting Aspir on a target
    -- with no MP pool just wastes the cast/MP -- an acceptable tradeoff here.
    local wantsAspir =
        Aspir_NoBurst
        and (chain == 'Darkness' or chain == 'Umbra' or chain == 'Compression' or chain == 'Gravitation')
        and (not BuffActive(1))
        and (party:GetMemberMP(0) <= Aspir_MPAmount);

    if (wantsAspir) then
        print('\31\200\31\05Low MP Notice: \31\200\31\207 Attempting to recover MP with Aspir.');

        for _, spellName in ipairs({ 'Aspir III', 'Aspir II', 'Aspir' }) do
            if (CanUseSpell(spellName) and SpellRecast(spellName) == 0) then
                local cmd = ('/ma "%s" <t>'):format(spellName);
                DebugMessage(('Attempting cast: %s'):format(cmd));
                QueueCmd(cmd);
                break;
            end
        end
    else
        AttemptElementalBurstTier(chain, 1, 0);
    end
end

local function RunAssistCmd(prop, targetId)
    DebugMessage(('Setting target: %d'):format(targetId));
    QueueCmd('/target ' .. targetId);
    ScheduleOnce(2 + ExtendedDelay, RunBurst_Part2, prop, targetId);
end

local function RunBurst(prop, targetId)
    local chainName = SkillchainID[prop];
    if (chainName == nil) then
        return;
    end

    DebugMessage(('Skillchain located: %s'):format(chainName));

    if (CheckIfBurstingAllowed() and not isCasting) then
        DebugMessage('Burst possible.');
        RunAssistCmd(prop, targetId);
    else
        DebugMessage('Burst skipped (bursting not currently allowed).');
    end
end

-- ============================================================================
-- Player-state polling (silence removal)
--
-- v3's high-level 'gain_buff' event came from a helper layer on top of the
-- core packet hooks. Ashita v4's officially documented event set (see:
-- https://docs.ashitaxi.com) only lists the renamed core hook events
-- (packet_in, text_in, command, etc.) -- 'gain_buff' is not part of that
-- list, and relying on it without being able to verify it still fires in v4
-- risked silently doing nothing.
--
-- Instead, this polls the player's buffs once a second using only
-- confirmed-stable v4 calls. If your v4 build *does* still fire gain_buff,
-- you can swap this out for an event-driven version -- see the commented
-- block at the bottom of this file.
--
-- NOTE: Emergency/no-skillchain Aspir used to live here as TryEmergencyAspir(),
-- polled once a second off of MP alone, with no skillchain check at all --
-- that's what let Aspir fire with no skillchain in progress. Aspir_NoBurst
-- is now decided only inside RunBurst_Part2, which is only ever reached from
-- an actual detected skillchain (RunBurst -> CheckIfBurstingAllowed ->
-- RunAssistCmd), so Aspir_NoBurst still chooses Aspir over an elemental
-- burst, but only within a real skillchain window. See CHANGES.md.
-- ============================================================================

local function TryRemoveSilence()
    if (not AttemptSilenceRemoval) then
        return;
    end

    if (UseEchoDrops and ItemCount(4151) > 0) then
        QueueCmd('/item "Echo Drops" <me>');
    elseif (UseCatholicon and ItemCount(4206) > 0) then
        QueueCmd('/item "Catholicon" <me>');
    elseif (UseVicarsDrink and ItemCount(5439) > 0) then
        QueueCmd('/item "Vicar\'s Drink" <me>');
    elseif (UseRemedyOintment and ItemCount(5326) > 0) then
        QueueCmd('/item "Remedy Ointment" <me>');
    elseif (UseRemedy and ItemCount(4155) > 0) then
        QueueCmd('/item "Remedy" <me>');
    end
end

local function PollPlayerState()
    local silenceNow = BuffActive(6);
    if (silenceNow and not silence_was_active) then
        TryRemoveSilence();
    end
    silence_was_active = silenceNow;
end


-- ============================================================================
-- Events
-- ============================================================================

ashita.events.register('load', 'autoburst_load', function ()
    print(('\31\200[\31\05AutoBurst\31\200]\31\207 v%s loaded (DebugMode=%s).'):format(addon.version, tostring(DebugMode)));
end);

-- Drives the ~1x/second player-state poll, and the delayed-task queue above,
-- off the render loop instead of any ashita.tasks call.
local last_poll_time = 0;

ashita.events.register('d3d_beginscene', 'autoburst_present', function ()
    RunDueScheduledTasks();

    local now = os.clock();
    if (now - last_poll_time >= 1.0) then
        last_poll_time = now;
        PollPlayerState();
    end
end);

ashita.events.register('packet_in', 'autoburst_packet_in', function (e)

    if (e.id == 0x0B) then
        zoning = true;
        DebugMessage('Currently zoning.');
        return;
    elseif (e.id == 0x0A and zoning) then
        zoning = false;
        DebugMessage('No longer zoning.');
        return;
    end

    if (zoning or e.id ~= 0x28) then
        return;
    end

    local actor    = string.unpack('I4', e.data, 6); -- actor/UserID offset, verified against packet layout
    local category = unpack_be(e.data_raw, e.data, 82, 4);

    DebugMessage(('actor=%u category=%u'):format(actor, category));

    -- Diagnostic: logs every action from a category we care about regardless
    -- of whether the added-effect bit is set, so isParty/isPet/hasAddedEffect/
    -- rawProp can be checked directly when a burst isn't firing as expected.
    if (category == 3 or category == 4 or category == 7 or category == 11 or category == 13) then
        local isParty = IsPartyMember(actor);
        local isPet   = IsPetPartyMember(actor);
        local hasAddedEffect = unpack_be(e.data_raw, e.data, 271, 1);
        local rawProp        = unpack_be(e.data_raw, e.data, 299, 10);
        DebugMessage(('  [diag] isParty=%s isPet=%s hasAddedEffect=%s rawProp=%s (%s)')
            :format(tostring(isParty), tostring(isPet), tostring(hasAddedEffect), tostring(rawProp), tostring(SkillchainID[rawProp])));
    end

    if ((category == 3 or category == 7 or category == 11) and IsPartyMember(actor)) then
        -- Weaponskill
        if (unpack_be(e.data_raw, e.data, 271, 1) == 1) then
            local prop     = unpack_be(e.data_raw, e.data, 299, 10);
            local targetId = unpack_be(e.data_raw, e.data, 150, 32);
            DebugMessage(('Weaponskill added effect located: %s (prop=%d)'):format(tostring(SkillchainID[prop]), prop));
            RunBurst(prop, targetId);
        end
    elseif (category == 4 and IsPartyMember(actor)) then
        -- Magic (burst continuation)
        if (unpack_be(e.data_raw, e.data, 271, 1) == 1) then
            local prop     = unpack_be(e.data_raw, e.data, 299, 10);
            local targetId = unpack_be(e.data_raw, e.data, 150, 32);
            DebugMessage(('Magic added effect located: %s (prop=%d)'):format(tostring(SkillchainID[prop]), prop));
            RunBurst(prop, targetId);
        end
    elseif ((category == 13 or category == 11) and IsPetPartyMember(actor)) then
        -- Pet
        if (unpack_be(e.data_raw, e.data, 271, 1) == 1) then
            local prop     = unpack_be(e.data_raw, e.data, 299, 10);
            local targetId = unpack_be(e.data_raw, e.data, 150, 32);
            DebugMessage(('Pet added effect located: %s (prop=%d)'):format(tostring(SkillchainID[prop]), prop));
            RunBurst(prop, targetId);
        end
    end
end);

--[[
-- If you confirm your Ashita v4 build still fires the old high-level
-- 'gain_buff' event, you can delete the PollPlayerState task above and use
-- this instead:

ashita.events.register('gain_buff', 'autoburst_gain_buff', function (e)
    if (BuffActive(6)) then
        TryRemoveSilence();
    end
end);
--]]
