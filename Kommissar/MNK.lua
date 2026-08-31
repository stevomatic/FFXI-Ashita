local profile = {};
local sets = {
    Idle = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Null Masque',
        Neck = 'Loricate Torque +1',
        Ear1 = 'Alabster Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Murky Ring',
        Ring2 = 'Shadow Ring',
        Back = 'Null Shawl',
        Waist = 'Carrier\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nymame Sollerets',
    },
    Resting = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Null Masque',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Infused Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Chirich Ring +1',
        Back = 'Moonlight Cape',
        Waist = 'Null Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nymame Sollerets',
    },
    Tp = {
        Sub = 'Displaced',
		Range = 'Displaced',
        Ammo = 'Aurgelmir Orb +1',
        Head = 'Bhikku Crown +2',
        Neck = 'Mnk. Nodowa +2',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Schere Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Malignance Gloves',
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gere Ring',
        Back = 'Segomo\'s Mantle', -- 
        Waist = 'Moonbow Belt +1',
        Legs = 'Bhikku Hose +3',
        Feet = 'Mpaca\'s Boots',
    },
    TpStaff = {
        Sub = 'Balarama Grip',
		Range = 'Displaced',
        Ammo = 'Aurgelmir Orb +1',
        Head = 'Bhikku Crown +2',
        Neck = 'Mnk. Nodowa +2',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Schere Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Malignance Gloves',
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gere Ring',
        Back = 'Segomo\'s Mantle', -- dex DA acc30/att20 --
        Waist = 'Moonbow Belt +1',
        Legs = 'Bhikku Hose +3',
        Feet = 'Mpaca\'s Boots',
    },
    TpCounter = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Bhikku Crown +2',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Cryptic Earring',
        Ear2 = 'Bhikku Earring +1',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Rao Kote +1', -- path A --
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Murky Ring',
        Back = 'Segomo\'s Mantle', -- dex DA Counter --
        Waist = 'Moonbow Belt +1',
        Legs = 'Anch. Hose +4',
        Feet = 'Bhikku Gaiters +3',
    },
    TpSubtle = {
        Ammo = 'Coiste Bodhar',
        Head = 'Bhikku Crown +2',
        Neck = 'Mnk. Nodowa +2',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Schere Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Malignance Gloves',
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gere Ring',
        Back = 'Segomo\'s Mantle', -- dex STP DT --
        Waist = 'Moonbow Belt +1',
        Legs = 'Bhikku Hose +3',
        Feet = 'Malignance Boots',
    },
    TpKick = {
        Ammo = 'Coiste Bodhar',
        Head = 'Bhikku Crown +2',     --  1 --
        Neck = 'Mnk. Nodowa +2',      -- 25 --
        Ear1 = 'Sherida Earring',
        Ear2 = 'Schere Earring',
        Body = 'Bhikku Cyclas +2',    --  1 --
        Hands = 'Bhikku Gloves +2',   --  1 --
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gere Ring',
        Back = 'Segomo\'s Mantle',    -- 10 --
        Waist = 'Moonbow Belt +1',
        Legs = 'Bhikku Hose +3',      -- 31 --
        Feet = 'Anch. Gaiters +4',    -- 10 --
    },
    Counterstance = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Bhikku Crown +2',
        Neck = 'Loricate Torque +1',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Telos Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Malignance Gloves',
        Ring1 = 'Murky Ring',
        Ring2 = 'Niqmaddu Ring',
        Back = 'Segomo\'s Mantle', -- counter or DT --
        Waist = 'Moonbow Belt +1',
        Legs = 'Anch. Hose +4',
        Feet = 'Hesy. Gaiters +4',
    },
    Chakra = {
        Ammo = 'Aurgelmir Orb +1',
        Head = 'Null Masque',
        Neck = 'Unmoving Collar +1',
        Ear1 = 'Handler\'s Earring +1',
        Ear2 = 'Tuisto Earring',
        Body = 'Anch. Cyclas +4',
        Hands = 'Hesy. Gloves +4',
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Gelatinous Ring +1',
        Back = 'Segomo\'s Mantle', -- vit --
        Waist = 'Latria Sash',
        Legs = 'Tatena. Haidate +1',
        Feet = 'Bhikku Gaiters +3',
    },
	HundredFists = {
		Legs = 'Hes. Hose +3',
	},
	Boost = {
		Hands = 'Anchor. Gloves +3',
	},
	Dodge = {
		Feet = 'Anch. Gaiters +4',
	},
	ChiBlast = {
		Ammo = 'Sapience Orb',
		Head = 'Halitus Helm',
		Body = 'Emet Harness +1',
		Hands = 'Anchor. Gloves +3',
		Legs = 'Herculean Trousers', -- 8 Fern Ranged path --
		Feet = 'Herculean Boots', -- 8 Fern Ranged path --
		Neck = 'Unmoving Collar +1',
		Waist = 'Kasiri Belt',
		Ear1 = 'Cryptic Earring',
		Ear2 = 'Trux Earring',
		Ring1 = 'Eihwaz Ring',
		Ring2 = 'Supershear Ring',
		Back = 'Segomos\'s Mantle', -- +10 --
    },
	Footwork = {
		Feet = 'Bhikku Gaiters +3',
	},
	Mantra = {
		Feet = 'Hes. Gaiters +3',
	},
	FormlessStrikes = {
		Body = 'Hes. Cyclas +3',
	},
	PerfectCounter = {
		Head = 'Bhikku Crown +2',
	},
	Impetus = {
		Body = 'Bhikku Cyclas +2',
	},
    Provoke = {
		Ammo = 'Sapience Orb',
		Head = 'Halitus Helm',
		Body = 'Emet Harness +1',
		Hands = 'Herculean Gloves', -- 8 Fern Ranged path --
		Legs = 'Herculean Trousers', -- 8 Fern Ranged path --
		Feet = 'Herculean Boots', -- 8 Fern Ranged path --
		Neck = 'Unmoving Collar +1',
		Waist = 'Kasiri Belt',
		Ear1 = 'Cryptic Earring',
		Ear2 = 'Trux Earring',
		Ring1 = 'Eihwaz Ring',
		Ring2 = 'Supershear Ring',
		Back = 'Segomos\'s Mantle', -- +10 --
    },
    Precast = {
        Ammo = 'Sapience Orb',
        Head = 'Herculean Helm', -- fast cast Fern 6 --
        Neck = 'Voltsurge Torque',
        Ear1 = 'Enchntr. Earring +1',
        Ear2 = 'Loquac. Earring',
        Body = 'Adhemar Jacket +1', -- path d --
        Hands = 'Leyline Gloves',
        Ring1 = 'Prolix Ring',
        Ring2 = 'Rahab Ring',
        Back = 'Segomo\'s Mantle', -- FC 10 --
        Waist = 'Black Belt', -- haste ? --
        Legs = 'Herculean Trousers', -- FC --
        Feet = 'Herculean Boots', -- FC --
    },
    ShellCrusher = {
        Sub = 'Flanged Grip',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Bhikku Crown +2',
        Neck = 'Moonlight Necklace',
        Ear1 = 'Digni. Earring',
        Ear2 = 'Crep. Earring',
        Body = 'Bhikku Cyclas +2',
        Hands = 'Bhikku Gloves +2',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Segomo\'s Mantle', -- 30INT 20 macc/mdam 10 wsd --
        Waist = 'Acuity Belt +1', 
        Legs = 'Bhikku Hose +3',
        Feet = 'Bhikku Gaiters +3',
    },
    Cataclysm = {
        Sub = 'Flanged Grip',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Pixie Hairpin +1',
        Neck = 'Sibyl Scarf',
        Ear1 = 'Friomisi Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Archon Ring',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Segomo\'s Mantle', -- 30INT 20 macc/mdam 10 wsd --
        Waist = 'Orpheus\'s Sash', 
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Ascetic = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Adhemar Bonnet +1',
        Neck = 'Fotia Gorget',
        Ear1 = 'Schere Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Bhikku Cyclas +2',
        Hands = 'Bhikku Gloves +2',
        Ring1 = 'Gere Ring',
        Ring2 = 'Niqmaddu Earring',
        Back = 'Segomo\'s Mantle', -- str crit --
        Waist = 'Moonbow Belt +1',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Ken. Sune-Ate +1',
    },
    Shijin = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Duty Crown',
        Neck = 'Mnk. Nodowa +2',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Malignance Tabard',
        Hands = 'Bhikku Gloves +2',
        Ring1 = 'Gere Ring',
        Ring2 = 'Niqmaddu Ring',
        Back = 'Segomo\'s Mantle', -- dex DA --
        Waist = 'Moonbow Belt +1',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Duty Sollerets',
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
    { Name = 'Venus Orb', Quantity = 'all' },
    { Name = 'Glanzfaust', Quantity = 'all' },
    { Name = 'Instant Reraise', Quantity = 'all' },
    { Name = 'Godhands', Quantity = 'all' },
    { Name = 'Malignance Pole', Quantity = 'all' },
    { Name = 'Mars Orb', Quantity = 'all' },
    { Name = 'Xoanon', Quantity = 'all' },
    { Name = 'Miso Ramen', Quantity = 'all' },
};

-- ===========================================================================
-- Weapon table (cycled with ^=). Weapons don't get swapped often mid-fight,
-- so this is one combined list covering both hth and staff choices. hth
-- weapons force Sub to Displaced since they never use a sub-slot piece. Staff
-- weapons leave Sub unset on purpose -- whatever Sub the active TP set
-- defines (e.g. sets.TpStaff.Sub) wins instead, so it can differ per set.
-- ===========================================================================
local Weapons = {
    [1] = { Name = 'Glanzfaust',      Sub = 'Displaced' },
    [2] = { Name = 'Godhands',        Sub = 'Displaced' },
    [3] = { Name = 'Xoanon' },
    [4] = { Name = 'Malignance Pole' },
};

-- ===========================================================================
-- Engaged set variants (cycled with ^-). This is the list of sets you swap
-- between much more often, so it gets its own key. Add/remove/reorder freely,
-- these are just looked up by name against profile.Sets.
-- ===========================================================================
local TpSets = {
    [1] = 'Tp',
    [2] = 'TpStaff',
    [3] = 'TpCounter',
    [4] = 'TpSubtle',
    [5] = 'TpKick',
};

-- ===========================================================================
-- Persisted state. TpIndex/WeaponIndex point into the tables above.
-- ===========================================================================
local Settings = {
    TpIndex = 1,
    WeaponIndex = 1,
};

-- ---------------------------------------------------------------------------
-- Simple file-based persistence so settings survive /lac reload, job/zone
-- unloads, and relogging. Saved next to this profile (CharName_CharId folder).
-- Wrapped in pcall so a mismatched Ashita API on some builds won't break the
-- profile; worst case is settings just reset to the defaults above.
-- ---------------------------------------------------------------------------
local function GetCharFolder()
    local ok, party = pcall(function() return AshitaCore:GetMemoryManager():GetParty(); end);
    if not ok or party == nil then return nil; end
    local name = party:GetMemberName(0);
    local id = party:GetMemberServerId(0);
    if (name == nil) or (name == '') or (id == nil) or (id == 0) then
        return nil;
    end
    return string.format('%s_%d', name, id);
end

local function GetSettingsPath()
    local folder = GetCharFolder();
    if folder == nil then return nil; end
    return string.format('config/addons/luashitacast/%s/MNK_state.lua', folder);
end

local function SaveSettings()
    local path = GetSettingsPath();
    if path == nil then return; end
    local file = io.open(path, 'w');
    if file ~= nil then
        file:write(string.format(
            "return { TpIndex = %d, WeaponIndex = %d };",
            Settings.TpIndex, Settings.WeaponIndex
        ));
        file:close();
    end
end

local function LoadSettings()
    local path = GetSettingsPath();
    if path == nil then return; end
    local chunk = loadfile(path);
    if chunk ~= nil then
        local ok, saved = pcall(chunk);
        if ok and (type(saved) == 'table') then
            Settings.TpIndex = saved.TpIndex or Settings.TpIndex;
            Settings.WeaponIndex = saved.WeaponIndex or Settings.WeaponIndex;
        end
    end
end

-- ---------------------------------------------------------------------------
-- Helpers to keep HandleCommand/HandleDefault readable and give consistent
-- log output whenever state changes.
-- ---------------------------------------------------------------------------
local function PrintState()
    gFunc.Message(string.format('TP Set: %s | Weapon: %s', TpSets[Settings.TpIndex], Weapons[Settings.WeaponIndex].Name));
end

local function CycleTpSet()
    Settings.TpIndex = Settings.TpIndex + 1;
    if (Settings.TpIndex > #TpSets) then
        Settings.TpIndex = 1;
    end
    SaveSettings();
    PrintState();
end

local function CycleWeapon()
    Settings.WeaponIndex = Settings.WeaponIndex + 1;
    if (Settings.WeaponIndex > #Weapons) then
        Settings.WeaponIndex = 1;
    end
    SaveSettings();
    PrintState();
end

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    LoadSettings();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 010');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 010');

    -- ^- cycles engaged set variants (Tp, TpStaff, TpCounter, TpSubtle).
    -- ^= cycles weapon choice (Glanzfaust, Godhands, Xoanon, Malignance Pole).
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^- /lac fwd cycletp');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^= /lac fwd cycleweapon');

    PrintState();
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^-');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^=');
end

profile.HandleCommand = function(args)
    if (args[1] == 'cycletp') then
        CycleTpSet();
    elseif (args[1] == 'cycleweapon') then
        CycleWeapon();
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets[TpSets[Settings.TpIndex]]);

        local weapon = Weapons[Settings.WeaponIndex];
        gFunc.Equip('main', weapon.Name);
        if (weapon.Sub ~= nil) then
            gFunc.Equip('sub', weapon.Sub);
        end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        gFunc.EquipSet(sets.Idle);
    end

    -- Buff-duration overlays. These stay on for as long as the buff is up
    -- (the gear affects the ongoing calculation, not just the moment the
    -- ability was used), so they're checked every tick and layered on top
    -- of whatever base set was equipped above, regardless of engage status.
    if (gData.GetBuffCount('Counterstance') > 0) then
        gFunc.EquipSet(sets.Counterstance);
    end
    if (gData.GetBuffCount('Hundred Fists') > 0) then
        gFunc.EquipSet(sets.HundredFists);
    end
    if (gData.GetBuffCount('Perfect Counter') > 0) then
        gFunc.EquipSet(sets.PerfectCounter);
    end
    if (gData.GetBuffCount('Impetus') > 0) then
        gFunc.EquipSet(sets.Impetus);
    end
end

profile.HandleAbility = function()
    local action = gData.GetAction();
    -- Instant-use abilities: their gear only matters at the moment of
    -- activation, so these just flash on for that one stage.
    if (action.Name == 'Chakra') then
        gFunc.EquipSet(sets.Chakra);
    elseif (action.Name == 'Boost') then
        gFunc.EquipSet(sets.Boost);
    elseif (action.Name == 'Dodge') then
        gFunc.EquipSet(sets.Dodge);
    elseif (action.Name == 'Footwork') then
        gFunc.EquipSet(sets.Footwork);
    elseif (action.Name == 'Mantra') then
        gFunc.EquipSet(sets.Mantra);
    elseif (action.Name == 'Formless Strikes') then
        gFunc.EquipSet(sets.FormlessStrikes);
    elseif (action.Name == 'Provoke') then
        gFunc.EquipSet(sets.Provoke);
    elseif (action.Name == 'Chi Blast') then
        gFunc.EquipSet(sets.ChiBlast);
    end
    -- Hundred Fists, Perfect Counter, and Impetus are handled continuously
    -- in HandleDefault instead, since their gear needs to stay on for the
    -- whole buff duration rather than just the activation moment.
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.Precast);
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if (action.Name == 'Cataclysm') then
        gFunc.EquipSet(sets.Cataclysm);
    elseif (action.Name == 'Shell Crusher') then
        gFunc.EquipSet(sets.ShellCrusher);
    elseif (action.Name == "Ascetic's Fury") then
        gFunc.EquipSet(sets.Ascetic);
    elseif (action.Name == 'Shijin Spiral') then
        gFunc.EquipSet(sets.Shijin);
    end
end

return profile;

-- ===========================================================================
-- Usage
-- ===========================================================================
-- ^-    cycle engaged set: Tp -> TpStaff -> TpCounter -> TpSubtle -> TpKick -> Tp ...
-- ^=    cycle weapon: Glanzfaust -> Godhands -> Xoanon -> Malignance Pole ...
--
-- The two are independent: whichever TpSets entry is active controls armor,
-- whichever Weapons entry is active controls main/sub, and they get combined
-- every tick in HandleDefault. Add more sets to TpSets or weapons to Weapons
-- to extend either cycle later.
--
-- TpIndex/WeaponIndex are saved to
-- config/addons/luashitacast/CharName_CharId/MNK_state.lua and reloaded on
-- OnLoad, so they survive /lac reload, job changes, and relogging.
--
-- Buff-duration sets (Counterstance, HundredFists, PerfectCounter, Impetus)
-- are applied automatically in HandleDefault for as long as their buff is
-- active, layered on top of whichever engaged set/weapon is selected.
-- Everything else in HandleAbility (Chakra, Boost, Dodge, Footwork, Mantra,
-- FormlessStrikes, Provoke, ChiBlast) is a one-shot flash at activation.
--
-- TODO: look at adding clubs to the weapon cycle.