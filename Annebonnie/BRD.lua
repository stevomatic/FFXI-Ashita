-- DT set is empty but that set can be toggled on and off with /lac fwd Dt --

local profile = {};
local sets = {
    Idle = {
		Range = 'Linos',
        Ammo = 'Displaced',
        Head = 'Fili Calot +3',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Nyame Mail',
        Hands = 'Fili Manchettes +3',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Intarabus\'s Cape', -- mev --
        Waist = 'Carrier\'s Sash',
        Legs = 'Fili Rhingrave +3',
        Feet = 'Nyame Sollerets',
    },
	SW = {
		Main = 'Carnwenhan',
		Sub = 'Ammurapi Shield',
	},
	DW = {
		Main = 'Naegling',
		Sub = 'Crepuscular Knife',
	},
	Tp = {
		Range = 'Linos', -- 15 att/acc  4stp 3qatt --
        Ammo = 'Displaced',
        Head = 'Bunzi\'s Hat',
        Neck = 'Bard\'s Charm +2',
        Ear1 = 'Cessance Earring',
        Ear2 = 'Telos Earring',
        Body = 'Revelation Plate.',
        Hands = 'Bunzi\'s Gloves',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Moonlight Ring',
        Back = 'Intarabus\'s Cape', -- dex acc/att acc dw --
        Waist = 'Sailfi Belt +1',
        Legs = 'Revelation Brais',
        Feet = 'Revelation Sab.',
    },
    Mordant = {
		Range = 'Linos', -- 15 att/acc  4stp 3qatt --
        Ammo = 'Displaced',
        Head = 'Nyame Helm',
        Neck = 'Bard\'s Charm +2',
        Ear1 = 'Regal Earring',
        Ear2 = 'Ishvara Earring',
        Body = 'Bihu Just. +4',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Intarabus\'s Cape', -- 20+10 CHR acc/att wsd mev --
        Waist = 'Kentarch Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Savage = {
		Range = 'Linos', -- 15 att/acc  4stp 3qatt --
        Ammo = 'Displaced',
        Head = 'Nyame Helm',
        Neck = 'Rep. Plat. Medal',
        Ear1 = 'Regal Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Bihu Just. +4',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Intarabus\'s Cape', -- 20+10 str acc/att 10 wsd mev --
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Precast = {
		Range = 'Gjallarhorn',
        Ammo = 'Displaced',
        Head = 'Bunzi\'s Hat',		  -- 10 --
        Neck = 'Voltsurge Torque',	  --  4 --
        Ear1 = 'Loquac. Earring',     --  2 --
        Ear2 = 'Enchntr. Earring +1', --  2 --
        Body = 'Inyanga Jubbah +2',   -- 14 -- 
        Hands = 'Chironic Gloves',    --  7 --
        Ring1 = 'Prolix Ring',        --  2 -- 
        Ring2 = 'Kishar Ring',		  --  4 --
        Back = 'Intarabus\'s Cape',   -- 10 --
        Waist = 'Embla Sash',         --  5 -- 
        Legs = 'Chironic Hose',       --  7 --
        Feet = 'Fili Cothurnes +3',   -- 13 82% --
    },
    PreHonor = {
		Range = 'Marsyas',
        Ammo = 'Displaced',
        Head = 'Bunzi\'s Hat',		  -- 10 --
        Neck = 'Voltsurge Torque',	  --  4 --
        Ear1 = 'Loquac. Earring',     --  2 --
        Ear2 = 'Enchntr. Earring +1', --  2 --
        Body = 'Inyanga Jubbah +2',   -- 14 -- 
        Hands = 'Chironic Gloves',    --  7 --
        Ring1 = 'Prolix Ring',        --  2 -- 
        Ring2 = 'Kishar Ring',		  --  4 --
        Back = 'Intarabus\'s Cape',   -- 10 --
        Waist = 'Embla Sash',         --  5 -- 
        Legs = 'Chironic Hose',       --  7 --
        Feet = 'Fili Cothurnes +3',   -- 13 80% --
    },
    PreAria = {
		Range = 'Loughnashade',
        Ammo = 'Displaced',  
        Head = 'Bunzi\'s Hat',		  -- 10 --
        Neck = 'Voltsurge Torque',	  --  4 --
        Ear1 = 'Loquac. Earring',     --  2 --
        Ear2 = 'Enchntr. Earring +1', --  2 --
        Body = 'Inyanga Jubbah +2',   -- 14 -- 
        Hands = 'Chironic Gloves',    --  7 --
        Ring1 = 'Prolix Ring',        --  2 -- 
        Ring2 = 'Kishar Ring',		  --  4 --
        Back = 'Intarabus\'s Cape',   -- 10 --
        Waist = 'Embla Sash',         --  5 -- 
        Legs = 'Chironic Hose',       --  7 --
        Feet = 'Fili Cothurnes +3',   -- 13 80% --
    },
    PreHorde = {
		Range = 'Daurdabla',
        Ammo = 'Displaced',
        Head = 'Bunzi\'s Hat',		  -- 10 --
        Neck = 'Voltsurge Torque',	  --  4 --
        Ear1 = 'Loquac. Earring',     --  2 --
        Ear2 = 'Enchntr. Earring +1', --  2 --
        Body = 'Inyanga Jubbah +2',   -- 14 -- 
        Hands = 'Chironic Gloves',    --  7 --
        Ring1 = 'Prolix Ring',        --  2 -- 
        Ring2 = 'Kishar Ring',		  --  4 --
        Back = 'Intarabus\'s Cape',   -- 10 --
        Waist = 'Embla Sash',         --  5 -- 
        Legs = 'Chironic Hose',       --  7 --
        Feet = 'Fili Cothurnes +3',   -- 13 80% --
    },
    Wind = {
		Main = 'Carnwenhan',
		Sub = 'Ammurapi Shield',
		Range = 'Gjallarhorn',
        Ammo = 'Displaced',   
        Head = 'Brioso Roundlet +4',
        Neck = 'Mnbw. Whistle +1',	
        Ear1 = 'Regal Earring',
        Ear2 = 'Fili Earring +1',
        Body = 'Brioso Justau. +3', 
        Hands = 'Brioso Cuffs +4',
        Ring1 = 'Metamor. Ring +1', 
        Ring2 = 'Stikini Ring +1',
        Back = 'Intarabus\'s Cape', -- 20 chr 20+10 macc --
        Waist = 'Null Belt', 
        Legs = 'Brioso Cannions +3',
        Feet = 'Brioso Slippers +4',
    },
    Horde = {
		Main = 'Kali', -- string skill +10 --
		Sub = 'Ammurapi Shield',
		Range = 'Daurdabla',
        Ammo = 'Displaced',   
        Head = 'Brioso Roundlet +4',
        Neck = 'Mnbw. Whistle +1',	
        Ear1 = 'Gersemi Earring',
        Ear2 = 'Darkside Earring',
        Body = 'Brioso Justau. +3', 
        Hands = 'Brioso Cuffs +4',
        Ring1 = 'Stikini Ring +1', 
        Ring2 = 'Stikini Ring +1',
        Back = 'Harfner\'s Sash',
        Waist = 'Null Belt', 
        Legs = 'Brioso Cannions +3',
        Feet = 'Bihu Slippers +4',
    },
	Cure = {
		Main = 'Daybreak',
        Ammo = 'Displaced',   
        Head = 'Kaykaus Mitra +1',
        Neck = 'Nodens Gorget',	
        Ear1 = 'Mendi. Earring',
        Body = 'Kaykaus Bliaut +1', 
        Hands = 'Kaykaus Cuffs +1',
        Ring1 = 'Lebeche Ring', 
        Ring2 = 'Naji\'s Loop',
        Back = 'Solemnity Cape',
        Legs = 'Kaykaus Tights +1',
        Feet = 'Kaykaus Boots +1',
	},
	Cursna = {
        Head = 'Kaykaus Mitra +1',
        Neck = 'Debilis Medallion',	
        Ear1 = 'Meili Earring',
        Ear2 = 'Beatific Earring', 
        Hands = 'Hieros Mittens',
        Ring1 = 'Menelaus\'s Ring', 
        Ring2 = 'Haoma\'s Ring',
        Back = 'Oretan. Cape +1',
        Waist = 'Bishop\'s Sash', 
        Feet = 'Gende. Galosh. +1',	
	},
	Movement = {
		Feet = 'Fili Cothurnes +3',
	},
	-- Placeholders - fill in with real gear whenever it's worth building out.
    -- DT set can be toggled on and off with /lac fwd Dt --
	Resting = {
	},
	Dt = {
	},
	Self_Cure = {
	},
	Self_Cursna = {
	},
	Enhancing = {
		-- Shared set for Enhancing Magic AND Ninjutsu midcast
	},
};
profile.Sets = sets;

profile.Packer = {
    { Name = 'Prism Powder', Quantity = 'all' },
    { Name = 'Panacea', Quantity = 'all' },
    { Name = 'Silent Oil', Quantity = 'all' },
    { Name = 'Befouled Water', Quantity = 'all' },
    { Name = 'Copper Voucher', Quantity = 'all' },
    { Name = 'Silver Voucher', Quantity = 'all' },
    { Name = 'Holy Water', Quantity = 'all' },
    { Name = 'Echo Drops', Quantity = 'all' },
    { Name = 'Warp Ring', Quantity = 'all' },
    { Name = 'Dim. Ring (Dem)', Quantity = 'all' },
    { Name = 'Instant Warp', Quantity = 'all' },
    { Name = 'Instant Reraise', Quantity = 'all' },
    { Name = 'Tropical Crepe', Quantity = 'all' },
    { Name = 'Miso Ramen', Quantity = 'all' },
};

--======================================================
-- 1) SONG -> INSTRUMENT RESOLUTION
--======================================================
-- Priority order (highest first):
--   1. Hard-requirement songs   -> must use that exact instrument or the song won't land
--   2. Manual "singstring" flag -> forces Daurdabla for any song except the hard requirements
--   3. Fallback                 -> Gjallarhorn (default wind instrument for every other song)

-- 1. Hard requirements - the song literally cannot be cast without this instrument,
--    and singstring has no effect on these - they always use their own instrument.
local HARD_REQUIREMENT = {
    ['Honor March']    = 'Marsyas',
    ['Aria of Passion'] = 'Loughnashade',
};

-- (No separate per-instrument Range-only table needed anymore - Precast picks
-- one of sets.PreHonor / sets.PreAria / sets.Horde / sets.Precast outright,
-- and Midcast reuses that exact same set, so the instrument never changes
-- mid-cast.)

-- Single-slot overrides layered on top of sets.Wind ONLY (Gjallarhorn songs).
-- Horde/PreHonor/PreAria songs don't use this table.
local WIND_SONG_OVERRIDE = {
    ["Sentinel's Scherzo"] = { Feet  = 'Fili Cothurnes +3' },
    ['March']              = { Hands = 'Fili Manchettes +3' },
    ['Madrigal']           = { Head  = 'Fili Calot +3' },
    ["Mage's Ballad"]      = { Legs  = 'Fili Rhingrave +3' },
    ["Army's Paeon"]       = { Head  = 'Brioso Roundlet +4' },
    ['Threnody']           = { Body  = 'Mou. Manteel +1' },
    ['Carol']              = { Hands = 'Mousai Gages +1' },
    ['Minne']              = { Legs  = 'Mou. Seraweels +1' },
    ['Mambo']              = { Feet  = 'Mou. Crackows +1' },
    ['Etude']              = { Head  = 'Mousai Turban +1' },
};

-- Holds the instrument chosen for the song currently being cast, so Midcast
-- can reuse it instead of calling ResolveInstrument again.
local currentSongInstrument = nil;

-- One-shot flag for /singstring - set true by the command, consumed (read + cleared)
-- the instant the next song's precast fires. Never lingers into subsequent songs.
local singStringPending = false;

-- Call this from profile.HandleCommand when the player types /singstring
local function TriggerSingString()
    singStringPending = true;
end

-- Reads the flag AND clears it in the same call - this is what makes it one-shot.
local function ConsumeSingString()
    local wasPending = singStringPending;
    singStringPending = false;
    return wasPending;
end

-- NOTE: instrument selection is now handled directly in HandlePrecast (for the
-- two hard-requirement songs) and HandleMidcast (for the Gjallarhorn/Daurdabla
-- choice, since that's where singstring is actually consumed). See those
-- handlers below rather than a single shared resolver function.

--======================================================
-- 2) WEAPON MODE TOGGLE (SW / DW) F5 cycles Main and Sub
--======================================================
-- SW = single wield main+sub combo, DW = dual wield combo.
-- Same manual array+index pattern as your SAM.lua TpModes/CurrentTpMode -
-- no gcdisplay involved. F5 (bound in OnLoad) sends /lac fwd cycleweapon,
-- which HandleCommand below picks up via args[1].
local WeaponModes = {
    'SW',
    'DW',
};
local CurrentWeaponMode = 1;

local function GetWeaponMode()
    return WeaponModes[CurrentWeaponMode];
end

-- Manual Dt toggle - same style as the weapon mode/singstring state above.
-- Placeholder set (sets.Dt is currently empty) until it's worth building out.
local DtActive = false;

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 002');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 002');
    AshitaCore:GetChatManager():QueueCommand(1, '/bind = /lac fwd cycleweapon');
    gFunc.Message('Weapon Mode: ' .. WeaponModes[CurrentWeaponMode]);

    -- Lets you type /singstring Song Name <target> directly, no quotes needed.
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /singstring /lac fwd singstring');
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/unbind =');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /singstring');
end

profile.HandleCommand = function(args)
    if (args[1] == 'cycleweapon') then
        CurrentWeaponMode = CurrentWeaponMode + 1;
        if (CurrentWeaponMode > #WeaponModes) then
            CurrentWeaponMode = 1;
        end
        gFunc.Message('Weapon Mode: ' .. WeaponModes[CurrentWeaponMode]);
        return;

    elseif (args[1] == 'singstring') then
        TriggerSingString();

        if (#args > 1) then
            -- Pull off a trailing <target> token if you included one, everything
            -- else becomes the song name. The song name always gets wrapped in
            -- quotes - that's correct retail /ma syntax, and Shorthand accepts
            -- quoted input fine too, so this works either way.
            local target = nil;
            local nameParts = {};
            for i = 2, #args do
                if (i == #args) and (string.sub(args[i], 1, 1) == '<') then
                    target = args[i];
                else
                    table.insert(nameParts, args[i]);
                end
            end

            local songName = table.concat(nameParts, ' ');
            local cmd = '/ma "' .. songName .. '"';
            if (target ~= nil) then
                cmd = cmd .. ' ' .. target;
            end
            AshitaCore:GetChatManager():QueueCommand(1, cmd);
        end

        gFunc.Message('Next song will use Daurdabla.');
        return;

    elseif (args[1] == 'dt') then
        DtActive = not DtActive;
        gFunc.Message('Dt Set: ' .. tostring(DtActive));
        return;
    end
end

profile.HandleDefault = function()
    gFunc.EquipSet(sets.Idle);
    local player = gData.GetPlayer();

    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
        gFunc.EquipSet(sets.Movement);
    end

    -- Weapon mode overlay applies on top regardless of status (Idle or Tp),
    -- since sets.SW / sets.DW only carry Main/Sub and you're never unarmed.
    gFunc.EquipSet(sets[GetWeaponMode()]); -- sets.SW or sets.DW

    if (DtActive == true) then gFunc.EquipSet(sets.Dt); end

    -- (gcinclude.CheckDefault() removed - that library isn't part of your setup)
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    if (ability.Name == 'Soul Voice') then
        gFunc.EquipSet({ Legs = 'Bihu Cannions +4' });
    elseif (ability.Name == 'Troubadour') then
        gFunc.EquipSet({ Body = 'Bihu Just. +4' });
    elseif (ability.Name == 'Nightingale') then
        gFunc.EquipSet({ Feet = 'Bihu Slippers +4' });
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();

    if (spell.Skill == 'Singing') then
        -- Resolve the instrument ONCE, here, so it's on before the cast starts.
        -- Midcast just reuses currentSongInstrument - it does not re-resolve.
        if string.contains(spell.Name, 'Honor March') then
            currentSongInstrument = 'Marsyas';
            gFunc.EquipSet(sets.PreHonor);

        elseif string.contains(spell.Name, 'Aria of Passion') then
            currentSongInstrument = 'Loughnashade';
            gFunc.EquipSet(sets.PreAria);

        elseif string.contains(spell.Name, 'Horde Lullaby') then
            -- covers both 'Horde Lullaby' and 'Horde Lullaby II'
            currentSongInstrument = 'Daurdabla';
            gFunc.EquipSet(sets.PreHorde);

        elseif ConsumeSingString() then
            currentSongInstrument = 'Daurdabla';
            gFunc.EquipSet(sets.PreHorde);

        else
            currentSongInstrument = 'Gjallarhorn';
            gFunc.EquipSet(sets.Precast);
        end

    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Precast); -- reusing general fast-cast until you build a dedicated Cure_Precast

    elseif (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Precast); -- same, until/if you want a dedicated Enhancing_Precast

    elseif (spell.Skill == 'Ninjutsu') then
    end

    -- (gcinclude.CheckCancels() removed - that library isn't part of your setup)
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (spell.Skill == 'Singing') then
        -- Whatever set Precast picked based on currentSongInstrument carries
        -- through unchanged - no instrument switches mid-cast.
        if (currentSongInstrument == 'Daurdabla') then
            gFunc.EquipSet(sets.Horde);
        elseif (currentSongInstrument == 'Marsyas') then
            gFunc.EquipSet(sets.PreHonor);
        elseif (currentSongInstrument == 'Loughnashade') then
            gFunc.EquipSet(sets.PreAria);
        else
            gFunc.EquipSet(sets.Wind);
            for songName, override in pairs(WIND_SONG_OVERRIDE) do
                if string.contains(spell.Name, songName) then
                    gFunc.EquipSet(override);
                    break;
                end
            end
        end

    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
        if string.match(spell.Name, 'Cursna') then
            gFunc.EquipSet(sets.Cursna);
            if (target.Name == me) then gFunc.EquipSet(sets.Self_Cursna); end
        elseif (target.Name == me) then
            gFunc.EquipSet(sets.Self_Cure);
        end

    elseif (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);

    elseif (spell.Skill == 'Ninjutsu') then
        gFunc.EquipSet(sets.Enhancing); -- shared with Enhancing Magic
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    -- (gcinclude.CheckWsBailout() removed - no distance-safety library present,
    -- so there's currently no bailout check at all. Let me know if you want a
    -- simple distance check built in directly here instead.)
    local ws = gData.GetAction();
    if string.contains(ws.Name, 'Mordant') then
        gFunc.EquipSet(sets.Mordant);
    elseif string.contains(ws.Name, 'Savage') then
        gFunc.EquipSet(sets.Savage);
    end
    -- Mordant/Savage already specify Range - if either WS set should also swap
    -- Main/Sub relative to your current SW/DW mode, overlay it here:
    -- gFunc.EquipSet(sets[GetWeaponMode()]);
end

return profile;