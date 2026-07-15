local profile = {};
local sets = {
    Idle = {
        Main = 'Yagrush',
        Sub = 'Thuellaic Ecu +1',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Nyame Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Etiolation Earring', 
        Body = 'Ebers Bliaut +3',
        Hands = 'Ebers Mitts +3',
        Ring1 = 'Murky Ring',
        Ring2 = 'Gurebu\'s Ring',
        Back = 'Alaunus\'s Cape',    -- MEVA --
        Waist = 'Carrier\'s Sash',
        Legs = 'Ebers Pant. +3',
        Feet = 'Ebers Duckbills +3',
    },
    Resting = {
        Main = 'Malignance Pole',
        Sub = 'Mensch Strap +1',
        Ammo = 'Homiliary',
        Head = 'Nyame Helm',
        Neck = 'Loricate Torque +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Etiolation Earring', 
        Body = 'Ebers Bliaut +3',
        Hands = 'Ebers Mitts +3',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Gurebu\'s Ring',
        Back = 'Alaunus\'s Cape',    -- MEVA --
        Waist = 'Carrier\'s Sash',
        Legs = 'Ebers Pant. +3',
        Feet = 'Ebers Duckbills +3',
    },
    Tp = {
        Main = 'Yagrush',
        Sub = 'Genmei Shield',
        Ammo = 'Amar Cluster',
        Head = 'Bunzi\'s Hat',
        Neck = 'Combatant\'s Torque',
        Ear1 = 'Dedition Earring',
        Ear2 = 'Telos Earring',
        Body = 'Nyame Mail',
        Hands = 'Bunzi\'s Gloves',
        Ring1 = 'Murky Ring',
        Ring2 = 'Chirich Ring +1',
        Back = 'Alaunus\'s Cape', -- DEX Acc/Att DA --
        Waist = 'Cetl Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Precast = {
        Main = 'C. Palug Hammer',    --  7 --
        Sub = 'Chanter\'s Shield',   --  3 --
        Ammo = 'Impatiens',
        Head = 'Ebers Cap +3',       -- 13 -- 
        Neck = 'Clr. Torque +2',     -- 10 --
        Ear1 = 'Loquac. Earring',    --  2 --
        Ear2 = 'Malignance Earring', --  4 --
        Body = 'Inyanga Jubbah +2',  -- 14 --
        Hands = 'Chironic Gloves',   --  7 Fern Sang Buaya Reisenjima Behemoth Leather --
        Ring1 = 'Lebeche Ring',      
        Ring2 = 'Kishar Ring',       --  4 --
        Back = 'Perimede Cape',
        Waist = 'Wiful Belt',        --  3 --
        Legs = 'Aya. Cosciales +2',  --  6 -- 
        Feet = 'Chironic Slippers',  --  7 Fern Sabotender Royal Reisenjima Behemoth Leather 80fc 10 qm--
    },
    Cure_Precast = {
        Ear1 = 'Mendi. Earring',
        Feet = 'Vanya Clogs',
    },
    Enhancing_Precast = {
        Waist = 'Siegel Sash',
    },
    Stoneskin_Precast = {
        Head = 'Umuthi Hat',
        Hands = 'Carapacho Cuffs',
        Waist = 'Siegel Sash',
    },
	Self_Cure = {
	},
	Self_Refresh = {
	},
    Erase_na = {
        Main = 'Yagrush',
        Sub = 'Thuellaic Ecu +1',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Kaykaus Mitra +1',
        Neck = 'Clr. Torque +2',
        Ear1 = 'Glorious Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Ebers Bliaut +3',
        Hands = 'Ebers Mitts +3',
        Ring1 = 'Mephitas\'s Ring +1',
        Ring2 = 'Janniston Ring',
        Back = 'Mending Cape',
        Waist = 'Hachirin-No-Obi',
        Legs = 'Ebers Pant. +3',
        Feet = 'Kaykaus Boots +1',
    },
    EnfAcc = {
        Main = 'Yagrush',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Theo. Cap +4',
        Neck = 'Null Loop',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Ebers Earring +1',
        Body = 'Theo. Bliaut +4',
        Hands = 'Theo. Mitts +4',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Null Shawl',
        Waist = 'Obstin. Sash',
        Legs = 'Chironic Hose', -- MACC oseem healing any stone 30-40 --
        Feet = 'Theo. Duckbills +4',
    },
    Dark = {
        Main = 'Yagrush',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Theo. Cap +4',
        Neck = 'Null Loop',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Ebers Earring +1',
        Body = 'Theo. Bliaut +4',
        Hands = 'Theo. Mitts +4',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Null Shawl',
        Waist = 'Obstin. Sash',
        Legs = 'Chironic Hose', -- MACC oseem healing any stone 30-40 --
        Feet = 'Theo. Duckbills +4',
    },
    Drain = {
        Main = 'Yagrush',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Theo. Cap +4',
        Neck = 'Null Loop',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Ebers Earring +1',
        Body = 'Theo. Bliaut +4',
        Hands = 'Theo. Mitts +4',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Null Shawl',
        Waist = 'Obstin. Sash',
        Legs = 'Chironic Hose', -- MACC oseem healing any stone 30-40 --
        Feet = 'Theo. Duckbills +4',
    },
    Impact = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Displaced',
        Neck = 'Null Loop',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Ebers Earring +1',
        Body = 'Crepuscular Cloak',
        Hands = 'Ebers Mitts',
        Ring1 = 'Freke Ring',
        Ring2 = 'Archon Ring',
        Back = 'Null Shawl',
        Waist = 'Null Belt',
        Legs = 'Ebers Pant. +3',
        Feet = 'Ebers Duckbills +3',
    },
    Cure = {
        Main = 'Queller Rod',
        Sub = 'Thuellaic Ecu +1',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Kaykaus Mitra +1',
        Neck = 'Clr. Torque +2',
        Ear1 = 'Glorious Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Ebers Bliaut +3',
        Hands = 'Theophany Mitts +4',
        Ring1 = 'Mephitas\'s Ring +1',
        Ring2 = 'Janniston Ring',
        Back = 'Alaunus\'s Cape',
        Waist = 'Hachirin-No-Obi',
        Legs = 'Ebers Pant. +3',
        Feet = 'Kaykaus Boots +1',
    },
    Curaga = {
        Main = 'Queller Rod',
        Sub = 'Thuellaic Ecu +1',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Kaykaus Mitra +1',
        Neck = 'Clr. Torque +2',
        Ear1 = 'Glorious Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Theo. Bliaut +4',
        Hands = 'Theophany Mitts +4',
        Ring1 = 'Mephitas\'s Ring +1',
        Ring2 = 'Janniston Ring',
        Back = 'Twilight Cape',
        Waist = 'Hachirin-No-Obi',
        Legs = 'Ebers Pant. +3',
        Feet = 'Kaykaus Boots +1',
    },
    Regen = {
        Main = 'Bolebunga',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Inyanga Tiara +2',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Gifted Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Piety Bliaut +4',
        Hands = 'Ebers Mitts +3',
        Ring1 = 'Mephitas\'s Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Solemnity Cape',
        Waist = 'Embla Sash',
        Legs = 'Th. Pant. +4',
        Feet = 'Bunzi\'s Sabots',
    },
    Cursna = {
        Main = 'Yagrush',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Vanya Hood',
        Neck = 'Debilis Medallion',
        Ear1 = 'Meili Earring',
        Ear2 = 'Ebers Earring +1',
        Body = 'Ebers Bliaut +3',
        Hands = 'Fanatic Gloves',
        Ring1 = 'Haoma\'s Ring',
        Ring2 = 'Menelaus\'s Ring',
        Back = 'Alaunus\'s Cape',
        Waist = 'Bishop\'s Sash',
        Legs = 'Th. Pant. +4',
        Feet = 'Vanya Clogs',
    },
    Refresh = {
        Main = 'Gada', --  ENH Duration --
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Telchine Cap',
        Neck = 'Nodens Gorget',
        Ear1 = 'Earthcry Earring',
        Ear2 = 'Mimir Earring',
        Body = 'Telchine Chas.',
        Hands = 'Telchine Gloves',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Solemnity Cape',
        Waist = 'Siegel Sash',
        Legs = 'Shedir Seraweels',
        Feet = 'Theo. Duckbills +4',
    },
    Phalanx = {
        Main = 'Gada', --  ENH Duration --
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Telchine Cap',
        Neck = 'Nodens Gorget',
        Ear1 = 'Earthcry Earring',
        Ear2 = 'Mimir Earring',
        Body = 'Telchine Chas.',
        Hands = 'Telchine Gloves',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Solemnity Cape',
        Waist = 'Siegel Sash',
        Legs = 'Shedir Seraweels',
        Feet = 'Theo. Duckbills +4',
    },
    Enhancing = {
        Main = 'Beneficus',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Ebers Cap +3',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Andoaa Earring',
        Ear2 = 'Mimir Earring',
        Body = 'Ebers Bliaut +3',
        Hands = 'Ebers Mitts +3',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Alaunus\'s Cape',
        Waist = 'Embla Sash',
        Legs = 'Piety Pantaln. +4',
        Feet = 'Ebers Duckbills +3',
    },
    Aquaveil = {
        Main = 'Vados Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Chironic Hat',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Gifted Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Telchine Chas.', -- ENH Duration --
        Hands = 'Regal Cuffs',
        Ring1 = 'Mephitas\'s Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Solemnity Cape',
        Waist = 'Emphatikos Rope',
        Legs = 'Shedir Seraweels',
        Feet = 'Theo. Duckbills +4',
    },
    SS = {
        Main = 'Gada', --  ENH Duration --
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Telchine Cap',
        Neck = 'Nodens Gorget',
        Ear1 = 'Earthcry Earring',
        Ear2 = 'Mimir Earring',
        Body = 'Telchine Chas.',
        Hands = 'Telchine Gloves',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Solemnity Cape',
        Waist = 'Siegel Sash',
        Legs = 'Shedir Seraweels',
        Feet = 'Theo. Duckbills +4',
    },
    Auspice = {
        Main = 'Gada', -- Duration +6 Fern --
        Head = 'Telchine Cap',
        Body = 'Telchine Chas.',
        Hands = 'Telchine Gloves',
        Waist = 'Embla Sash',
        Legs = 'Telchine Braconi',
        Feet = 'Ebers Duckbills +3',
    },
    Divine = {
        Main = 'Daybreak',
        Sub = 'Ammurapi Shield',
        Ammo = 'Hydrocera',
        Head = 'Theophany Cap +4',
        Neck = 'Jokushu Chain',
        Ear1 = 'Saxnot Earring',
        Ear2 = 'Malignance Earring',
        Body = 'Theo. Bliaut +4',
        Hands = 'Piety Mitts +4',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Aurist\'s Cape +1',
        Waist = 'Luminary Sash',
        Legs = 'Th. Pant. +4',
        Feet = 'Theo. Duckbills +4',
    },
    Nuke = {
        Main = 'Daybreak',
        Sub = 'Ammurapi Shield',
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Displaced',
        Neck = 'Jokushu Chain',
        Ear1 = 'Saxnot Earring',
        Ear2 = 'Malignance Earring',
        Body = 'Cohort Cloak +1',
        Hands = 'Bunzi\'s Gloves',
        Ring1 = 'Freke Ring',
        Ring2 = 'Stikini Ring +1',
        Back = 'Alaunus\'s Cape', -- MND Macc/DMG MAB --
        Waist = 'Luminary Sash',
        Legs = 'Bunzi\'s Pants',
        Feet = 'Bunzi\'s Sabots',
    },
    Mysticboon = {
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
    Judgment = {
    },
    Blackhalo = {
    },
    Randgrith = {
    },
    Flashnova = {
    },
    DefaultWeaponskill = {
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
    { Name = 'Alchemist\'s Ring', Quantity = 'all' },
    { Name = 'Craftkeeper\'s Ring', Quantity = 'all' },
    { Name = 'Craftmaster\'s Ring', Quantity = 'all' },
    { Name = 'Caduceus', Quantity = 'all' },
    { Name = 'Brewer\'s Shield', Quantity = 'all' },
    { Name = 'Alchemist\'s Apron', Quantity = 'all' },
    { Name = 'Confectioner\'s Ring', Quantity = 'all' },
    { Name = 'Artificer\'s Ring', Quantity = 'all' },
    { Name = 'Instant Reraise', Quantity = 'all' },
    { Name = 'Coconut Rusk', Quantity = 'all' },
    { Name = 'Tropical Crepe', Quantity = 'all' },
    { Name = 'Mars Orb', Quantity = 'all' },
    { Name = 'Venus Orb', Quantity = 'all' },
    { Name = 'Miso Ramen', Quantity = 'all' },
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 002');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 002');
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        gFunc.EquipSet(sets.Idle);
    end
end

-- Benediction Piety Bliaut --
-- Martyr Piety Mitts --
-- Devotion Piety Cap --
-- Divine Caress Ebers Mitts Mending Cape --
profile.HandleAbility = function()

end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();

    gFunc.EquipSet(sets.Precast);

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing_Precast);

        if string.contains(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin_Precast);
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure_Precast);
    end


end

-- poisona --
-- paralyna --
-- silena --
-- viruna -- 
-- stona --
profile.HandleMidcast = function()
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
    if (spell.Name == 'Erase') then
        gFunc.EquipSet(sets.Erase_na);
    elseif (spell.Name == 'Phalanx') then
        gFunc.EquipSet(sets.Phalanx);
    elseif (spell.Name == 'Refresh') then
        gFunc.EquipSet(sets.Refresh);
    elseif (spell.Name == 'Aquaveil') then
        gFunc.EquipSet(sets.Aquaveil);
    elseif (spell.Name == 'Stoneskin') then
        gFunc.EquipSet(sets.SS);
	end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
        if (target.Name == me) then
            gFunc.EquipSet(sets.Self_Cure);
        end
        if string.contains(spell.Name, 'Curaga') then
            gFunc.EquipSet(sets.Curaga);
        end
        if string.contains(spell.Name, 'Regen') then
            gFunc.EquipSet(sets.Regen);
        end
        if (spell.Name == 'Cursna') then
            gFunc.EquipSet(sets.Cursna);
        end
        if (spell.Name == 'Poisona') then
            gFunc.EquipSet(sets.Erase_na);
        end
        if (spell.Name == 'Paralyna') then
            gFunc.EquipSet(sets.Erase_na);
        end
        if (spell.Name == 'Silena') then
            gFunc.EquipSet(sets.Erase_na);
        end
        if (spell.Name == 'Viruna') then
            gFunc.EquipSet(sets.Erase_na);
        end
        if (spell.Name == 'Stona') then
            gFunc.EquipSet(sets.Erase_na);
        end
    elseif (spell.Skill == 'Divine Magic') then
        gFunc.EquipSet(sets.Nuke);
        if (spell.Name == 'Flash') then
            gFunc.EquipSet(sets.Divine);
        end
        if (spell.Name == 'Repose') then
            gFunc.EquipSet(sets.Divine);
		end	
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.EnfAcc);
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Dark); -- mostly macc anyways
        if (string.contains(spell.Name, 'Aspir') or string.contains(spell.Name, 'Drain')) then
            gFunc.EquipSet(sets.Drain);
        end
        if string.contains(spell.Name, 'Impact') then
            gFunc.EquipSet(sets.Impact);
        end
	end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if (action.Name == 'Mystic Boon') then
        gFunc.EquipSet(sets.Mysticboon);
    elseif (action.Name == 'Judgment') then
        gFunc.EquipSet(sets.Judgment);
    elseif (action.Name == 'Black Halo') then
        gFunc.EquipSet(sets.Blackhalo);
    elseif (action.Name == 'Randgrith') then
        gFunc.EquipSet(sets.Randgrith);
    elseif (action.Name == 'Flash Nova') then
        gFunc.EquipSet(sets.Flashnova);
    else
        gFunc.EquipSet(sets.DefaultWeaponskill);
    end
end

return profile;