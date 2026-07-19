-- Structure
-- 4 total modes. Normal, Manawall, Death, Vagary. The 4 modes are set to cycle using /lac forward command keybound to F5 onload and unbound upon offload. 
-- Normal: Idle, resting, tp, weaponskills are all typical. Precast set for precast. Midcasts are enfeebling, enhancing, stun, drainaspir, nuke, dot. 
-- Impact will be handled in the Normal set. Impact requires crepuscular cloak to be equipped and head slot to be displaced in both precast and midcast, therefore
-- when impact is cast it has it's own sets, ImpactPrecast and Impact.
-- ManaWall: Manawall mode is the same as normal except it uses the set ManaWall as the Idle and ManaWallTp as the engaged/tp set.
-- Death: Death mode needs to only utilize the three death sets. Idle is DeathIdle, precast is DeathPrecast and midcast is Death. When in Death mode LAC should only use those three sets
-- Vagary: Vagary mode just needs to lock in the single set called Vagary. The idea is to have a very low output set for very light damage. Displaced should work but there is functionality within
-- LAC that will lockout or disable slots if need be. 
local profile = {};
local sets = {
    Idle = {
        Main = 'Laevateinn',
        Sub = 'Khonsu',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Wicce Petasos +3',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Nyame Mail',
        Hands = 'Wicce Gloves +3',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Taranus\'s Cape',
        Waist = 'Carrier\'s Sash',
        Legs = 'Wicce Chausses +3',
        Feet = 'Wicce Sabots +3',
    },
    IdleDeath = {
        Main = 'Laevateinn',
        Sub = 'Khonsu',
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Wicce Petasos +3',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Halasz Earring',
        Ear2 = 'Nehalennia Earring',
        Body = 'Ros. Jaseran +1',
        Hands = 'Spae. Gloves +4',
        Ring1 = 'Mephitas\'s Ring',
        Ring2 = 'Mephitas\'s Ring +1',
        Back = 'Taranus\'s Cape', -- mp +80 --
        Waist = 'Shinjutsu-No-Obi +1',
        Legs = 'Amalric Slos +1', -- path a --
        Feet = 'Psycloth Boots +1', -- path a --
    },
    Resting = {
        Main = 'Laevateinn',
        Sub = 'Khonsu',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Wicce Petasos +3',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Wicce Coat +3',
        Hands = 'Wicce Gloves +3',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Taranus\'s Cape',
        Waist = 'Shinjutsu-No-Obi +1',
        Legs = 'Wicce Chausses +3',
        Feet = 'Wicce Sabots +3',
    },
    Vagary = {
        Main = 'Laevateinn',
        Sub = 'Enki Strap',
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Displaced',
        Neck = 'Src. Stole +2',
        Ear1 = 'Friomisi Earring',
        Ear2 = 'Barkaro. Earring',
        Body = 'Displaced',
        Hands = 'Displaced',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Taranus\'s Cape', -- nuke --
        Waist = 'Acuity Belt +1',
        Legs = 'Displaced',
        Feet = 'Displaced',
    },
    Tp = {
        Main = 'Laevateinn',
        Sub = 'Bloodrain Strap',
        Ammo = 'White Tathlum',
        Head = 'Nyame Helm',
        Neck = 'Combatant\'s Torque',
        Ear1 = 'Telos Earring',
        Ear2 = 'Crepuscular Earring',
        Body = 'Wicce Coat +3',
        Hands = 'Wicce Gloves +3',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Chirich Ring +1',
        Back = 'Taranus\'s Cape', -- dex +20 acc20+10 att 20 stp +10 --
        Waist = 'Patentia Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    ManaWall = {
        Main = 'Laevateinn',
        Sub = 'Oneiros Grip',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Wicce Petasos +3',
        Neck = 'Unmoving Collar +1',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Wicce Coat +3',
        Hands = 'Wicce Gloves +3',
        Ring1 = 'Supershear Ring',
        Ring2 = 'Murky Ring',
        Back = 'Taranus\'s Cape',  -- mp + --
        Waist = 'Plat. Mog. Belt',
        Legs = 'Wicce Chausses +3',
        Feet = 'Wicce Sabots +3',
    },
    ManaWallTp = {
        Main = 'Laevateinn',
        Sub = 'Oneiros Grip',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Wicce Petasos +3',
        Neck = 'Unmoving Collar +1',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Wicce Coat +3',
        Hands = 'Wicce Gloves +3',
        Ring1 = 'Supershear Ring',
        Ring2 = 'Murky Ring',
        Back = 'Taranus\'s Cape',  -- mp + --
        Waist = 'Plat. Mog. Belt',
        Legs = 'Wicce Chausses +3',
        Feet = 'Wicce Sabots +3',
    },
    Cure = {
        Main = 'Laevateinn',
        Sub = 'Khonsu',
        Ammo = 'Quartz Tathlum +1',
        Head = 'Vanya Hood',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Meili Earring',
        Ear2 = 'Mendi. Earring',
        Body = 'Vrikodara Jupon',
        Hands = 'Vanya Cuffs',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Aurist\'s Cape +1',
        Waist = 'Bishop\'s Sash',
        Legs = 'Gyve Trousers',
        Feet = 'Vanya Clogs',
    },
    Enfeebling = {
        Main = 'Laevateinn',
        Sub = 'Khonsu',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Displaced',
        Neck = 'Src. Stole +2',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Wicce Earring +1',
        Body = 'Cohort Cloak +1',
        Hands = 'Regal Cuffs',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Kishar Ring',
        Back = 'Aurist\'s Cape +1',
        Waist = 'Acuity Belt +1',
        Legs = 'Wicce Chausses +3',
        Feet = 'Wicce Sabots +3',
    },
    Enhancing = {
        Main = 'Laevateinn',
        Sub = 'Khonsu',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Wicce Petasos +3', -- telchine set with +enh dur --
        Neck = 'Incater\'s Torque',
        Ear1 = 'Calamitous Earring',
        Ear2 = 'Earthcry Earring',
        Body = 'Nyame Mail',
        Hands = 'Wicce Gloves +3',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Aurist\'s Cape +1',
        Waist = 'Embla Sash',
        Legs = 'Wicce Chausses +3',
        Feet = 'Wicce Sabots +3',
    },
    Vidohunir = {
        Main = 'Laevateinn',
        Sub = 'Enki',
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Pixie Hairpin +1',
        Neck = 'Src. Stole +2',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Regal Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Freke Ring',
        Back = 'Taranus\'s Cape', -- Int +30 macc/mdam 20 wsd --
        Waist = 'Orpheus\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Myrkr = {
        Main = 'Laevateinn',
        Sub = 'Enki Strap',
        Ammo = 'Strobilus',
        Head = 'Amalric Coif +1',
        Neck = 'Dualism Collar +1',
        Ear1 = 'Nehalennia Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Amalric Doublet +1',
        Hands = 'Spae. Gloves +4',
        Ring1 = 'Mephitas\'s Ring',
        Ring2 = 'Mephitas\'s Ring +1',
        Back = 'Taranus\'s Cape', -- mp + --
        Waist = 'Shinjutsu-No-Obi +1',
        Legs = 'Amalric Slops +1',
        Feet = 'Psycloth Boots', -- path a --
    },
    Precast = {
        Main = 'Laevateinn',
        Sub = 'Khonsu',
        Ammo = 'Impatiens',
        Head = 'Merlinic Hood',        -- 15 --
        Neck = 'Voltsurge Torque',	   --  4 --	
        Ear1 = 'Malignance Earring',   --  2 --
        Ear2 = 'Loquac. Earring',      --  2 --
        Body = 'Merlinin Jubbah',      -- 13 --
        Hands = 'Merlinic Dastanas',   --  6 -- 
        Ring1 = 'Lebeche Ring', 
        Ring2 = 'Kishar Ring',         --  4 --  
        Back = 'Taranus\'s Cape',      -- 10 --
        Waist = 'Shinjutsu-No-Obi +1', --  5 --    
        Legs = 'Agwu\'s Slops',        --  7 --
        Feet = 'Merlinic Crackows',    -- 12 --
    },
    ImpactPrecast = {
        Main = 'Laevateinn',
        Sub = 'Khonsu',
        Ammo = 'Impatiens',
        Head = 'Displaced',
        Neck = 'Voltsurge Torque',	   --  4 --	
        Ear1 = 'Malignance Earring',   --  2 --
        Ear2 = 'Loquac. Earring',      --  2 --
        Body = 'Crepuscular Cloak',
        Hands = 'Merlinic Dastanas',   --  6 -- 
        Ring1 = 'Lebeche Ring', 
        Ring2 = 'Kishar Ring',         --  4 --  
        Back = 'Taranus\'s Cape',      -- 10 --
        Waist = 'Shinjutsu-No-Obi +1', --  5 --    
        Legs = 'Agwu\'s Slops',        --  7 --
        Feet = 'Merlinic Crackows',    -- 12 --
    },
    Impact = {
        Main = 'Laevateinn',
        Sub = 'Khonsu',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Displaced',
        Neck = 'Src. Stole +2',
        Ear1 = 'Ilmr Earring',
        Ear2 = 'Wicce Earring +2',
        Body = 'Crepuscular Cloak',
        Hands = 'Spae. Gloves +4',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Aurist\'s Cape +1',
        Waist = 'Acuity Belt +1',
        Legs = 'Spae. Tonban +4',
        Feet = 'Arch. Sabots +4',
    },
    DeathPrecast = {
        Main = 'Laevateinn',
        Sub = 'Khonsu',
        Ammo = 'Sapience Orb',
        Head = 'Amalric Coif +1',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Loquac. Earring',
        Body = 'Ros. Jaseran +1',
        Hands = 'Agwu\'s Gages',
        Ring1 = 'Mephitas\'s Ring +1',
        Ring2 = 'Lebeche Ring',
        Back = 'Taranus\'s Cape', -- mp fc --
        Waist = 'Shinjutsu-No-Obi +1',
        Legs = 'Psycloth Lappas', -- path d --
        Feet = 'Amalric Nails +1',
    },
    Death = {
        Main = 'Laevateinn',
        Sub = 'Enki Strap',
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Pixie Hairpin +1',
        Neck = 'Src. Stole +2',
        Ear1 = 'Barkaro. Earring',
        Ear2 = 'Wicce Earring +2',
        Body = 'Amalric Doublet +1',
        Hands = 'Amalric Gages +1',
        Ring1 = 'Archon Ring',
        Ring2 = 'Mephitas\'s Ring +1',
        Back = 'Taranus\'s Cape', -- mp + ---
        Waist = 'Shinjutsu-No-Obi +1',
        Legs = 'Amalric Slops +1',
        Feet = 'Wicce Sabots +3',
    },
    Stun = {
        Main = 'Laevateinn',
        Sub = 'Khonsu',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Wicce Petasos +3',
        Neck = 'Src. Stole +2',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Wicce Earring +2',
        Body = 'Wicce Coat +3',
        Hands = 'Spae. Gloves +4',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Taranus\'s Cape',
        Waist = 'Acuity Belt +1',
        Legs = 'Wicce Chausses +3',
        Feet = 'Wicce Sabots +3',
    },
    DrainAspir = {
        Main = 'Rubicundity',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Pixie Hairpin +1',
        Neck = 'Erra Pendant',
        Ear1 = 'Hirudinea Earring',
        Ear2 = 'Wicce Earring +2',
        Body = 'Merlinic Jubbah', -- da --
        Hands = 'Merlinic Dastanas', -- da --
        Ring1 = 'Archon Ring',
        Ring2 = 'Evanescence Ring',
        Back = 'Taranus\'s Cape',
        Waist = 'Aurist\'s Cape +1',
        Legs = 'Spae. Tonban +4',
        Feet = 'Agwu\'s Pigaches',
    },
    Nuke = {
        Main = 'Laevateinn',
        Sub = 'Enki Strap',
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Wicce Petasos +3',
        Neck = 'Src. Stole +2',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Wicce Earring +2',
        Body = 'Spaekona\'s Coat +4',
        Hands = 'Wicce Gloves +3',
        Ring1 = 'Freke Ring',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Taranus\'s Cape', -- int 20+10 macc/mdam 20 mab +10 --
        Waist = 'Acuity Belt +1',
        Legs = 'Wicce Chausses +3',
        Feet = 'Wicce Sabots +3',
    },
    DOT = {
        Main = 'Laevateinn',
        Sub = 'Enki Strap',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Wicce Petasos +3',
        Neck = 'Src. Stole +2',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Wicce Earring +2',
        Body = 'Spaekona\'s Coat +4',
        Hands = 'Spae. Gloves +4',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Aurist\'s Cape +1',
        Waist = 'Acuity Belt +1',
        Legs = 'Arch. Tonban +4',
        Feet = 'Arch. Sabots +4',
    },
};
profile.Sets = sets;

profile.Packer = {
};

-- Modes cycle in this order via /lac fwd (bound to F5): Normal -> ManaWall -> Death -> Vagary -> Normal ...
local ModeTable = {
    [1] = 'Normal',
    [2] = 'ManaWall',
    [3] = 'Death',
    [4] = 'Vagary',
};

local Settings = {
    Mode = 1,
};

-- Elemental Magic spells that are DOTs rather than direct nukes.
local DotSpells = T{ 'Burn', 'Frost', 'Rasp', 'Choke', 'Drown', 'Shock' };

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F5 /lac fwd');
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F5');
end

profile.HandleCommand = function(args)
    Settings.Mode = Settings.Mode + 1;
    if (Settings.Mode > #ModeTable) then
        Settings.Mode = 1;
    end
    gFunc.Message('BLM Mode: ' .. ModeTable[Settings.Mode]);
end

profile.HandleDefault = function()
    local mode = ModeTable[Settings.Mode];

    -- Death and Vagary modes are locked into a single idle behavior each, regardless of status.
    if (mode == 'Death') then
        gFunc.EquipSet(sets.IdleDeath);
        return;
    elseif (mode == 'Vagary') then
        gFunc.EquipSet(sets.Vagary);
        return;
    end

    local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        if (mode == 'ManaWall') then
            gFunc.EquipSet(sets.ManaWallTp);
        else
            gFunc.EquipSet(sets.Tp);
        end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        if (mode == 'ManaWall') then
            gFunc.EquipSet(sets.ManaWall);
        else
            gFunc.EquipSet(sets.Idle);
        end
    end
end

profile.HandleAbility = function()
    local action = gData.GetAction();
    if (action.Name == 'Manafont') then
        gFunc.Equip('Body', 'Arch. Coat +4');
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local mode = ModeTable[Settings.Mode];

    -- Death and Vagary only ever use their own locked-in sets.
    if (mode == 'Vagary') then
        gFunc.EquipSet(sets.Vagary);
        return;
    elseif (mode == 'Death') then
        gFunc.EquipSet(sets.DeathPrecast);
        return;
    end

    -- Normal/ManaWall precast. Impact needs Crepuscular Cloak (displaces head), everything else uses the default precast set.
    local action = gData.GetAction();
    if (action.Name == 'Impact') then
        gFunc.EquipSet(sets.ImpactPrecast);
    else
        gFunc.EquipSet(sets.Precast);
    end
end

profile.HandleMidcast = function()
    local mode = ModeTable[Settings.Mode];

    if (mode == 'Vagary') then
        gFunc.EquipSet(sets.Vagary);
        return;
    elseif (mode == 'Death') then
        gFunc.EquipSet(sets.Death);
        return;
    end

    -- Normal/ManaWall midcast: enfeebling, enhancing, stun, drain/aspir, nuke, dot, plus Impact's special handling.
    local action = gData.GetAction();
    if (action.Name == 'Impact') then
        gFunc.EquipSet(sets.Impact);
    elseif (action.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling);
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
    elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
    elseif (action.Skill == 'Dark Magic') then
        if (action.Name == 'Stun') then
            gFunc.EquipSet(sets.Stun);
        else
            gFunc.EquipSet(sets.DrainAspir);
        end
    elseif (action.Skill == 'Elemental Magic') then
        if (DotSpells:contains(action.Name)) then
            gFunc.EquipSet(sets.DOT);
        else
            gFunc.EquipSet(sets.Nuke);
        end
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local mode = ModeTable[Settings.Mode];

    if (mode == 'Vagary') then
        gFunc.EquipSet(sets.Vagary);
        return;
    elseif (mode == 'Death') then
        gFunc.EquipSet(sets.IdleDeath);
        return;
    end

    -- Weaponskills are typical (Tp gear) except Laevateinn's own weaponskills, which get dedicated sets.
    local action = gData.GetAction();
    if (action.Name == 'Vidohunir') then
        gFunc.EquipSet(sets.Vidohunir);
    elseif (action.Name == 'Myrkr') then
        gFunc.EquipSet(sets.Myrkr);
    else
        gFunc.EquipSet(sets.Tp);
    end
end

return profile;

