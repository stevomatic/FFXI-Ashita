local profile = {};
local sets = {
    Idle = {
        Main = 'Idris',
        Sub = 'Ammurapi Shield',
		Range = 'Dunna',
        Ammo = 'Displaced',
        Head = 'Azimuth Hood +3', -- 12 --
        Neck = 'Bagua Charm +2',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Azimuth Coat +3',
        Hands = 'Azimuth Gloves +3', -- 12 --
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Murky Ring', -- 10 --
        Back = 'Nantosuelta\'s Cape',
        Waist = 'Isa Belt',
        Legs = 'Nyame Flanchard', -- 8 --
        Feet = 'Azimuth Gaiters +3', -- 11 --
    },
    Resting = {
        Main = 'Idris',
        Sub = 'Ammurapi Shield',
		Range = 'Dunna',
        Ammo = 'Displaced',
        Head = 'Azimuth Hood +3',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Azimuth Coat +3',
        Hands = 'Azimuth Gloves +3',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Murky Ring',
        Back = 'Nantosuelta\'s Cape',
        Waist = 'Isa Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Azimuth Gaiters +3',
    },
    Tp = {
        Main = 'Idris',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'White Tathlum',
        Head = 'Ischkur Turban',
        Neck = 'Lissome Necklace',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Dedition Earring',
        Body = 'Nyame Mail',
        Hands = 'Gazu Bracelets +1',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Murky Ring',
        Back = 'Nantosuelta\'s Cape', -- dex stp --
        Waist = 'Windbuffet Belt +1',
        Legs = 'Jhakri Slops +2',
        Feet = 'Nyame Sollerets',
    },
    Precast = {
        Main = 'Idris',
        Sub = 'Ammurapi Shield',
		Range = 'Dunna',
        Ammo = 'Displaced',
        Head = 'Merlinic Hood',      --15--
        Neck = 'Voltsurge Torque',    -- 4--
        Ear1 = 'Malignance Earring',  -- 4--
        Ear2 = 'Azimuth Earring +1',  
        Body = 'Merlinic Jubbah',     --13--
        Hands = 'Merlinic Dastanas',  -- 7--
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Murky Ring',
        Back = 'Nantosuelta\'s Cape', --10--
        Waist = 'Shinjutsu-No-Obi +1',
        Legs = 'Geomancy Pants +3',   --15--
        Feet = 'Merlinic Crackows',   --12--
    },
    ImpactPrecast = {
        Main = 'Idris',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Sapience Orb',         -- 2--
        Head = 'Displaced',
        Neck = 'Voltsurge Torque',     -- 4--
        Ear1 = 'Malignance Earring',   -- 4--
        Ear2 = 'Loquac. Earring',      -- 2--
        Body = 'Crepuscular Cloak',
        Hands = 'Merlinic Dastanas',   -- 7--
        Ring1 = 'Weather. Ring',       -- 5 prolix or lebeche if no weather--
        Ring2 = 'Kishar Ring',         -- 4-- 
        Back = 'Nantosuelta\'s Cape',  --10--
        Waist = 'Shinjutsu-No-Obi +1', -- 5--
        Legs = 'Geomancy Pants +3',    --15--
        Feet = 'Merlinic Crackows',    --12--
    },
    Geo = {
        Main = 'Idris',
        Sub = 'Ammurapi Shield',
		Range = 'Dunna',
        Ammo = 'Displaced',
        Head = 'Azimuth Hood +3',
        Neck = 'Bagua Charm +2',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Azimuth Earring +1',
        Body = 'Bagua Tunic +4',
        Hands = 'Geo. Mitaines +4',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Nantosuelta\'s Cape',
        Waist = 'Shinjutsu-No-Obi +1',
        Legs = 'Bagua Pants +4',
        Feet = 'Bagua Sandals +3',
    },
    Indi = {
        Main = 'Idris',
        Sub = 'Ammurapi Shield',
		Range = 'Dunna',
        Ammo = 'Displaced',
        Head = 'Azimuth Hood +3',
        Neck = 'Bagua Charm +2',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Azimuth Earring +1',
        Body = 'Bagua Tunic +4',
        Hands = 'Geo. Mitaines +4',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Lifestream Cape',
        Waist = 'Shinjutsu-No-Obi +1',
        Legs = 'Bagua Pants +4',
        Feet = 'Azimuth Gaiters +3',
    },
    Nuke = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Azimuth Hood +3',
        Neck = 'Mizu. Kubikazari',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Azimuth Earring +1',
        Body = 'Azimuth Coat +3',
        Hands = 'Azimuth Gloves +3',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Freke Ring',
        Back = 'Nantosuelta\'s Cape',
        Waist = 'Acuity Belt +1',
        Legs = 'Azimuth Tights +2',
        Feet = 'Azimuth Gaiters +3',
    },
    Impact = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Displaced',
        Neck = 'Null Loop',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Azimuth Earring +1',
        Body = 'Crepuscular Cloak',
        Hands = 'Azimuth Gloves +3',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Null Shawl',
        Waist = 'Acuity Belt +1',
        Legs = 'Azimuth Tights +2',
        Feet = 'Azimuth Gaiters +3',
    },
    Stun = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Displaced',
        Head = 'Null Masque',
        Neck = 'Null Loop',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Azimuth Earring +1',
        Body = 'Azimuth Coat +3',
        Hands = 'Azimuth Gloves +3',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Null Shawl',
        Waist = 'Acuity Belt +1',
        Legs = 'Azimuth Tights +2',
        Feet = 'Azimuth Gaiters +3',
    },
    DrainAspir = {
        Main = 'Rubicundity',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Pixie Hairpin +1',
        Neck = 'Erra Pendant',
        Ear1 = 'Hirudinea Earring',
        Ear2 = 'Azimuth Earring +1',
        Body = 'Merlinic Jubbah', -- da --
        Hands = 'Merlinic Dastanas', -- da --
        Ring1 = 'Archon Ring',
        Ring2 = 'Evanescence Ring',
        Back = 'Aurist\'s Cape +1',
        Waist = 'Fucho-No-Obi',
        Legs = 'Merlinic Shalwar', --da 11 fern--
        Feet = 'Agwu\'s Pigaches',
    },
    Enfeeb = {
        Main = 'Daybreak',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Geo. Galero +2',
        Neck = 'Bagua Charm +2',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Azimuth Earring +1',
        Body = 'Geomancy Tunic +2',
        Hands = 'Regal Cuffs',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Kishar Ring',
        Back = 'Nantosuelta\'s Cape', -- mnd macc --
        Waist = 'Luminary Sash',
        Legs = 'Geomancy Pants +3',
        Feet = 'Geo. Sandals +3',
    },
    Cure = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Sors Shield',
		Range = 'Displaced',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Vanya Hood',
        Ear1 = 'Beatific Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Vanya Robe',
        Hands = 'Vanya Cuffs',
        Ring1 = 'Lebeche Ring',
        Ring2 = 'Stikini Ring +1',
        Back = 'Oretan. Cape +1',
        Waist = 'Shinjutsu-No-Obi +1',
        Legs = 'Vanya Slops',
        Feet = 'Vanya Clogs',
    },
    Cursna = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Sors Shield',
		Range = 'Displaced',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Vanya Hood',
		Neck = 'Debilis Medallion',
        Ear1 = 'Beatific Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Vanya Robe',
        Hands = 'Vanya Cuffs',
        Ring1 = 'Haoma\'s Ring',
        Ring2 = 'Menelaus\'s Ring',
        Back = 'Oretan. Cape +1',
        Waist = 'Shinjutsu-No-Obi +1',
        Legs = 'Vanya Slops',
        Feet = 'Vanya Clogs',
    },
    Exudation = {
        Main = 'Idris',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Crepuscular Pebble',
        Head = 'Nyame Helm',
        Neck = 'Fotia Gorget',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Cornelia\'s Ring',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Nantosuelta\'s Cape', -- mnd wsd --
        Waist = 'Fotia Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
	Movement = {
		Feet = 'Geo. Sandals +3',
	},
};
profile.Sets = sets;

profile.Packer = {
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 001');
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
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
end

profile.HandleAbility = function()
    local action = gData.GetAction();
    if (action.Name == 'Bolster') then
        gFunc.EquipSet({ Body = 'Bagua Tunic +4' });
    elseif (action.Name == 'Full Circle') then
        gFunc.EquipSet({ Head = 'Azimuth Hood +3' });
    elseif (action.Name == 'Life Cycle') then
        gFunc.EquipSet({ Body = 'Geomancy Tunic +2' });
    elseif (action.Name == 'Mending Halation') then
        gFunc.EquipSet({ Legs = 'Bagua Pants +4' });
    elseif (action.Name == 'Radial Arcana') then
        gFunc.EquipSet({ Feet = 'Bagua Sandals +3' });
    elseif (action.Name == 'Concentric Pulse') then
        gFunc.EquipSet({ Head = 'Bagua Galero +4' });
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local action = gData.GetAction();
    if (action.Name == 'Impact') then
        gFunc.EquipSet(sets.ImpactPrecast);
    else
        gFunc.EquipSet(sets.Precast);
    end
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();

    -- Healing Magic
    if (spell.Skill == 'Healing Magic') then
        if (spell.Name == 'Cursna') then
            gFunc.EquipSet(sets.Cursna);
        else
            gFunc.EquipSet(sets.Cure);
        end

    -- Enfeebling Magic
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeeb);

    -- Elemental Magic (Impact included here so it isn't shadowed by Nuke)
    elseif (spell.Skill == 'Elemental Magic') then
        if (spell.Name == 'Impact') then
            gFunc.EquipSet(sets.Impact);
        else
            gFunc.EquipSet(sets.Nuke);
        end

    -- Dark Magic
    elseif (spell.Skill == 'Dark Magic') then
        if (string.match(spell.Name, 'Drain') or string.match(spell.Name, 'Aspir')) then
            gFunc.EquipSet(sets.DrainAspir);
        elseif (spell.Name == 'Stun') then
            gFunc.EquipSet(sets.Stun);
        end

    -- Geomancy (Indi-/Geo- bubbles)
    elseif (spell.Skill == 'Geomancy') then
        if (string.match(spell.Name, 'Indi')) then
            gFunc.EquipSet(sets.Indi);
        elseif (string.match(spell.Name, 'Geo')) then
            gFunc.EquipSet(sets.Geo);
        end
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if (action.Name == 'Exudation') then
        gFunc.EquipSet(sets.Exudation);
    end
end

return profile;