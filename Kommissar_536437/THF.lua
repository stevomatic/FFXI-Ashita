local profile = {};
local sets = {
    ['Idle'] = {
        Ammo = 'Staunch Tathlum +1',
        Head = { Name = 'Nyame Helm', AugPath='B' },
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = { Name = 'Nyame Mail', AugPath='B' },
        Hands = { Name = 'Nyame Gauntlets', AugPath='B' },
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+20', [3] = 'Weapon skill damage +10%', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = 'Engraved Belt',
        Legs = { Name = 'Nyame Flanchard', AugPath='B' },
        Feet = { Name = 'Nyame Sollerets', AugPath='B' },
    },
    ['Resting'] = {
        Ammo = 'Staunch Tathlum +1',
        Head = { Name = 'Nyame Helm', AugPath='B' },
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = { Name = 'Nyame Mail', AugPath='B' },
        Hands = { Name = 'Nyame Gauntlets', AugPath='B' },
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Defending Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+20', [3] = 'Weapon skill damage +10%', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = 'Engraved Belt',
        Legs = { Name = 'Nyame Flanchard', AugPath='B' },
        Feet = { Name = 'Nyame Sollerets', AugPath='B' },
    },
    ['Tp'] = {
        Ammo = { Name = 'Seeth. Bomblet +1', AugPath='A' },
        Head = 'Skulker\'s Bonnet +3',
        Neck = { Name = 'Asn. Gorget +2', AugPath='A' },
        Ear1 = 'Sherida Earring',
        Ear2 = 'Skulk. Earring +1',
        Body = { Name = 'Nyame Mail', AugPath='B' },
        Hands = 'Plun. Armlets +3',
        Ring1 = 'Ilabrat Ring',
        Ring2 = 'Moonlight Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Attack+20', [2] = 'Accuracy+20', [3] = 'Mag. Evasion+15', [4] = '"Store TP"+10', [5] = 'DEX+30' } },
        Waist = 'Reiki Yotai',
        Legs = { Name = 'Nyame Flanchard', AugPath='B' },
        Feet = 'Skulk. Poulaines +3',
    },
    ['Evisceration'] = {
        Main = 'Twashtar',
        Sub = 'Tauret',
        Ammo = 'Crepuscular Pebble',
        Head = 'Skulker\'s Bonnet +3',
        Neck = 'Fotia Gorget',
        Ear1 = 'Odr Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Skulker\'s Vest +3',
        Hands = 'Gleti\'s Gauntlets',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+20', [3] = 'Weapon skill damage +10%', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = { Name = 'Kentarch Belt +1', AugPath='A' },
        Legs = 'Plun. Culottes +4',
        Feet = 'Nyame Sollerets',
    },
    ['Savage Blade'] = {
        Main = 'Naegling',
        Ammo = 'Oshasha\'s Treatise',
        Head = { Name = 'Nyame Helm', AugPath='B' },
        Neck = 'Rep. Plat. Medal',
        Ear1 = 'Ishvara Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Skulker\'s Vest +3',
        Hands = { Name = 'Nyame Gauntlets', AugPath='B' },
        Ring1 = 'Gere Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+20', [3] = 'Weapon skill damage +10%', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = { Name = 'Nyame Flanchard', AugPath='B' },
        Feet = { Name = 'Nyame Sollerets', AugPath='B' },  
    },
    ['Rudra'] = {
        Main = 'Twashtar',
        Sub =  'Tauret',
        Ammo = 'Crepuscular Pebble',
        Head = 'Skulker\'s Bonnet +3',
        Neck = 'Asn. Gorget +2',
        Ear1 = 'Odr Earring',
        Ear2 = 'Moonshade Earring',
        Body = 'Skulker\'s Vest +3',
        Hands = 'Gleti\'s Gauntlets',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+20', [3] = 'Weapon skill damage +10%', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = { Name = 'Kentarch Belt +1', AugPath='A' },
        Legs = 'Plun. Culottes +4',
        Feet = 'Nyame Sollerets',
    },
    ['Exenterator'] = {
        Ammo = { Name = 'Seeth. Bomblet +1', AugPath='A' },
        Head = { Name = 'Nyame Helm', AugPath='B' },
        Neck = { Name = 'Asn. Gorget +2', AugPath='A' },
        Ear1 = 'Odr Earring',
        Ear2 = 'Sherida Earring',
        Body = { Name = 'Nyame Mail', AugPath='B' },
        Hands = { Name = 'Nyame Gauntlets', AugPath='B' },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Ilabrat Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+20', [3] = 'Weapon skill damage +10%', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = { Name = 'Nyame Flanchard', AugPath='B' },
        Feet = 'Skulk. Poulaines +3',
    },
    ['Shark'] = {
        Ammo = { Name = 'Seeth. Bomblet +1', AugPath='A' },
        Head = { Name = 'Nyame Helm', AugPath='B' },
        Neck = { Name = 'Asn. Gorget +2', AugPath='A' },
        Ear1 = 'Odr Earring',
        Ear2 = 'Sherida Earring',
        Body = { Name = 'Nyame Mail', AugPath='B' },
        Hands = { Name = 'Nyame Gauntlets', AugPath='B' },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Ilabrat Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+20', [3] = 'Weapon skill damage +10%', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = { Name = 'Nyame Flanchard', AugPath='B' },
        Feet = 'Skulk. Poulaines +3',
    },
    ['Ruthless'] = {
        Ammo = { Name = 'Seeth. Bomblet +1', AugPath='A' },
        Head = { Name = 'Nyame Helm', AugPath='B' },
        Neck = { Name = 'Asn. Gorget +2', AugPath='A' },
        Ear1 = 'Odr Earring',
        Ear2 = 'Sherida Earring',
        Body = { Name = 'Nyame Mail', AugPath='B' },
        Hands = { Name = 'Nyame Gauntlets', AugPath='B' },
        Ring1 = 'Rajas Ring',
        Ring2 = 'Ilabrat Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+20', [3] = 'Weapon skill damage +10%', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
        Legs = { Name = 'Nyame Flanchard', AugPath='B' },
        Feet = 'Skulk. Poulaines +3',
    },
    ['Aeolian'] = {
        Ammo = { Name = 'Ghastly Tathlum +1', AugPath='A' },
        Head = { Name = 'Nyame Helm', AugPath='B' },
        Neck = 'Sibyl Scarf',
        Ear1 = 'Friomisi Earring',
        Ear2 = 'Moonshade Earring',
        Body = { Name = 'Nyame Mail', AugPath='B' },
        Hands = { Name = 'Nyame Gauntlets', AugPath='B' },
        Ring1 = 'Dingir Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+20', [3] = 'Weapon skill damage +10%', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = 'Orpheus\'s Sash',
        Legs = { Name = 'Nyame Flanchard', AugPath='B' },
        Feet = { Name = 'Nyame Sollerets', AugPath="B" },
    },
    ['Asuran'] = {
		Main = 'Karambit',
        Ammo = { Name = 'Ghastly Tathlum +1', AugPath='A' },
        Head = { Name = 'Nyame Helm', AugPath='B' },
        Neck = 'Sibyl Scarf',
        Ear1 = 'Friomisi Earring',
        Ear2 = 'Moonshade Earring',
        Body = { Name = 'Nyame Mail', AugPath='B' },
        Hands = { Name = 'Nyame Gauntlets', AugPath='B' },
        Ring1 = 'Dingir Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+20', [3] = 'Weapon skill damage +10%', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = 'Orpheus\'s Sash',
        Legs = { Name = 'Nyame Flanchard', AugPath='B' },
        Feet = { Name = 'Nyame Sollerets', AugPath="B" },
    },
    Flee = {
        Feet = 'Pill. Poulaines +2',
    },
    Movement = {
        Feet = 'Pill. Poulaines +2',
	},
    ['FastCast'] = {
        Ammo = 'Sapience Orb',
        Head = 'Herculean Helm',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Enchntr. Earring +1',
        Body = 'Adhemar Jacket +1',
        Hands = 'Leyline Gloves',
        Ring1 = 'Rahab Ring',
        Ring2 = 'Prolix Ring',
        Waist = 'Engraved Belt',
        Legs = 'Herculean Trousers',
        Feet = 'Herculean Boots',
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
    { Name = 'Smith\'s Ring', Quantity = 'all' },
    { Name = 'Craftkeeper\'s Ring', Quantity = 'all' },
    { Name = 'Craftmaster\'s Ring', Quantity = 'all' },
    { Name = 'Venus Orb', Quantity = 'all' },
    { Name = 'Sm. Escutcheon', Quantity = 'all' },
    { Name = 'Blksmith. Smock', Quantity = 'all' },
    { Name = 'Confectioner\'s Ring', Quantity = 'all' },
    { Name = 'Artificer\'s Ring', Quantity = 'all' },
    { Name = 'Instant Reraise', Quantity = 'all' },
    { Name = 'Coconut Rusk', Quantity = 'all' },
    { Name = 'Smithy\'s Mitts', Quantity = 'all' },
    { Name = 'Mars Orb', Quantity = 'all' },
    { Name = 'Smithy\'s Torque', Quantity = 'all' },
    { Name = 'Miso Ramen', Quantity = 'all' },
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 011');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 011');
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
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    else
        gFunc.EquipSet(sets.Idle);
    end
end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.FastCast);
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if (action.Name == 'Savage Blade') then
        gFunc.EquipSet(sets.SavageBlade);
    elseif (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.Evisceration);
    elseif (action.Name == 'Rudra\'s Storm') then
        gFunc.EquipSet(sets.Rudra);
    elseif (action.Name == 'Exenterator') then
        gFunc.EquipSet(sets.Exenterator);
    elseif (action.Name == 'Shark Bite') then
        gFunc.EquipSet(sets.Shark);
    elseif (action.Name == 'Ruthless Stroke') then
        gFunc.EquipSet(sets.Ruthless);
    elseif (action.Name == 'Aeolian Edge') then
        gFunc.EquipSet(sets.Aeolian);
    elseif (action.Name == 'Asuran Fists') then
        gFunc.EquipSet(sets.Asuran);
    else
        gFunc.EquipSet(sets.DefaultWeaponskill);
    end
end

return profile;