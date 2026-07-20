local profile = {};
local sets = {
    Idle = {
        Main = 'Mpaca\'s Staff',
        Sub = 'Khonsu',
        Ammo = 'Homiliary',
        Head = 'Nyame Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Arbatel Gown +3',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Gurebu\'s Ring',
        Ring2 = 'Murky Ring',
        Back = 'Lugh\'s Cape', -- mev --
        Waist = 'Embla Sash',
        Legs = 'Agwu\'s Slops',
        Feet = 'Nyame Sollerets',
    },
    Sublimation = {
        Head = 'Acad. Mortar. +2',
        Body = 'Peda. Gown +4',
        Ear1 = 'Savant\'s Earring',
        Waist = 'Embla Sash',
    },
    Precast = {
        Main = 'Mpaca\'s Staff',
        Sub = 'Clerisy Strap +1',
        Ammo = 'Incantor Stone',
        Head = 'Peda. Mortar. +4',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Malignance Earring',
        Body = 'Pinga Tunic +1',
        Hands = 'Acad. Bracers +2',
        Ring1 = 'Prolix Ring',
        Ring2 = 'Kishar Ring',
        Back = { Name = 'Lugh\'s Cape', Augment = '"Fast Cast"+10' },
        Waist = 'Embla Sash',
        Legs = 'Pinga Pants +1',
        Feet = 'Acad. Loafers +2',
    },
    ImpactPrecast = {
        Main = 'Mpaca\'s Staff',
        Sub = 'Clerisy Strap +1',
        Ammo = 'Incantor Stone',
        Head = 'Displaced',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Malignance Earring',
        Body = 'Crepuscular Cloak',
        Hands = 'Acad. Bracers +2',
        Ring1 = 'Prolix Ring',
        Ring2 = 'Kishar Ring',
        Back = { Name = 'Lugh\'s Cape', Augment = '"Fast Cast"+10' },
        Waist = 'Embla Sash',
        Legs = 'Pinga Pants +1',
        Feet = 'Acad. Loafers +2',
    },
    Cure = {
        Main = 'Chatoyant Staff',
        Sub = 'Khonsu',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Kaykaus Mitra +1',
        Neck = 'Loricate Torque +1',
        Ear1 = 'Mendi. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Arbatel Gown +3',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Mephitas\'s Ring +1',
        Ring2 = 'Murky Ring',
        Back = 'Lugh\'s Cape', -- MND mev eva/mev enmity -10 dt 5 --
        Waist = 'Hachirin-No-Obi',
        Legs = 'Acad. Pants +2',
        Feet = 'Kaykaus Boots +1',
    },
    Cursna = {
        Main = 'Gada',
        Sub = 'Ammurapi Shield',
        Ammo = 'Homiliary',
        Head = 'Vanya Hood',
        Neck = 'Debilis Medallion',
        Ear1 = 'Meili Earring',
        Ear2 = 'Beatific Earring',
        Body = 'Peda. Gown +4',
        Hands = 'Hieros Mittens',
        Ring1 = 'Haoma\'s Ring',
        Ring2 = 'Menelaus\'s Ring',
        Back = 'Oretan. Cape +1',
        Waist = 'Bishop\'s Sash',
        Legs = 'Acad. Pants +2',
        Feet = 'Vanya Clogs',
    },
    Enhancing = {
        Main = 'Mpaca\'s Staff',
		Sub = 'Khonsu',
		Ammo = 'Pemphredo Tathlum',
		Head = 'Telchine Cap', -- enh dur --
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Mimir Earring',
        Ear2 = 'Andoaa Earring',
        Body = 'Peda. Gown +4',
        Hands = 'Arbatel Bracers +2',
        Ring1 = 'Stikini Ring +1',
		Ring2 = 'Stikini Ring +1',
        Back = 'Fi Follet Cape +1',
        Waist = 'Embla Sash',
        Legs = 'Telchine Braconi',  -- enh dur --
        Feet = 'Telchine Pigaches', -- enh dur --
    },
    Regen = { 
        Head = 'Arbatel Bonnet +2',
        Ear1 = 'Mendi. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Telchine Chas.', -- regen pot +3 --
        Hands = 'Telchine Gloves', -- regen pot +3 --
        Ring1 = 'Mephitas\'s Ring',
        Back = 'Bookworm\'s Cape', -- regen pot +3 --
        Legs = 'Telchine Braconi',  -- regen pot +3 --
        Feet = 'Telchine Pigaches', -- regen pot +3 --
    },
    Stoneskin = {
		Neck = 'Nodens Gorget',
		Ear1 = 'Earthcry Earring',
		Waist = 'Siegel Sash',
		Legs = 'Shedir Seraweels',
    },
    Aquaveil = {
		Main = 'Vadose Rod',
		Head = 'Amalric Coif +1',
		Hands = 'Regal Cuffs',
		Waist = 'Emphatikos Rope',
		Legs = 'Shedir Seraweels',
    },
	Storm = {
		Feet = 'Peda. Loafers +4',
	},
    DarkEnfeeb = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Acad. Mortar. +2',
        Neck = 'Argute Stole +2',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Arbatel Earring +1',
        Body = 'Acad. Gown +2',
        Hands = 'Regal Cuffs',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Aurist\'s Cape +1',
        Waist = 'Obstin. Sash',
        Legs = 'Arbatel Pants +2',
        Feet = 'Acad. Loafers +2',
    },
    LightEnfeeb = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Displaced',
        Neck = 'Argute Stole +2',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Arbatel Earring +1',
        Body = 'Cohort Cloak +1',
        Hands = 'Regal Cuffs',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Aurist\'s Cape +1',
        Waist = 'Obstin. Sash',
        Legs = 'Arbatel Pants +2',
        Feet = 'Acad. Loafers +2',
    },
	Elemental = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Agwu\'s Cap',
        Neck = 'Argute Stole +2',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Arbatel Earring +1',
        Body = 'Arbatel Gown +3',
        Hands = 'Agwu\'s Gages',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Freke Ring',
        Back = { Name = 'Lugh\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc.+20', [4] = 'INT+30', [5] = 'Magic Damage+20' } },
        Waist = 'Skrymir Cord +1',
        Legs = 'Agwu\'s Slops',
        Feet = 'Arbatel Loafers +3',
	},
	Helix = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Peda. Mortar. +4',
        Neck = 'Argute Stole +2',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Arbatel Earring +1',
        Body = 'Agwu\'s Robe',
        Hands = 'Agwu\'s Gages',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Freke Ring',
        Back = { Name = 'Lugh\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc.+20', [4] = 'INT+30', [5] = 'Magic Damage+20' } },
        Waist = 'Skrymir Cord +1',
        Legs = 'Agwu\'s Slops',
        Feet = 'Arbatel Loafers +3',	
	},
	DrainAspir = {
        Main = 'Rubicundity',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Pixie Hairpin +1',
        Neck = 'Erra Pendant',
        Ear1 = 'Mani Earring',
        Ear2 = 'Arbatel Earring +1',
        Ring1 = 'Evanescence Ring',
        Ring2 = 'Archon Ring',
        Back = 'Bookworm\'s Cape',
        Waist = 'Fucho-No-Obi',
        Legs = 'Peda. Pants +4',
        Feet = 'Agwu\'s Pigaches',
	},
	Stun = {
        Main = 'Contemplator +1',
        Sub = 'Khonsu',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Null Masque',
        Neck = 'Null Loop',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Arbatel Earring +1',
        Body = 'Acad. Gown +2',
        Hands = 'Acad. Bracers +2',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Null Shawl', 
        Waist = 'Null Belt',
        Legs = 'Acad. Pants +2',
        Feet = 'Peda. Loafers +4',	
	},
	Impact	= {
        Main = 'Contemplator +1',
        Sub = 'Khonsu',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Displaced',
        Neck = 'Null Loop',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Arbatel Earring +1',
        Body = 'Crepuscular Cloak',
        Hands = 'Acad. Bracers +2',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Null Shawl', 
        Waist = 'Null Belt',
        Legs = 'Acad. Pants +2',
        Feet = 'Peda. Loafers +4',		
	},
	Kaustra = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Pixie Hairpin +1',
        Neck = 'Argute Stole +2',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Arbatel Earring +1',
        Body = 'Agwu\'s Robe',
        Hands = 'Amalric Gages +1',
        Ring1 = 'Freke Ring',
        Ring2 = 'Archon Ring',
        Back = { Name = 'Lugh\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = '"Mag. Atk. Bns."+10', [3] = 'Mag. Acc.+20', [4] = 'INT+30', [5] = 'Magic Damage+20' } },
        Waist = 'Hachirin-No-Obi',
        Legs = 'Amalric Slops +1',
        Feet = 'Agwu\'s Pigaches',		
	},
	TP = {
        Ammo = 'Amar Cluster',
        Head = 'Blistering Sallet +1',
        Neck = 'Lissome Necklace',
        Ear1 = 'Crep. Earring',
        Ear2 = 'Telos Earring',
        Body = 'Nyame Mail',
        Hands = 'Gazu Bracelets +1',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Chirich Ring +1',
        Back = 'Lugh\'s Cape', -- dex acc/att stp -- 
        Waist = 'Grunfeld Rope',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',		
	},
	DefaultWeaponskill = { -- w/e --
        Ammo = 'Psilomene',
        Head = 'Amalric Coif +1',
        Neck = 'Dualism Collar +1',
        Ear1 = 'Nehalennia Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Acad. Gown +2',
        Hands = 'Otomi Gloves',
        Ring1 = 'Mephitas\'s Ring',
        Ring2 = 'Mephitas\'s Ring +1',
        Back = 'Lugh\'s Cape', 
        Waist = 'Shinjutsu-No-Obi +1',
        Legs = 'Acad. Pants +2',
        Feet = 'Peda. Loafers +4',			
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
    { Name = 'Br. Escutcheon', Quantity = 'all' },
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

-- Helper function to dynamic trace active Enfeebling Arts logic
local function GetEnfeeblingSet()
    if (gData.GetBuffCount('Dark Arts') > 0 or gData.GetBuffCount('Addendum: Black') > 0) then
        return sets.DarkEnfeeb;
    elseif (gData.GetBuffCount('Light Arts') > 0 or gData.GetBuffCount('Addendum: White') > 0) then
        return sets.LightEnfeeb;
    end
    -- Fallback default if completely out of Arts
    return sets.DarkEnfeeb; 
end

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 005');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 005');
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

-- Core Default / Idle loop
profile.HandleDefault = function()
    local player = gData.GetPlayer();
    
    -- Check if Engaged vs Idle
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.TP);
    else
        gFunc.EquipSet(sets.Idle);
    end
    
    -- If Sublimation is active (Charging/Complete), overlay the Sublimation set pieces
    if (gData.GetBuffCount('Sublimation: Activated') > 0 or gData.GetBuffCount('Sublimation: Complete') > 0) then
        gFunc.EquipSet(sets.Sublimation);
    end
end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

-- Precast set sorting
profile.HandlePrecast = function()
    local action = gData.GetAction();
    if (action.Name == 'Impact') then
        gFunc.EquipSet(sets.ImpactPrecast);
    else
        gFunc.EquipSet(sets.Precast);
    end
end

-- Full Midcast Sorting
profile.HandleMidcast = function()
    local spell = gData.GetAction();
    
    -- 1. Healing Magic sorting
    if (spell.Skill == 'Healing Magic') then
        if (spell.Name == 'Cursna') then
            gFunc.EquipSet(sets.Cursna);
        elseif (string.match(spell.Name, 'Cure') or string.match(spell.Name, 'Cura')) then
            gFunc.EquipSet(sets.Cure);
        end
        
    -- 2. Enhancing Magic sorting (Base + Substitutions)
    elseif (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
        
        if (string.match(spell.Name, 'Regen')) then
            gFunc.EquipSet(sets.Regen);
        elseif (spell.Name == 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin);
        elseif (spell.Name == 'Aquaveil') then
            gFunc.EquipSet(sets.Aquaveil);
        elseif (string.match(spell.Name, 'Storm')) then
            gFunc.EquipSet(sets.Storm);
        end
        
    -- 3. Enfeebling Magic Sorting
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(GetEnfeeblingSet());
        
    -- 4. Elemental & Named Spells Sorting
    elseif (spell.Skill == 'Elemental Magic') then
        if (string.match(spell.Name, 'Helix')) then
            gFunc.EquipSet(sets.Helix);
        elseif (spell.Name == 'Kaustra') then
            gFunc.EquipSet(sets.Kaustra);
        elseif (spell.Name == 'Impact') then
            gFunc.EquipSet(sets.Impact);
        else
            gFunc.EquipSet(sets.Elemental);
        end
        
    -- 5. Dark Magic & Edge-case hardcoded targets
    elseif (spell.Skill == 'Dark Magic') then
        if (string.match(spell.Name, 'Drain') or string.match(spell.Name, 'Aspir')) then
            gFunc.EquipSet(sets.DrainAspir);
        elseif (spell.Name == 'Stun') then
            gFunc.EquipSet(sets.Stun);
        end
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

-- Fallback catch-all for any used weaponskills
profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.DefaultWeaponskill);
end

return profile;