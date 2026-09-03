local profile = {};
local sets = {
    Idle = {
        Sub = 'Refined Grip +1',
        Ammo = 'Homiliary',
        Head = 'Null Masque',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Tuisto Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Runeist Coat +4',
        Hands = 'Regal Gauntlets',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Gelatinous Ring +1',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = 'Parrying rate+5%', [2] = 'Evasion+20', [3] = 'HP+60', [4] = 'Mag. Evasion+30', [5] = 'Enmity+10' } },
        Waist = 'Engraved Belt',
        Legs = 'Eri. Leg Guards +3',
        Feet = 'Erilaz Greaves +3',
    },
    Resting = {
        Sub = 'Refined Grip +1',
        Ammo = 'Homiliary',
        Head = 'Null Masque',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Tuisto Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Runeist Coat +4',
        Hands = 'Regal Gauntlets',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Gelatinous Ring +1',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = 'Parrying rate+5%', [2] = 'Evasion+20', [3] = 'HP+60', [4] = 'Mag. Evasion+30', [5] = 'Enmity+10' } },
        Waist = 'Engraved Belt',
        Legs = 'Eri. Leg Guards +3',
        Feet = 'Erilaz Greaves +3',
    },
    TpTank = {
        Sub = 'Refined Grip +1',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Erilaz Galea +3',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Odnowa Earring +1',
        Ear2 = 'Erilaz Earring +1',
        Body = 'Erilaz Surcoat +3',
        Hands = 'Erilaz Gauntlets +3',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Moonlight Ring',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = 'Parrying rate+5%', [2] = 'Evasion+20', [3] = 'HP+60', [4] = 'Mag. Evasion+30', [5] = 'Enmity+10' } },
        Waist = 'Plat. Mog. Belt',
        Legs = 'Eri. Leg Guards +3',
        Feet = 'Erilaz Greaves +3',
    },
    TpMev = {
        Sub = 'Irenic Strap +1',
        Ammo = 'Yamarang',
        Head = 'Sworn Crown',
        Neck = 'Futhark Torque +2',
        Ear1 = 'Hearty Earring',
        Ear2 = 'Erilaz Earring +1',
        Body = 'Runeist Coat +4',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = 'Parrying rate+5%', [2] = 'Evasion+20', [3] = 'HP+60', [4] = 'Mag. Evasion+30', [5] = 'Enmity+10' } },
        Waist = 'Engraved Belt',
        Legs = 'Agwu\'s Slops',
        Feet = 'Erilaz Greaves +3',
    },
    TpParry = {
        Sub = 'Refined Grip +1',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Nyame Helm',
        Neck = 'Futhark Torque +2',
        Ear1 = 'Hermodr Earring',
        Ear2 = 'Erilaz Earring +1',
        Body = 'Nyame Mail',
        Hands = 'Turms Mittens +1',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = 'Parrying rate+5%', [2] = 'Evasion+20', [3] = 'HP+60', [4] = 'Mag. Evasion+30', [5] = 'Enmity+10' } },
        Waist = 'Engraved Belt',
        Legs = 'Eri. Leg Guards +3',
        Feet = 'Turms Leggings +1',
    },
    TpDmg = {
        Sub = 'Utu Grip',
        Ammo = 'Aurgelmir Orb +1',
        Head = 'Sworn Crown',
        Neck = 'Anu Torque',
        Ear1 = 'Dedition Earring',
        Ear2 = 'Alabaster Earring',
        Body = 'Ashera Harness',
        Hands = 'Sworn Gauntlets',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Moonlight Ring',
        Back = { Name = 'Ogma\'s Cape', Augment = { [1] = 'Parrying rate+5%', [2] = 'Evasion+20', [3] = 'HP+60', [4] = 'Mag. Evasion+30', [5] = 'Enmity+10' } },
        Waist = 'Gerdr Belt +1',
        Legs = 'Samnuha Tights',
        Feet = 'Sworn Sabatons',
    },
    ElementalSforzo = {
        Body = 'Futhark Coat +3',
    },
    Vallation = {
        Body = 'Runeist Coat +4',
        Back = 'Ogma\'s Cape',
    },
    Swordplay = {
        Hands = 'Futhark Mitons +3',
    },
    Lunge_Swipe = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Agwu\'s Cap',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Friomisi Earring',
        Ear2 = 'Hermetic Earring',
        Body = 'Agwu\'s Robe',
        Hands = 'Agwu\'s Gages',
        Ring1 = 'Shiva Ring +1',
        Ring2 = 'Shiva Ring +1',
        Back = 'Ogma\'s Cape',
        Waist = 'Orpheus\'s Sash',
        Legs = 'Agwu\'s Slops',
        Feet = 'Agwu\'s Pigaches',
    },
    Pflug = {
        Feet = 'Runeist Bottes +2',
    },
    Valiance = {
        Body = 'Runeist Coat +4',
        Back = 'Ogma\'s Cape',
    },
    Embolden = {
        Back = 'Evasionist\'s Cape',
    },
    VivaciousPulse = {
        Head = 'Erilaz Galea +3',
        Neck = 'Hoxne Torque',
        Ear1 = 'Beatific Earring',
        Ear2 = 'Saxnot Earring',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Waist = 'Bishop\'s Sash',
        Legs = 'Rune. Trousers +2',
    },
    Gambit = {
        Hands = 'Runeist Mitons +2',
    },
    Battuta = {
        Head = 'Fu. Bandeau +3',
    },
    Rayke = {
        Feet = 'Futhark Boots +3',
    },
    Liement = {
        Body = 'Futhark Coat +3',
    },
    OneForAll = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Rune. Bandeau +2',
        Neck = 'Unmoving Collar +1',
        Ear1 = 'Tuisto Earring',
        Ear2 = 'Odnowa Earring +1',
        Body = 'Runeist Coat +4',
        Hands = 'Regal Gauntlets',
        Ring1 = 'Gelatinous Ring',
        Ring2 = 'Moonlight Ring',
        Back = 'Moonlight Cape',
        Waist = 'Plat. Mog. Belt',
        Legs = 'Futhark Trousers +3',
        Feet = 'Turms Leggings +1',
    },
    Precast = {
        Ammo = 'Sapience Orb',
        Head = 'Rune. Bandeau +2',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Enchntr. Earring +1',
        Body = 'Erilaz Surcoat +3',
        Hands = 'Agwu\'s Gages',
        Ring1 = 'Weather. Ring',
        Ring2 = 'Kishar Ring',
        Back = { Name = 'Ogma\'s Cape', Augment = '"Fast Cast"+10' },
        Legs = 'Agwu\'s Slops',
        Feet = 'Carmine Greaves +1',
    },
    Phalanx = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Fu. Bandeau +3',
        Neck = 'Futhark Torque +2',
        Ear1 = 'Mimir Earring',
        Ear2 = 'Erilaz Earring +1',
        Body = 'Sworn Platemail',
        Hands = 'Sworn Gauntlets',
        Ring1 = 'Gelatinous Ring',
        Ring2 = 'Moonlight Ring',
        Back = 'Ogma\'s Cape',
        Waist = 'Engraved Belt',
        Legs = 'Sworn Brais',
        Feet = 'Sworn Sabatons',
    },
    Regen = {
        Head = 'Rune. Bandeau +2',
        Neck = 'Sacro Gorget',
        Ear1 = 'Mimir Earring',
        Ear2 = 'Erilaz Earring +1',
        Hands = 'Regal Gauntlets',
        Waist = 'Sroda Belt',
        Legs = 'Futhark Trousers +3',
    },
    Cure = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Null Masque',
        Neck = 'Sacro Gorget',
        Ear1 = 'Mendi. Earring',
        Ear2 = 'Tuisto Earring',
        Body = 'Runeist Coat +4',
        Hands = 'Futhark Mitons +3',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Murky Ring',
        Back = 'Ogma\'s Cape',
        Waist = 'Sroda Belt',
        Legs = 'Eri. Leg Guards +3',
        Feet = 'Erilaz Greaves +3',
    },
    Enhancing = {
        Neck = 'Hoxne Torque',
        Ear1 = 'Andoaa Earring',
        Ear2 = 'Mimir Earring',
        Hands = 'Runeist Mitons +2',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Ogma\'s Cape',
        Waist = 'Olympus Sash',
    },
    Enmity = {
        Ammo = 'Aqreqaq Bomblet',
        Head = 'Halitus Helm',
        Neck = 'Unmoving Collar +1',
        Ear1 = 'Tuisto Earring',
        Ear2 = 'Cryptic Earring',
        Body = 'Emet Harness +1',
        Hands = 'Futhark Mitons +3',
        Ring1 = 'Eihwaz Ring',
        Ring2 = 'Supershear Ring',
        Back = 'Ogma\'s Cape',
        Waist = 'Kasiri Belt',
        Legs = 'Eri. Leg Guards +3',
        Feet = 'Erilaz Greaves +3',
    },
    SIRD = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Erilaz Galea +3',
        Neck = 'Moonlight Necklace',
        Ear1 = 'Magnetic Earring',
        Hands = 'Regal Gauntlets',
        Back = 'Ogma\'s Cape',
        Waist = 'Audumbla Sash',
        Legs = 'Carmine Cuisses +1',
    },
    Dimidiation = {
        Ammo = 'Knobkierrie',
        Head = 'Nyame Helm',
        Neck = 'Rep. Plat. Medal',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Niqmaddu Ring',
        Back = 'Ogma\'s Cape',
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Fimbulvetr_Savage = {
        Ammo = 'Knobkierrie',
        Head = 'Nyame Helm',
        Neck = 'Futhark Torque +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Sroda Ring',
        Back = 'Ogma\'s Cape',
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Resolution = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Sworn Crown',
        Neck = 'Fotia Gorget',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Sworn Platemail',
        Hands = 'Sworn Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Niqmaddu Ring',
        Back = 'Ogma\'s Cape',
        Waist = 'Fotia Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Sworn Sabatons',
    },
};
profile.Sets = sets;

-- ===================== Config & States =====================

local Weapons = {
    [1] = { Name = 'Epeolatry' },
    [2] = { Name = 'Aettir' },
    [3] = { Name = 'Lionheart' },
    [4] = { Name = 'Morgelai' },
    [5] = { Name = 'Helheim' },
    [6] = { Name = 'Naegling' },
};

local TpSets = {
    [1] = 'TpTank',
    [2] = 'TpMev',
    [3] = 'TpParry',
    [4] = 'TpDmg',
};

local Settings = {
    TpIndex = 1,
    WeaponIndex = 1,
    SirdOn = false,
};

local AbilitySets = {
    ['Vallation']        = 'Vallation',
    ['Valiance']         = 'Valiance',
    ['Pflug']            = 'Pflug',
    ['Embolden']         = 'Embolden',
    ['Vivacious Pulse']  = 'VivaciousPulse',
    ['Gambit']           = 'Gambit',
    ['Battuta']          = 'Battuta',
    ['Rayke']            = 'Rayke',
    ['Liement']          = 'Liement',
    ['One for All']      = 'OneForAll',
    ['Elemental Sforzo'] = 'ElementalSforzo',
    ['Swordplay']        = 'Swordplay',
    ['Lunge']            = 'Lunge_Swipe',
    ['Swipe']            = 'Lunge_Swipe',
};

-- Rune auto-maintenance: each rune has no dedicated gear of its own (see the
-- exclusion in HandleAbility below), just a periodic check that re-fires the
-- JA whenever the corresponding buff has dropped.
local RuneOrder = { 'Ignis', 'Gelus', 'Flabra', 'Tellus', 'Sulpor', 'Unda', 'Lux', 'Tenebrae' };
local RuneToggle = {
    Ignis = false, Gelus = false, Flabra = false, Tellus = false,
    Sulpor = false, Unda = false, Lux = false, Tenebrae = false,
};
local RuneNameByLower = {};
for _, runeName in ipairs(RuneOrder) do RuneNameByLower[runeName:lower()] = runeName; end

local lastRuneAttempt = 0;
local RUNE_RETRY_DELAY = 3; -- seconds between reapply attempts, avoids JA-spam
local RUNE_STACK_CAP = 3;   -- max stacks of any one rune; adjust if your server/merits differ

local function CheckRuneMaintenance()
    local now = os.clock();
    if (now - lastRuneAttempt) < RUNE_RETRY_DELAY then return end
    for _, runeName in ipairs(RuneOrder) do
        if RuneToggle[runeName] then
            local count = gData.GetBuffCount(runeName);
            if count < RUNE_STACK_CAP then
                AshitaCore:GetChatManager():QueueCommand(1, '/ja "' .. runeName .. '" <me>');
                lastRuneAttempt = now;
                return; -- one JA attempt per pass; they share a recast lockout anyway
            end
        end
    end
end

-- ===================== Persistence (BST-Style File Path) =====================

-- Per-character file, since the original single shared filename would have
-- mixed state between every character using this profile.
local function GetSettingsFile()
    local charName = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
    if (charName == nil or charName == '') then charName = 'default' end
    return string.format('%s\\config\\addons\\luashitacast\\run_state_%s.txt', AshitaCore:GetInstallPath(), charName);
end

local function SaveState()
    local f = io.open(GetSettingsFile(), 'w');
    if (f ~= nil) then
        local runeVals = {};
        for _, runeName in ipairs(RuneOrder) do
            table.insert(runeVals, RuneToggle[runeName] and '1' or '0');
        end
        -- Saves as comma-separated: TpIndex, WeaponIndex, SirdOn (1/0), then one 1/0 per rune in RuneOrder
        f:write(string.format('%d,%d,%d,%s', Settings.TpIndex, Settings.WeaponIndex, Settings.SirdOn and 1 or 0, table.concat(runeVals, ',')));
        f:close();
    end
end

local function LoadState()
    local f = io.open(GetSettingsFile(), 'r');
    if (f == nil) then return; end
    local contents = f:read('*all');
    f:close();

    if (contents == nil or contents == '') then return; end

    local parts = {};
    for piece in contents:gmatch('[^,]+') do table.insert(parts, tonumber(piece)) end
    if (#parts < 3) then return; end

    Settings.TpIndex = parts[1] or 1;
    Settings.WeaponIndex = parts[2] or 1;
    Settings.SirdOn = (parts[3] == 1);
    for i, runeName in ipairs(RuneOrder) do
        local v = parts[3 + i];
        if (v ~= nil) then RuneToggle[runeName] = (v == 1) end
    end

    gFunc.Message(string.format('RUN State Restored | TP: %s | Weapon: %s | SIRD: %s',
        TpSets[Settings.TpIndex], Weapons[Settings.WeaponIndex].Name, Settings.SirdOn and 'ON' or 'OFF'));
end

-- ===================== Helpers =====================

local function PrintState()
    gFunc.Message(string.format('TP Set: %s | Weapon: %s | SIRD: %s', 
        TpSets[Settings.TpIndex], 
        Weapons[Settings.WeaponIndex].Name, 
        Settings.SirdOn and 'ON' or 'OFF'
    ));
end

local function ApplyWeapon()
    local weapon = Weapons[Settings.WeaponIndex];
    gFunc.Equip('main', weapon.Name);
    if (weapon.Sub ~= nil) then
        gFunc.Equip('sub', weapon.Sub);
    end
end

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
    { Name = 'Epeolatry', Quantity = 'all' },
    { Name = 'Aettir', Quantity = 'all' },
    { Name = 'Lionheart', Quantity = 'all' },
    { Name = 'Venus Orb', Quantity = 'all' },
    { Name = 'Naegling', Quantity = 'all' },
    { Name = 'Morgelai', Quantity = 'all' },
    { Name = 'Helheim', Quantity = 'all' },
    { Name = 'Instant Reraise', Quantity = 'all' },
    { Name = 'Mars Orb', Quantity = 'all' },
    { Name = 'Miso Ramen', Quantity = 'all' },
};

-- ===================== Lifecycle =====================

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    LoadState();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 008');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 008');

    -- Aliases and Binds
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /cycletp /lac fwd cycletp');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /cycleweapon /lac fwd cycleweapon');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /sird /lac fwd sird');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /togglesird /lac fwd sird');
    for _, runeName in ipairs(RuneOrder) do
        AshitaCore:GetChatManager():QueueCommand(1, '/alias /' .. runeName:lower() .. ' /lac fwd ' .. runeName:lower());
    end
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /runeoff /lac fwd runeoff');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /runestatus /lac fwd runestatus');

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^- /cycletp');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^= /cycleweapon');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^s /sird');
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^-');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^=');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^s');

    AshitaCore:GetChatManager():QueueCommand(1, '/alias del /cycletp');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias del /cycleweapon');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias del /sird');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias del /togglesird');
    for _, runeName in ipairs(RuneOrder) do
        AshitaCore:GetChatManager():QueueCommand(1, '/alias del /' .. runeName:lower());
    end
    AshitaCore:GetChatManager():QueueCommand(1, '/alias del /runeoff');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias del /runestatus');
end

-- ===================== Commands =====================

profile.HandleCommand = function(args)
    local cmd = args[1] and args[1]:lower();

    if (cmd == 'cycletp') then
        Settings.TpIndex = Settings.TpIndex + 1;
        if (Settings.TpIndex > #TpSets) then Settings.TpIndex = 1; end
        SaveState();
        PrintState();
        return;
    elseif (cmd == 'cycleweapon') then
        Settings.WeaponIndex = Settings.WeaponIndex + 1;
        if (Settings.WeaponIndex > #Weapons) then Settings.WeaponIndex = 1; end
        SaveState();
        PrintState();
        return;
    elseif (cmd == 'sird' or cmd == 'togglesird') then
        Settings.SirdOn = not Settings.SirdOn;
        SaveState();
        PrintState();
        return;
    elseif (RuneNameByLower[cmd]) then
        local runeName = RuneNameByLower[cmd];
        local sub = args[2] and args[2]:lower();
        if (sub == 'on') then
            RuneToggle[runeName] = true;
        elseif (sub == 'off') then
            RuneToggle[runeName] = false;
        end
        SaveState();
        gFunc.Message(runeName .. ' auto-maintain: ' .. (RuneToggle[runeName] and 'ON' or 'OFF'));
        return;
    elseif (cmd == 'runeoff') then
        for _, runeName in ipairs(RuneOrder) do RuneToggle[runeName] = false end
        SaveState();
        gFunc.Message('All rune auto-maintain: OFF');
        return;
    elseif (cmd == 'runestatus') then
        local active = {};
        for _, runeName in ipairs(RuneOrder) do
            if RuneToggle[runeName] then table.insert(active, runeName) end
        end
        gFunc.Message(#active == 0 and 'Rune auto-maintain: none active' or ('Rune auto-maintain active: ' .. table.concat(active, ', ')));
        return;
    end
end

-- ===================== Cast Handlers =====================

profile.HandleDefault = function()
    CheckRuneMaintenance();

    local player = gData.GetPlayer();

    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets[TpSets[Settings.TpIndex]]);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        gFunc.EquipSet(sets.Idle);
    end

    ApplyWeapon();
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    if (RuneToggle[ability.Name] ~= nil) then
        -- one of the auto-maintained runes; no dedicated gear for these
        ApplyWeapon();
        return;
    end

    if ability.Name == 'Provoke' then
        gFunc.EquipSet(sets.Enmity);
    elseif AbilitySets[ability.Name] then
        gFunc.EquipSet(sets[AbilitySets[ability.Name]]);
    end

    ApplyWeapon();
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.Precast);
    ApplyWeapon();
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();

    if string.find(spell.Name, 'Cur') then
        gFunc.EquipSet(sets.Cure);
    elseif string.find(spell.Name, 'Regen') then
        gFunc.EquipSet(sets.Regen);
    elseif spell.Name == 'Phalanx' then
        gFunc.EquipSet(sets.Phalanx);
    elseif spell.Name == 'Flash' or spell.Skill == 'Blue Magic' then
        gFunc.EquipSet(sets.Enmity);
    elseif spell.Skill == 'Enhancing Magic' then
        gFunc.EquipSet(sets.Enhancing);
    end

    -- SIRD overlay applies over spell-specific sets when enabled
    if Settings.SirdOn then
        gFunc.EquipSet(sets.SIRD);
    end

    ApplyWeapon();
end

profile.HandlePreshot = function()
    ApplyWeapon();
end

profile.HandleMidshot = function()
    ApplyWeapon();
end

profile.HandleWeaponskill = function()
    local ws = gData.GetAction();

    if ws.Name == 'Dimidiation' then
        gFunc.EquipSet(sets.Dimidiation);
    elseif ws.Name == 'Fimbulvetr' or ws.Name == 'Savage Blade' then
        gFunc.EquipSet(sets.Fimbulvetr_Savage);
    elseif ws.Name == 'Resolution' then
        gFunc.EquipSet(sets.Resolution);
    end

    ApplyWeapon();
end

return profile;