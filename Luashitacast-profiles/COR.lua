local profile = {};
local MeleeMode = 1
local MeleeModes = {
    'Rostam',
    'Naegling'
}

local RangedMode = 1
local RangedModes = {
    'Fomalhaut',
    'Armageddon',
    'Earp',
    'DeathPenalty'
}
local sets = {
    Idle = {
        Head = 'Nyame Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Defending Ring',
        Ring2 = 'Murky Ring',
        Back = 'Camulus\'s Mantle',
        Waist = 'Carrier\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Resting = {
        Head = 'Nyame Helm',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Chirich Ring +1',
        Back = 'Camulus\'s Mantle',
        Waist = 'Carrier\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Rostam = {
        Main = 'Tauret',
        Sub = 'Gleti\'s Knife',
        Head = 'Clemen. Somen',
        Neck = 'Iskur Gorget',
        Ear1 = 'Dedition Earring',
        Ear2 = 'Alabaster Earring',
        Body = 'Clemen. Hara.',
        Hands = 'Clemency Kote',
        Ring1 = 'Epona\'s Ring',
        Ring2 = 'Petrov Ring',
        Back = 'Camulus\'s Mantle', -- DEX STP --
        Waist = 'Reiki Yotai',
        Legs = 'Chas. Culottes +3',
        Feet = 'Clem. Sune-Ate',
    },
    Naegling = {
        Main = 'Naegling',
        Sub = 'Gleti\'s Knife',
        Head = 'Clemen. Somen',
        Neck = 'Iskur Gorget',
        Ear1 = 'Dedition Earring',
        Ear2 = 'Alabaster Earring',
        Body = 'Clemen. Hara.',
        Hands = 'Clemency Kote',
        Ring1 = 'Epona\'s Ring',
        Ring2 = 'Petrov Ring',
        Back = 'Camulus\'s Mantle', -- DEX STP --
        Waist = 'Reiki Yotai',
        Legs = 'Chas. Culottes +3',
        Feet = 'Clem. Sune-Ate',
    },
    Armageddon = {
        Range = 'Armageddon',
        Ammo = 'Chrono Bullet',
	},
    DeathPenalty = {
        Range = 'Death Penalty',
        Ammo = 'Chrono Bullet',
    },
    Earp = {
        Range = 'Earp',
        Ammo = 'Chrono Bullet',
    },
    Fomalhaut = {
        Range = 'Fomalhaut',
        Ammo = 'Chrono Bullet',
    },
    Evisceration = {
        Head = 'Clemen. Somen',
        Neck = 'Comm. Charm +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Clemen. Hara.',
        Hands = 'Clemency Kote',
        Ring1 = 'Begrudging Ring',
        Ring2 = 'Ilabrat Ring',
        Back = 'Camulus\'s Mantle', -- DEX Crit --
        Waist = 'Fotia Belt',
        Legs = 'Clem. Haidate',
        Feet = 'Clem. Sune-Ate',
    },
    SavageBlade = {
        Head = 'Clemen. Somen',
        Neck = 'Comm. Charm +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Ikenga\'s Vest',
        Hands = 'Chasseur\'s Gants +3',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Camulus\'s Mantle', -- STR WSD --
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Lanun Bottes +4',
    },
    HotShot = {
		Ammo = 'Living Bullet',
        Head = 'Nyame Helm',
        Neck = 'Fotia Gorget',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Camulus\'s Mantle', -- AGI WSD --
        Waist = 'Fotia Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Lanun Bottes +4',
    },
    LastStand = {
        Head = 'Clemen. Somen',
        Neck = 'Fotia Gorget',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Ikenga\'s Vest',
        Hands = 'Chasseur\'s Gants +3',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Camulus\'s Mantle', -- AGI WSD --
        Waist = 'Fotia Belt',
        Legs = 'Clem. Haidate',
        Feet = 'Clem. Sune-Ate',
    },
    LeadenSalute = {
		Ammo = 'Living Bullet',
        Head = 'Pixie Hairpin +1',
        Neck = 'Comm. Charm +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Lanun Frac +4',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Dingir Ring',
        Ring2 = 'Archon Ring',
        Back = 'Camulus\'s Mantle', -- AGI WSD --
        Waist = 'Skrymir Cord +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Lanun Bottes +4',
    },
    Terminus = {
        Head = 'Clemen. Somen',
        Neck = 'Comm. Charm +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Ikenga\'s Vest',
        Hands = 'Chasseur\'s Gants +3',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Alabaster Mantle',
        Waist = 'Fotia Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Lanun Bottes +4',
    },
    Wildfire = {
		Ammo = 'Living Bullet',
        Head = 'Nyame Helm',
        Neck = 'Comm. Charm +2',
        Ear1 = 'Friomisi Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Lanun Frac +4',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Dinger Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Camulus\'s Mantle', -- AGI WSD --
        Waist = 'Skrymir Cord +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Lanun Bottes +4',
    },
    QuickDraw = {
        Head = 'Laksa. Tricorne +4',
        Neck = 'Comm. Charm +2',
        Ear1 = 'Crepuscular Earring',
        Ear2 = 'Chas. Earring +1',
        Body = 'Ikenga\'s Vest',
        Hands = 'Laksa. Gants +4',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Camulus\'s Mantle', -- AGI macc --
        Waist = 'K. Kachina Belt +1',
        Legs = 'Ikenga\'s Trousers',
        Feet = 'Laksa. Bottes +4',
    },
    TripleShot = {
        Head = 'Oshosi Mask +1',
        Neck = 'Comm. Charm +2',
        Ear1 = 'Telos Earring',
        Ear2 = 'Crepuscular Earring',
        Body = 'Chasseur\'s Frac +3',
        Hands = 'Lanun Gants +1',
        Ring1 = 'Hajduk Ring +1',
        Ring2 = 'Ilabrat Ring',
        Back = 'Camulus\'s Mantle',
        Waist = 'K. Kachina Belt +1',
        Legs = 'Oshosi Trousers +1',
        Feet = 'Oshosi Leggings +1',
    },
    Rolls = {
        Main = 'Rostam',
		Sub = 'Displaced',
		Range = 'Compensator',
        Ammo = 'Displaced',
        Head = 'Lanun Tricorne +4',
        Neck = 'Regal Necklace',
        Body = 'Chasseur\'s Gants +3',
        Hands = 'Lanun Gants +4',
        Ring1 = 'Luzaf\'s Ring',
		Ring2 = 'Barataria Ring',
        Back = 'Camulus\'s Mantle',
        Legs = 'Desultor Tassets',
    },	
    Preshot = {	
        Head = 'Chass. Tricorne +3',
        Neck = 'Comm. Charm +2',
        Body = 'Oshosi Vest +1',
        Hands = 'Carmine Fin. Ga. +1',
        Ring1 = 'Crepuscular Ring',
        Back = 'Camulus\'s Mantle', --snapshot +10 --
        Waist = 'Impulse Belt',
        Legs = 'Adhemar Kecks +1',
        Feet = 'Meg. Jam. +2',
    },
    Midshot = {
        Head = 'Ikenga\'s Hat',
        Neck = 'Iskur Gorget',
        Ear1 = 'Telos Earring',
        Ear2 = 'Crepuscular Earring',
        Body = 'Ikenga\'s Vest',
        Hands = 'Ikenga\'s Gloves',
        Ring1 = 'Crepuscular Ring',
        Ring2 = 'Ilabrat Ring',
        Back = 'Camulus\'s Mantle', -- AGI racc stp --
        Waist = 'Yemaya Belt',
        Legs = 'Chas. Culottes +3',
        Feet = 'Ikenga\'s Clogs',
    },
    Precast = {
        Head = 'Carmine Mask +1',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Enchntr. Earring +1',
        Body = 'Taeon Tabard',
        Hands = 'Leyline Gloves',
        Ring1 = 'Kishar Ring',
        Ring2 = 'Rahab Ring',
        Back = 'Camulus\'s Mantle',
        Legs = 'Herculean Trousers',
        Feet = 'Carmine Greaves +1',
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
    { Name = 'Liv. Bul. Pouch', Quantity = 'all' },
    { Name = 'Chr. Bul. Pouch', Quantity = 'all' },
    { Name = 'Living Bullet', Quantity = 'all' },
    { Name = 'Shihei', Quantity = 'all' },
    { Name = 'Trump Card', Quantity = 'all' },
    { Name = 'Toolbag (Shihei)', Quantity = 'all' },
    { Name = 'Trump Card Case', Quantity = 'all' },
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 004');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 004');
    AshitaCore:GetChatManager():QueueCommand(1, '/bind F5 /lac fwd main');
    AshitaCore:GetChatManager():QueueCommand(1, '/bind F6 /lac fwd range');
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/unbind F5')
    AshitaCore:GetChatManager():QueueCommand(1, '/unbind F6')
end

profile.HandleCommand = function(args)
    if (args[1] == 'main') then
        MeleeMode = MeleeMode + 1
        if (MeleeMode > #MeleeModes) then
            MeleeMode = 1
        end

        gFunc.Message('Main: ' .. MeleeModes[MeleeMode])

    elseif (args[1] == 'range') then
        RangedMode = RangedMode + 1
        if (RangedMode > #RangedModes) then
            RangedMode = 1
        end

        gFunc.Message('Range: ' .. RangedModes[RangedMode])
    end

end

profile.HandleDefault = function()
    local player = gData.GetPlayer()

    -- Always keep selected weapons equipped
    gFunc.EquipSet(sets[MeleeModes[MeleeMode]])
    gFunc.EquipSet(sets[RangedModes[RangedMode]])

    if player.Status == 'Resting' then
        gFunc.EquipSet(sets.Resting)
    elseif player.Status ~= 'Engaged' then
        gFunc.EquipSet(sets.Idle)
    end


end

profile.HandleAbility = function()
    local action = gData.GetAction()
QuickDraw = {
    ["Fire Shot"] = true,
    ["Ice Shot"] = true,
    ["Wind Shot"] = true,
    ["Earth Shot"] = true,
    ["Thunder Shot"] = true,
    ["Water Shot"] = true,
    ["Light Shot"] = true,
    ["Dark Shot"] = true,
}
if QuickDraw[action.Name] then
    gFunc.EquipSet(sets.QuickDraw)
    return
end
	gFunc.EquipSet(sets.Rolls)
	if action.Name == 'Blitzer\'s Roll' then
		gFunc.Equip('Head', 'Chass. Tricorne +3')
	elseif action.Name == 'Tactician\'s Roll' then
		gFunc.Equip('Body', 'Chasseur\'s Frac +3')
	elseif action.Name == 'Allies\' Roll' then
		gFunc.Equip('Hands', 'Chasseur\'s Gants +3')
	elseif action.Name == 'Caster\'s Roll' then
		gFunc.Equip('Legs', 'Chas. Culottes +3')
	elseif action.Name == 'Courser\'s Roll' then
		gFunc.Equip('Feet', 'Chass. Bottes +3')
	elseif action.Name == 'Wild Card' then
		gFunc.Equip('Feet', 'Lanun Bottes +4')
	elseif action.Name == 'Random Deal' then
		gFunc.Equip('Body', 'Lanun Frac +4')
	elseif action.Name == 'Snake Eye' then
		gFunc.Equip('Legs', 'Lanun Trews +4')
	elseif action.Name == 'Fold' then
		gFunc.Equip('Hands', 'Lanun Gants +4')
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
	gFunc.EquipSet(sets.Preshot)
end

profile.HandleMidshot = function()
	local player = gData.GetPlayer()
	if (gData.GetBuffCount('Triple Shot') > 0) then
        gFunc.EquipSet(sets.TripleShot)
    else
        gFunc.EquipSet(sets.Midshot)
    end
end

profile.HandleWeaponskill = function()
    local ws = gData.GetAction().Name

    if ws == 'Evisceration' then
        gFunc.EquipSet(sets.Evisceration)

    elseif ws == 'Savage Blade' then
        gFunc.EquipSet(sets.SavageBlade)

    elseif ws == 'Hot Shot' then
        gFunc.EquipSet(sets.HotShot)

    elseif ws == 'Last Stand' then
        gFunc.EquipSet(sets.LastStand)

    elseif ws == "Leaden Salute" then
        gFunc.EquipSet(sets.LeadenSalute)

    elseif ws == 'Terminus' then
        gFunc.EquipSet(sets.Terminus)

	elseif ws == 'Wildfire' then
		gFunc.EquipSet(sets.Wildfire)
    end
end

return profile;
