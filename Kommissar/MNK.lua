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
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Tp = {
        Sub = 'Displaced',
		Range = 'Displaced',
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    TpStaff = {
        Sub = 'Balarama Grip',
		Range = 'Displaced',
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    TpCounter = {
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Counterstance = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Chakra = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Precast = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Cataclysm = {
        Sub = 'Flanged Grip',
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    ShellCrusher = {
        Sub = 'Flanged Grip',
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Ascetic = {
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Shijin = {
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
};
profile.Sets = sets;

profile.Packer = {
};

-- ===========================================================================
-- Weapon mode tables (cycled with keybinds, see OnLoad)
-- ===========================================================================
local HthWeapons = {
    [1] = 'Glanzfaust',
    [2] = 'Godhands',
};

local StaffWeapons = {
    [1] = 'Xoanon',
    [2] = 'Malignance Pole',
};

-- ===========================================================================
-- Persisted state. WeaponMode is 'hth' or 'staff'. HthIndex/StaffIndex point
-- into the tables above. Counter toggles the TpCounter overlay on/off.
-- ===========================================================================
local Settings = {
    WeaponMode = 'hth',
    HthIndex = 1,
    StaffIndex = 1,
    Counter = false,
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
            "return { WeaponMode = %q, HthIndex = %d, StaffIndex = %d, Counter = %s };",
            Settings.WeaponMode, Settings.HthIndex, Settings.StaffIndex, tostring(Settings.Counter)
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
            Settings.WeaponMode = saved.WeaponMode or Settings.WeaponMode;
            Settings.HthIndex = saved.HthIndex or Settings.HthIndex;
            Settings.StaffIndex = saved.StaffIndex or Settings.StaffIndex;
            if (saved.Counter ~= nil) then
                Settings.Counter = saved.Counter;
            end
        end
    end
end

-- ---------------------------------------------------------------------------
-- Helpers to keep HandleCommand/HandleDefault readable and give consistent
-- log output whenever state changes.
-- ---------------------------------------------------------------------------
local function PrintState()
    local weapon;
    if (Settings.WeaponMode == 'staff') then
        weapon = StaffWeapons[Settings.StaffIndex];
    else
        weapon = HthWeapons[Settings.HthIndex];
    end
    gFunc.Message(string.format('Mode: %s (%s) | Counter: %s', Settings.WeaponMode, weapon, tostring(Settings.Counter)));
end

local function CycleHth()
    Settings.WeaponMode = 'hth';
    Settings.HthIndex = Settings.HthIndex + 1;
    if (Settings.HthIndex > #HthWeapons) then
        Settings.HthIndex = 1;
    end
    SaveSettings();
    PrintState();
end

local function CycleStaff()
    Settings.WeaponMode = 'staff';
    Settings.StaffIndex = Settings.StaffIndex + 1;
    if (Settings.StaffIndex > #StaffWeapons) then
        Settings.StaffIndex = 1;
    end
    SaveSettings();
    PrintState();
end

local function ToggleCounter()
    Settings.Counter = not Settings.Counter;
    SaveSettings();
    PrintState();
end

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    LoadSettings();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 010');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 010');

    -- /lac fwd cyclehth and /lac fwd cyclestaff pick their respective weapon
    -- mode and advance to the next weapon in that mode's list.
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^= /lac fwd cyclehth');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^- /lac fwd cyclestaff');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /counter /lac fwd counter');

    PrintState();
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^=');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^-');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /counter');
end

profile.HandleCommand = function(args)
    if (args[1] == 'cyclehth') then
        CycleHth();
    elseif (args[1] == 'cyclestaff') then
        CycleStaff();
    elseif (args[1] == 'counter') then
        ToggleCounter();
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        if (Settings.WeaponMode == 'staff') then
            gFunc.EquipSet(sets.TpStaff);
            gFunc.Equip('main', StaffWeapons[Settings.StaffIndex]);
        else
            gFunc.EquipSet(sets.Tp);
            gFunc.Equip('main', HthWeapons[Settings.HthIndex]);
        end
        if (Settings.Counter == true) then
            gFunc.EquipSet(sets.TpCounter);
        end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        gFunc.EquipSet(sets.Idle);
    end
end

profile.HandleAbility = function()
    local action = gData.GetAction();
    if (action.Name == 'Chakra') then
        gFunc.EquipSet(sets.Chakra);
    elseif (action.Name == 'Counterstance') then
        gFunc.EquipSet(sets.Counterstance);
    end
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
-- ^=          cycle hth weapons (Glanzfaust, Godhands) and switch to hth mode
-- ^-          cycle staff weapons (Xoanon, Malignance Pole) and switch to staff mode
-- /counter    toggle the TpCounter overlay on/off while engaged
--
-- WeaponMode/weapon index/Counter are saved to
-- config/addons/luashitacast/CharName_CharId/MNK_state.lua and reloaded on
-- OnLoad, so they survive /lac reload, job changes, and relogging.
-- HandleDefault has typical idle and resting behavior
-- there will be two separate weapon modes. one handed called hth and two handed called staff with different weapon choices to cycle through for each handled by a /lac forward macro
-- need to save settings so they persist through zoning and loading or unloading
-- when choosing hth, engaged will use Tp set. when staff is chosen engaged will use TpStaff set 
-- in certain situations a special tp set with be used regardless of weapon mode called TpCounter. This will be toggled via command line using /counter to toggle on and off
-- need printouts in log reflecting changes in state for all modes
-- setup OnLoad 
--    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 010');
--    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
--    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 010');
-- lac forward using keybind control modifier ^
-- lac forward ^- cycles through staff choices. preliminary staff choices will be Xoanon and Malignance Pole. structured for possible future additions
-- lac forward ^= cycles through hth choices. preliminary hth choices will be Glanzfaust and Godhands. structured for possible future additions
-- /counter toggles TpCounter set on or off. structured for possible future additions

-- setup OnUnload
-- remove macros