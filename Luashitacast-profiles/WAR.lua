local profile = {};
local sets = {
    ['idle'] = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Sakpata\'s Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Sakpata\'s Plate',
        Hands = 'Sakpata\'s Gauntlets',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Cichol\'s Mantle', Augment = { [1] = 'DEX+20' } },
        Waist = 'Engraved Belt',
        Legs = 'Sakpata\'s Cuisses',
        Feet = 'Sakpata\'s Leggings',
    },
    ['resting'] = { --regen gear--
        Ammo = 'Staunch Tathlum +1',
        Head = 'Sakpata\'s Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Sakpata\'s Plate',
        Hands = 'Sakpata\'s Gauntlets',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Chirich Ring +1',
        Back = { Name = 'Cichol\'s Mantle', Augment = { [1] = 'DEX+20' } },
        Waist = 'Engraved Belt',
        Legs = 'Sakpata\'s Cuisses',
        Feet = 'Sakpata\'s Leggings',
    },
    ['tp'] = {
        Ammo = 'Coiste Bodhar',
        Head = 'Sakpata\'s Helm',
        Neck = 'Vim Torque +1',
        Ear1 = 'Schere Earring',
        Ear2 = 'Boii Earring +1',
        Body = 'Sakpata\'s Plate',
        Hands = 'Sakpata\'s Gauntlets',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Niqmaddu Ring',
        Back = { Name = 'Cichol\'s Mantle', Augment = { [1] = 'DEX+20' } },
        Waist = 'Ioskeha Belt +1',
        Legs = 'Pumm. Cuisses +4',
        Feet = 'Pumm. Calligae +4',
    },
    ['precast'] = {
		Ammo = 'Sapience Orb',
		Head = 'Sakpata\'s Helm',
		Neck = 'Voltsurge Torque',
		Ear1 = 'Loquac. Earring',
		Ear2 = 'Enchntr. Earring +1',
		Body = 'Odyss. Chestplate', --Fern +6--
		Hands = 'Leyline Gloves',
        Ring1 = 'Prolix Ring',
		Ring2 = 'Rahab Ring',
		Legs = 'Odyssean Cuisses', --Fern +6--
        Feet = 'Odyssean Greaves', --Fern +6--
    },
    ['midcast'] = {
        Neck = 'Magoraga Beads',
    },
    ['preshot'] = {

    },
    ['midshot'] = {

    },
    ['DefaultWeaponskill'] = {
        Ammo = 'Knobkierrie',
        Head = 'Agoge Mask +4',
        Neck = 'War. Beads +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Thrud Earring',
        Body = 'Pumm. Lorica +4',
        Hands = 'Boii Mufflers +3',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Cichol\'s Mantle', Augment = { [1] = 'STR+30' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Boii Cuisses +3',
        Feet = 'Sakpata\'s Leggings',
    },
    ['upheaval'] = {
        Ammo = 'Knobkierrie',
        Head = 'Agoge Mask +4',
        Neck = 'War. Beads +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Thrud Earring',
        Body = 'Pumm. Lorica +4',
        Hands = 'Boii Mufflers +3',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Cichol\'s Mantle', Augment = { [1] = 'VIT+30' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Boii Cuisses +3',
        Feet = 'Sakpata\'s Leggings',
    },
    ['ukko'] = {
        Ammo = 'Knobkierrie',
        Head = 'Agoge Mask +4',
        Neck = 'War. Beads +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Thrud Earring',
        Body = 'Pumm. Lorica +4',
        Hands = 'Boii Mufflers +3',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Cichol\'s Mantle', Augment = { [1] = 'STR+30' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Boii Cuisses +3',
        Feet = 'Sakpata\'s Leggings',
    },
    ['disaster'] = {
        Ammo = 'Knobkierrie',
        Head = 'Agoge Mask +4',
        Neck = 'War. Beads +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Thrud Earring',
        Body = 'Pumm. Lorica +4',
        Hands = 'Boii Mufflers +3',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Cichol\'s Mantle', Augment = { [1] = 'STR+30' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Boii Cuisses +3',
        Feet = 'Sakpata\'s Leggings',
    },
    ['th'] = {
        Ammo = 'Per. Lucky Egg',
        Head = 'Wh. Rarab Cap +1',
        Neck = 'War. Beads +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Thrud Earring',
        Body = 'Pumm. Lorica +4',
        Hands = 'Boii Mufflers +3',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Cichol\'s Mantle', Augment = { [1] = 'DEX+20' } },
        Waist = 'Chaac Belt',
        Legs = 'Boii Cuisses +3',
        Feet = 'Sakpata\'s Leggings',
    },
    ['impulse'] = {
        Ammo = 'Knobkierrie',
        Head = 'Agoge Mask +4',
        Neck = 'War. Beads +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Thrud Earring',
        Body = 'Pumm. Lorica +4',
        Hands = 'Boii Mufflers +3',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Cichol\'s Mantle', Augment = { [1] = 'STR+30' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Boii Cuisses +3',
        Feet = 'Sakpata\'s Leggings',
    },
    ['savage'] = {
        Ammo = 'Knobkierrie',
        Head = 'Agoge Mask +4',
        Neck = 'War. Beads +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Thrud Earring',
        Body = 'Pumm. Lorica +4',
        Hands = 'Boii Mufflers +3',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Cichol\'s Mantle', Augment = { [1] = 'STR+30' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Boii Cuisses +3',
        Feet = 'Sakpata\'s Leggings',
    },
    ['asf'] = {
        Ammo = 'Knobkierrie',
        Head = 'Agoge Mask +4',
        Neck = 'War. Beads +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Thrud Earring',
        Body = 'Pumm. Lorica +4',
        Hands = 'Boii Mufflers +3',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Cichol\'s Mantle', Augment = { [1] = 'STR+30' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Boii Cuisses +3',
        Feet = 'Sakpata\'s Leggings',
    },
    ['provoke'] = {
		Ammo = 'Sapience Orb',
		Head = 'Pumm. Mask +1',
		Body = 'Souv. Cuirass +1', --path c--
		Hands = 'Pumm. Mufflers +1', 
		Legs = 'Souv. Diechlings +1', --path c--
		Feet = 'Souveran Schuhs +1', --path c--
		Neck = 'Moonlight Necklace',
		Waist = 'Trance Belt',
		Ear1 = 'Cryptic Earring',
		Ear2 = 'Trux Earring',
		Ring1 = 'Apeile Ring',
		Ring2 = 'Provocare Ring',
    },
    ['berserk'] = {
        Body = 'Pumm. Lorica +4',
        Feet = 'Agoge Calligae +1',
    },
    ['warcry'] = {
        Head = 'Agoge Mask +4',
    },
    ['defender'] = {
        Hands = 'Agoge Mufflers +3',
    },
    ['tomahawk'] = {
        Ammo = 'Thr. Tomahawk',
		Feet = 'Agoge Calligae +1',
    },
    ['bloodrage'] = {
        Body = 'Boii Lorica',
    },
    ['aggressor'] = {
        Head = 'Pumm. Mask +1',
        Body = 'Agoge Lorica +3',
    },
    ['mighty'] = {
        Body = 'Agoge Mufflers +3',
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
    {Name = 'Thr. Tomahawk', Quantity = 'all'},
    {Name = 'Naegling', Quantity = 'all'},
    {Name = 'Chango', Quantity = 'all'},
    {Name = 'Shining One', Quantity = 'all'},
    {Name = 'Laphria', Quantity = 'all'},
	{Name = 'Karambit', Quantity = 'all'},
	{Name = 'Utu Grip', Quantity = 'all'},
	{Name = 'Blurred Shield +1', Quantity = 'all'},
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
        gFunc.EquipSet(sets.tp);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.resting);
    else
        gFunc.EquipSet(sets.idle);
    end
end

profile.HandleAbility = function()
	local action = gData.GetAction();
        if (action.Name == 'Provoke') then gFunc.EquipSet(sets.provoke); 
		elseif (action.Name == 'Berserk') then gFunc.EquipSet(sets.berserk);
		elseif (action.Name == 'Warcry') then gFunc.EquipSet(sets.warcry);
		elseif (action.Name == 'Defender') then gFunc.EquipSet(sets.defender);
		elseif (action.Name == 'Tomahawk') then gFunc.EquipSet(sets.tomahawk);
		elseif (action.Name == 'Bloodrage') then gFunc.EquipSet(sets.bloodrage);
		elseif (action.Name == 'Aggressor') then gFunc.EquipSet(sets.aggressor);
		elseif (action.Name == 'Mighty Strikes') then gFunc.EquipSet(sets.mighty);
	end;
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.precast);
end

profile.HandleMidcast = function()
    gFunc.EquipSet(sets.midcast);
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if (action.Name == 'Upheaval') then
        gFunc.EquipSet(sets.upheaval);
    elseif (action.Name == 'Ukko\'s Fury') then
        gFunc.EquipSet(sets.ukko);
    elseif (action.Name == 'Disaster') then
        gFunc.EquipSet(sets.disaster);
    elseif (action.Name == 'Fell Cleave') then
        gFunc.EquipSet(sets.th);
    elseif (action.Name == 'Impulse Drive') then
        gFunc.EquipSet(sets.impulse);
    elseif (action.Name == 'Savage Blade') then
        gFunc.EquipSet(sets.savage);
    elseif (action.Name == 'Asuran Fists') then
        gFunc.EquipSet(sets.asf);
    else
        gFunc.EquipSet(sets.DefaultWeaponskill);
    end
end

return profile;