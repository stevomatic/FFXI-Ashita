local profile = {};
local TpModes = {
    'TpAcc',
    'TpDt',
    'TpMev',
    'TpRng',
    'Subtle'
}
local CurrentTpMode = 1
local sets = {
    ['Idle'] = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Nyame Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Smertrios\'s Mantle', Augment = { [1] = 'STR+30' } },
        Waist = 'Carrier\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    ['Resting'] = { --regen gear--
        Ammo = 'Staunch Tathlum +1',
        Head = 'Nyame Helm',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Chirich Ring +1',
        Back = { Name = 'Smertrios\'s Mantle', Augment = { [1] = 'STR+30' } },
        Waist = 'Carrier\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    ['TpAcc'] = {
		Sub = 'Utu Grip',
        Ammo = 'Amar Cluster',
        Head = 'Kasuga Kabuto +3',
        Neck = 'Sam. Nodowa +2',
        Ear1 = 'Schere Earring',
        Ear2 = 'Kasuga Earring +2',
        Body = 'Kasuga Domaru +3',
        Hands = 'Wakido Kote +4',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Niqmaddu Ring',
        Back = { Name = 'Smertrios\'s Mantle', Augment = { [1] = 'DEX+20' } },
        Waist = 'Ioskeha Belt +1',
        Legs = 'Kasuga Haidate +3',
        Feet = 'Wakido Sune. +4',
    },
    ['TpDt'] = {
		Sub = 'Utu Grip',
        Ammo = 'Aurgelmir Orb +1',
        Head = 'Kasuga Kabuto +3',
        Neck = 'Moonlight Nodowa',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Kasuga Earring +2',
        Body = 'Kasuga Domaru +3',
        Hands = 'Clemency Kote',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Niqmaddu Ring',
        Back = 'Takaha Mantle', -- STR 1~5 STp 1~3 Zanshin 1~5 Meditate 4~8 --
        Waist = 'Sweordfaetels +1',
        Legs = 'Kasuga Haidate +3',
        Feet = 'Ryuo Sune-Ate +1', -- jinxed sune-ate path c --
    },
    ['TpMev'] = {
		Sub = 'Utu Grip',
        Ammo = 'Aurgelmir Orb +1',
        Head = 'Kasuga Kabuto +3',
        Neck = 'Moonlight Nodowa',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Kasuga Earring +2',
        Body = 'Kasuga Domaru +3',
        Hands = 'Clemency Kote',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Niqmaddu Ring',
        Back = 'Takaha Mantle', -- STR 1~5 STp 1~3 Zanshin 1~5 Meditate 4~8 --
        Waist = 'Sweordfaetels +1',
        Legs = 'Kasuga Haidate +3',
        Feet = 'Clem. Sune-Ate',
    },
    ['TpRng'] = {
		Sub = 'Utu Grip',
		Range = 'Yoichinoyumi',
        Ammo = 'Yoichi\'s Arrow',
        Head = 'Kasuga Kabuto +3',
        Neck = 'Moonlight Nodowa',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Kasuga Earring +2',
        Body = 'Kasuga Domaru +3',
        Hands = 'Clemency Kote',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Niqmaddu Ring',
        Back = 'Takaha Mantle', -- STR 1~5 STp 1~3 Zanshin 1~5 Meditate 4~8 --
        Waist = 'Sweordfaetels +1',
        Legs = 'Kasuga Haidate +3',
        Feet = 'Clem. Sune-Ate',
    },
    ['Subtle'] = {
		Sub = 'Utu Grip',
        Ammo = 'Aurgelmir Orb +1',
        Head = 'Ken. Jinpachi +1',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Digni. Earring',
        Ear2 = 'Schere Earring',
        Body = 'Dagon Breast.',
        Hands = 'Wakido Kote +4',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Niqmaddu Ring',
        Back = 'Smertrios\'s Mantle',
        Waist = 'Sarissapho. Belt',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Ryuo Sune-Ate +1',
    },
    ['Preshot'] = {
		Range = 'Yoichinoyumi',
        Ammo = 'Yoichi\'s Arrow',
        Head = 'Acro Helm', -- snap shot rapid shot +5 --
        Neck = 'Moonlight Nodowa',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Kasuga Earring +2',
        Body = 'Acro Surcoat', -- ssrs --
        Hands = 'Acro Gauntlets', -- ssrs --
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Crepuscular Ring',
        Back = 'Smertrios\'s Mantle', -- rs +10 --
        Waist = 'Yemaya Belt',
        Legs = 'Acro Breeches', -- ssrs --
        Feet = 'Acro Leggings', -- ssrs --
    },
    ['Midshot'] = {
		Range = 'Yoichinoyumi',
        Ammo = 'Yoichi\'s Arrow',
        Head = 'Ischkur Turban',
        Neck = 'Sam. Nodowa +2',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Dedition Earring',
        Body = 'Volte Harness',
        Hands = 'Volte Mittens',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Crepuscular Ring',
        Back = 'Smertrios\'s Mantle', -- AGI +20 racc30/ratt20, stp +10 --
        Waist = 'Sweordfaetels +1',
        Legs = 'Volte Tights',
        Feet = 'Volte Spats',
    },
    ['Precast'] = {
		Ammo = 'Sapience Orb',
		Head = 'Acro Helm',
		Neck = 'Voltsurge Torque',
		Ear1 = 'Loquac. Earring',
		Ear2 = 'Etiolation Earring',
		Body = 'Sacro Breastplate',
		Hands = 'Leyline Gloves',
        Ring1 = 'Prolix Ring',
		Ring2 = 'Rahab Ring',
		Back = 'Smertrios\'s Mantle', -- +10 --
		Legs = 'Arjuna Breeches',
		Feet = 'Acro leggings',
    },
    ['Midcast'] = {
    },
    ['DefaultWeaponskill'] = {
        Ammo = 'Knobkierrie',
        Head = 'Mpaca\'s Cap',
        Neck = 'Sam. Nodowa +2',
        Ear1 = 'Thrud Earring',
        Ear2 = 'Kasuga Earring +2',
        Body = 'Nyame Mail',
        Hands = 'Kasuga Kote +3',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Smertrios\'s Mantle', -- STR30 acc/att 20 wsd 10 --
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    ['Shoha'] = {
        Ammo = 'Knobkierrie',
        Head = 'Mpaca\'s Cap',
        Neck = 'Sam. Nodowa +2',
        Ear1 = 'Thrud Earring',
        Ear2 = 'Kasuga Earring +2',
        Body = 'Nyame Mail',
        Hands = 'Kasuga Kote +3',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Smertrios\'s Mantle', -- STR30 acc/att 20 wsd 10 --
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    ['MFKGY'] = {
        Ammo = 'Knobkierrie',
        Head = 'Mpaca\'s Cap',
        Neck = 'Sam. Nodowa +2',
        Ear1 = 'Thrud Earring',
        Ear2 = 'Kasuga Earring +2',
        Body = 'Sakonji Do. +4',
        Hands = 'Kasuga Kote +3',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Smertrios\'s Mantle', -- STR30 acc/att 20 wsd 10 --
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    ['Jinpu'] = {
        Ammo = 'Knobkierrie',
        Head = 'Nyame Helm',
        Neck = 'Sam. Nodowa +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Friomisi Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Smertrios\'s Mantle', -- STR30 acc/att 20 wsd 10 --
        Waist = 'Orpheus\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    ['th'] = {
        Ammo = 'Per. Lucky Egg',
        Head = 'Wh. Rarab Cap +1',
        Waist = 'Chaac Belt',
    },
    ['Impulse'] = {
		Main = 'Shining One',
        Ammo = 'Knobkierrie',
        Head = 'Mpaca\'s Cap',
        Neck = 'Sam. Nodowa +2',
        Ear1 = 'Thrud Earring',
        Ear2 = 'Kasuga Earring +2',
        Body = 'Nyame Mail',
        Hands = 'Kasuga Kote +3',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Smertrios\'s Mantle', -- STR30 acc/att 20 wsd 10 --
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    ['Ageha'] = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Wakido Kabuto +4',
        Neck = 'Null Loop',
        Ear1 = 'Digni. Earring',
        Ear2 = 'Kasuga Earring +2',
        Body = 'Wakido Domaru +4',
        Hands = 'Wakido Kote +4',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Null Shawl',
        Waist = 'Null Belt',
        Legs = 'Wakido Haidate +4',
        Feet = 'Wakido Sune. +4',
    },
    ['Stardiver'] = {
		Main = 'Shining One',
        Ammo = 'Knobkierrie',
        Head = 'Agoge Mask +4',
        Neck = 'Fotia Gorget',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Schere Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Mpaca\'s Gloves',
        Ring1 = 'Niqmaddu Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Smertrios\'s Mantle', -- STR30 acc/att 20 wsd 10 --
        Waist = 'Fotia Belt',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Valorous Greaves', -- acc/att 17 crit hit damage +4 str +13 acc 12 att 4 --
    },
    ['Namas'] = {
		Range = 'Yoichinoyumi',
        Ammo = 'Yoichi\'s Arrow',
        Head = 'Nyame Helm',
        Neck = 'Sam. Nodowa +2',
        Ear1 = 'Thrud Earring',
        Ear2 = 'Kasuga Earring +2',
        Body = 'Nyame Mail',
        Hands = 'Kasuga Kote +3',
        Ring1 = 'Beithir Ring', -- aug Information on Raskovniche --
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Smertrios\'s Mantle', -- str 30 racc\ratt 20 wsd 10 --
        Waist = 'Fotia Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    ['provoke'] = {
		Ammo = 'Sapience Orb',
		Head = 'Loess Barbuta', -- Lustreless Wing 12 stacks 3 single --
		Body = 'Emet Harness +1',
		Hands = 'Acro Gauntlets', -- +10 --
		Legs = 'Acro Breeches', -- +10 --
		Feet = 'Acro Leggings', -- +10 --
		Neck = 'Unmoving Collar +1',
		Waist = 'Kasiri Belt',
		Ear1 = 'Cryptic Earring',
		Ear2 = 'Trux Earring',
		Ring1 = 'Eihwaz Ring',
		Ring2 = 'Supershear Ring',
		Back = 'Smertrios\'s Mantle', -- +10 --
    },
    ['Meikyo'] = {
        Feet = 'Sakonji Sune. +4', -- worn while buff active --
    },
    ['Hasso'] = {
        Legs = 'Kasuga Haidate +3',
		Feet = 'Wakido Sune. +4',
    },
    ['Warding'] = {
        Head = 'Wakido Kabuto +4',
    },
    ['Third'] = {
        Legs = 'Sakonji Haidate +4',
    },
    ['Meditate'] = {
		Head = 'Wakido Kabuto +4',
        Hands = 'Sakonji Kote +4',
		Back = 'Smertrios\'s Mantle',
    },
    ['Seigan'] = {
        Head = 'Kasuga Kabuto +3',
    },
    ['Shikikoyo'] = {
        Legs = 'Sakonji Haidate +4',
    },
    ['BladeBash'] = {
        Hands = 'Sakonji Kote +4',
    },
    ['Sengikori'] = {
        Feet = 'Kas. Sune-Ate +3',
    },
    ['Sekkanoki'] = {
        Hands = 'Kasuga Kote +3',
    },
};
profile.Sets = sets;

profile.Packer = {
    {Name = 'Panacea', Quantity = 'all'},
    {Name = 'Holy Water', Quantity = 'all'},
    {Name = 'Prism Powder', Quantity = 'all'},
    {Name = 'Silent Oil', Quantity = 'all'},
    {Name = 'Sublime Sushi', Quantity = 'all'},
    {Name = 'Befouled Water', Quantity = 'all'},
    {Name = 'Silver Voucher', Quantity = 'all'},
    {Name = 'Copper Voucher', Quantity = 'all'},
    {Name = 'Warp Ring', Quantity = 'all'},
    {Name = 'Dim. Ring (Dem)', Quantity = 'all'},
    {Name = 'Echo Drops', Quantity = 'all'},
    {Name = 'Norifusa +1', Quantity = 'all'},
    {Name = 'Shining One', Quantity = 'all'},
    {Name = 'Dojikiri Yasutsuna', Quantity = 'all'},
    {Name = 'Himesama R. Ball', Quantity = 'all'},
    {Name = 'Ojo Rice Ball', Quantity = 'all'},
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/bind F5 /lac fwd cycletp');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 007');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 004');
	gFunc.Message('TP Mode: ' .. TpModes[CurrentTpMode])
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/unbind F5')
end

profile.HandleCommand = function(args)
    if (args[1] == 'cycletp') then

        CurrentTpMode = CurrentTpMode + 1

        if (CurrentTpMode > #TpModes) then
            CurrentTpMode = 1
        end

        gFunc.Message('TP Mode: ' .. TpModes[CurrentTpMode])
        return
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer()

    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets[TpModes[CurrentTpMode]])

    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting)

    else
        gFunc.EquipSet(sets.Idle)
    end

    -- Buff overlays
    if (gData.GetBuffCount('Meikyo Shisui') > 0) then
        gFunc.EquipSet(sets.Meikyo)
    end
end

profile.HandleAbility = function()
	local action = gData.GetAction();
        if (action.Name == 'Provoke') then gFunc.EquipSet(sets.provoke); 
		elseif (action.Name == 'Hasso') then gFunc.EquipSet(sets.Hasso);
		elseif (action.Name == 'Warding') then gFunc.EquipSet(sets.Warding);
		elseif (action.Name == 'Third') then gFunc.EquipSet(sets.Third);
		elseif (action.Name == 'Meditate') then gFunc.EquipSet(sets.Meditate);
		elseif (action.Name == 'Seigan') then gFunc.EquipSet(sets.Seigan);
		elseif (action.Name == 'Shikikoyo') then gFunc.EquipSet(sets.Shikikoyo);
		elseif (action.Name == 'Blade Bash') then gFunc.EquipSet(sets.BladeBash);
		elseif (action.Name == 'Sengikori') then gFunc.EquipSet(sets.Sengikori);
		elseif (action.Name == 'Sekkanoki') then gFunc.EquipSet(sets.Sekkanoki);
	end;
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.Precast);
end

profile.HandleMidcast = function()

end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if (action.Name == 'Tachi: Shoha') then
        gFunc.EquipSet(sets.Shoha);
    elseif (action.Name == 'Tachi: Mumei') then
        gFunc.EquipSet(sets.MFKGY);
    elseif (action.Name == 'Tachi: Fudo') then
        gFunc.EquipSet(sets.MFKGY);
    elseif (action.Name == 'Tachi: Kasha') then
        gFunc.EquipSet(sets.MFKGY);
    elseif (action.Name == 'Tachi: Gekko') then
        gFunc.EquipSet(sets.MFKGY);
    elseif (action.Name == 'Tachi: Yukikaze') then
        gFunc.EquipSet(sets.MFKGY);
    elseif (action.Name == 'Tachi: Jinpu') then
        gFunc.EquipSet(sets.Jinpu);
    elseif (action.Name == 'Tachi: Ageha') then
        gFunc.EquipSet(sets.Ageha);
    elseif (action.Name == 'Impulse Drive') then
        gFunc.EquipSet(sets.Impulse);
    elseif (action.Name == 'Stardiver') then
        gFunc.EquipSet(sets.Stardiver);
    elseif (action.Name == 'Tachi: Hobaku') then
        gFunc.EquipSet(sets.th);
    elseif (action.Name == 'Namas Arrow') then
        gFunc.EquipSet(sets.Namas);
    else
        gFunc.EquipSet(sets.DefaultWeaponskill);
    end
end

return profile;

-- 2r set needs buffactive --
-- tp sets include tpacc, tpdt, tpmev, tprng, subtle --