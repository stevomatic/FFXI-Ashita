local profile = {};
local sets = {
    Idle = {
        Main = 'Tauret',
        Sub = 'Enchufla',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Nyame Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Senuna\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+30', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Engraved Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Resting = {
        Main = 'Tauret',
        Sub = 'Enchufla',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Nyame Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Senuna\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+30', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Engraved Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Tp = {
        Main = 'Tauret',
        Sub = 'Enchufla',
        Ammo = 'Yamarang',
        Head = 'Horos Tiara +3',
        Neck = 'Etoile Gorget +2',
        Ear1 = 'Suppanomimi',
        Ear2 = 'Sherida Earring',
        Body = 'Horos Casaque +3',
        Hands = 'Gleti\'s Gauntlets',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Epona\'s Ring',
        Back = { Name = 'Senuna\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+30', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Reiki Yotai',
        Legs = 'Maxixi Tights +3',
        Feet = 'Horos T. Shoes +3',
    },
    Steps = {
        Ammo = 'Yamarang',
        Head = 'Maxixi Tiara +3',
        Ear1 = 'Mache Earring +1',
        Ear2 = 'Mache Earring +1',
        Body = 'Maxixi Casaque +3',
        Hands = 'Maxixi Bangles +3',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Chirich Ring +1',
        Waist = 'Kentarch Belt +1',
    },
    Waltz = {
        Main = 'Tauret',
        Sub = 'Enchufla',
        Ammo = 'Yamarang',
        Head = 'Horos Tiara +3',
        Neck = 'Etoile Gorget +2',
        Ear1 = 'Roundel Earring',
        Body = 'Maxixi Casaque +3',
        Hands = 'Herculean Gloves',  -- need aug --
        Back = { Name = 'Senuna\'s Mantle', Augment = '"Waltz" potency +10%' },
        Legs = 'Dashing Subligar',
        Feet = 'Maxixi Toe Shoes +3',
    },
    Samba = {
        Head = 'Maxixi Tiara +3',
        Back = { Name = 'Senuna\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+30', [4] = 'Attack+20', [5] = 'DEX+20' } },
    },
	Jigs = {
		Legs = 'Horos Tights +3',
		Feet = 'Maxixi Toe Shoes +3',
	},
    Climactic = {
        Head = 'Maculele Tiara +2',
    },
    Striking = {
        Body = 'Macu. Casaque +2',
    },
    Reverse = {
        Hands = 'Macu. Bangles +2',
        Back = 'Toetapper Mantle',
    },
    Trance = {
        Head = 'Horos Tiara +3',
    },
    SaberDance = {
        Legs = 'Horos Tights +3',
    },
    NoFootRise = {
        Body = 'Horos Casaque +3',
    },
    ClosedPosition = {
        Feet = 'Horos T. Shoes +3',
    },
	Enmity	= {
		Ammo = 'Iron Gobbet',	
        Head = 'Halitus Helm',
		Neck = 'Unmoving Collar +1',
        Body = 'Emet Harness +1',
        Hands = 'Horos Bangles +3',
        Ring1 = 'Provocare Ring',
        Ring2 = 'Eihwaz Ring',
        Back = { Name = 'Senuna\'s Mantle', Augment = { [1] = 'INT+20', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'Magic Damage+20', [5] = 'Enmity+10' } },
        Waist = 'Kasiri Belt',
        Legs = 'Zoar Subligar +1',
        Feet = 'Ahosi Leggings',
    },
    Macc = {
        Head = 'Mummu Bonnet +2',
        Ear1 = 'Digni. Earring',
        Ear2 = 'Macu. Earring +1',
        Body = 'Horos Casaque +3',
        Hands = 'Mummu Wrists +2',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = { Name = 'Senuna\'s Mantle', Augment = { [1] = 'INT+20', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'Magic Damage+20', [5] = 'Enmity+10' } },
        Waist = 'Eschan Stone',
        Legs = 'Horos Tights +3',
        Feet = 'Mummu Gamash. +2',
    },
    Precast = {
        Ammo = 'Sapience Orb',
		Neck = 'Voltsurge Torque',
		Head = 'Valorous Mask',
		Body = 'Valorous Mail',
        Hands = 'Leyline Gloves',
		Ear1 = 'Loquac. Earring',
		Ear2 = 'Enchntr. Earring +1',
        Ring1 = 'Prolix Ring',
        Ring2 = 'Rahab Ring',
        Back = { Name = 'Senuna\'s Mantle', Augment = '"Fast Cast"+10' },
        Legs = 'Valorous Hose',
        Feet = 'Valorous Greaves',
    },
    Evisceration = {
        Main = 'Tauret',
        Sub = 'Enchufla',
        Ammo = 'Charis Feather',
        Head = 'Blistering Sallet +1',
        Neck = 'Fotia Gorget',
        Ear1 = 'Odr Earring',
        Ear2 = 'Macu. Earring +1',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Gleti\'s Gauntlets',
        Ring1 = 'Ilabrat Ring',
        Ring2 = 'Mummu Ring',
        Back = { Name = 'Senuna\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+20', [3] = 'Crit.hit rate+10', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = 'Fotia Belt',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Gleti\'s Boots',
    },
    Aeolian = {
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Nyame Helm',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Friomisi Earring',
        Ear2 = 'Macu. Earring +1',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Karieyh Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Senuna\'s Mantle', Augment = { [1] = 'INT+20', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'Magic Damage+20', [5] = 'Enmity+10' } },
        Waist = 'Orpheus\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    DefaultWeaponskill = {
        Main = 'Tauret',
        Sub = 'Enchufla',
        Ammo = 'Charis Feather',
        Head = 'Blistering Sallet +1',
        Neck = 'Fotia Gorget',
        Ear1 = 'Odr Earring',
        Ear2 = 'Macu. Earring +1',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Gleti\'s Gauntlets',
        Ring1 = 'Ilabrat Ring',
        Ring2 = 'Mummu Ring',
        Back = { Name = 'Senuna\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+20', [3] = 'Crit.hit rate+10', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = 'Fotia Belt',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Gleti\'s Boots',
    },
};
profile.Sets = sets;

profile.Packer = {
    {Name = 'Panacea', Quantity = 'all'},
    {Name = 'Holy Water', Quantity = 'all'},
    {Name = 'Prism Powder', Quantity = 'all'},
    {Name = 'Silent Oil', Quantity = 'all'},
    {Name = 'Befouled Water', Quantity = 'all'},
    {Name = 'Silver Voucher', Quantity = 'all'},
    {Name = 'Copper Voucher', Quantity = 'all'},
    {Name = 'Warp Ring', Quantity = 'all'},
    {Name = 'Dim. Ring (Dem)', Quantity = 'all'},
    {Name = 'Echo Drops', Quantity = 'all'},
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 004');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 004');
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();

    if (player.Status == 'Idle') then
        gFunc.EquipSet(sets.Idle);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp);
    end
end

profile.HandleAbility = function()
    local action = gData.GetAction();

    -- Sambas (Haste Samba, Drain Samba, Aspir Samba, and their upgrades)
    if (string.find(action.Name, 'Samba')) then
        gFunc.EquipSet(sets.Samba);

    -- Steps (Box Step, Quickstep, Stutter Step, Feather Step, and their upgrades)
    elseif (string.find(action.Name, 'Step') and action.Name ~= 'Closed Position') then
        gFunc.EquipSet(sets.Steps);

    -- Waltzes (Curing Waltz, Divine Waltz, Healing Waltz, and their upgrades)
    elseif (string.find(action.Name, 'Waltz')) then
        gFunc.EquipSet(sets.Waltz);

    -- Jigs (Chocobo Jig, Spectral Jig, and their upgrades)
    elseif (string.find(action.Name, 'Jig')) then
        gFunc.EquipSet(sets.Jigs);

    -- Flourishes
    elseif (action.Name == 'Climactic Flourish') then
        gFunc.EquipSet(sets.Climactic);
    elseif (action.Name == 'Striking Flourish') then
        gFunc.EquipSet(sets.Striking);
    elseif (action.Name == 'Reverse Flourish') then
        gFunc.EquipSet(sets.Reverse);
    elseif (action.Name == 'Animated Flourish') then
        gFunc.EquipSet(sets.Enmity);
    elseif (action.Name == 'Violent Flourish') then
        gFunc.EquipSet(sets.Macc);

    -- Other job abilities
    elseif (action.Name == 'Trance') then
        gFunc.EquipSet(sets.Trance);
    elseif (action.Name == 'Saber Dance') then
        gFunc.EquipSet(sets.SaberDance);
    elseif (action.Name == 'No Foot Rise') then
        gFunc.EquipSet(sets.NoFootRise);
    elseif (action.Name == 'Closed Position') then
        gFunc.EquipSet(sets.ClosedPosition);
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.precast);
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.Evisceration);
    elseif (action.Name == 'Aeolian Edge') then
        gFunc.EquipSet(sets.Aeolian);
    else
        gFunc.EquipSet(sets.DefaultWeaponskill);
    end
end

return profile;

-- TODO: check job abilities for pieces that need to stay equipped for the duration of the
-- buff (Trance, Saber Dance, No Foot Rise, Closed Position, etc.) vs. ones that should be
-- swapped back to Idle/Tp right after activation completes.