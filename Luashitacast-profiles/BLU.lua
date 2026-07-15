local profile = {};

local BluSkill = T{
    'Cruel Joke',
}

local BluPhys = T{
    'Foot Kick',
    'Sprout Smack',
    'Wild Oats',
    'Power Attack',
    'Queasyshroom',
	'Battle Dance',
	'Feather Storm',
	'Head Butt',
	'Helldive',
	'Bludgeon',
	'Claw Cyclone',
	'Screwdriver',
	'Grand Slam',
	'Smite of Rage',
	'Pinecone Bomb',
	'Jet Stream',
	'Uppercut',
	'Terror Touch',
	'Mandibular Bite',
	'Sickle Slash',
	'Dimensional Death',
	'Spiral Spin',
	'Death Scissors',
	'Seedspray',
	'Body Slam',
	'Frypan',
	'Frenetic Rip',
	'Spinal Cleave',
	'Tail Slap',
	'Hysteric Barrage',
	'Asuran Claws',
	'Cannonball',
	'Disseverment',
	'Sub-zero Smash',
	'Ram Charge',
	'Vertical Cleave',
	'Final Sting',
	'Goblin Rush',
	'Vanity Dive',
	'Whirl of Rage',
	'Benthic Typhoon',
	'Quad. Continuum',
	'Empty Thrash',
	'Delta Thrust',
	'Heavy Strike',
	'Sudden Lunge',
	'Quadrastrike',
	'Tourbillion',
	'Amorphic Spikes',
	'Barbed Crescent',
	'Bilgestorm',
	'Bloodrake',
	'Glutinous Dart',
	'Paralyzing Triad',
	'Thrashing Assault',
	'Sinker Drill',
	'Sweeping Gouge',
	'Saurian Slide',	
}

local sets = {
    Idle = {
        Ammo = 'Staunch Tathlum +1', --  3
        Head = 'Nyame Helm',         --  7
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Nyame Mail',         --  9
        Hands = 'Nyame Gauntlets',   --  7
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Murky Ring',        -- 10
		Back = 'Rosmerta\'s Cape',
        Waist = 'Carrier\'s Sash',
        Legs = 'Nyame Flanchard',    --  8
        Feet = 'Nyame Sollerets',    --  7
    },
    Resting = {
        Ammo = 'Homiliary',
        Head = 'Nyame Helm',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Hashishin Mintan +3',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Chirich Ring +1',
		Back = 'Rosmerta\'s Cape',
        Waist = 'Fucho-No-Obi',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Tp = {
        Ammo = 'Coiste Bodhar',
        Head = 'Nyame Helm',
        Neck = 'Mirage Stole +2',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hashi. Earring +1',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Epona\'s Ring',
        Ring2 = 'Chirich Ring +1',
        Back = 'Rosmerta\'s Cape',
        Waist = 'Reiki Yotai',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Precast = {
        Ammo = 'Sapience Orb',        --  2 --
        Head = 'Carmine Mask +1',     -- 14 Path D --
        Neck = 'Voltsurge Torque',    --  4 --
        Ear1 = 'Malignance Earring',  --  4 --
        Ear2 = 'Etiolation Earring',  --  1 --
        Body = 'Luhlaza Jubbah +3',   --  9 --
		Hands = 'Leyline Gloves',     --  5 -- 
        Ring1 = 'Prolix Ring',        --  2 --
        Ring2 = 'Kishar Ring',        --  4 --
		Waist = 'Witful Belt',        --  3 --
        Back = 'Rosmerta\'s Cape',    -- 10 --
        Legs = 'Aya. Cosciales +2',   --  6 --
        Feet = 'Carmine Greaves +1',  --  8  70 total need +10 from spells erratic flutter?--
    },
    BluPrecast = {
        Ammo = 'Sapience Orb',        --  2 --
        Head = 'Carmine Mask +1',     -- 14 Path D --
        Neck = 'Voltsurge Torque',    --  4 --
        Ear1 = 'Malignance Earring',  --  4 --
        Ear2 = 'Etiolation Earring',  --  1 --	
        Body = 'Hashishin Mintan',    -- 16 --
        Hands = 'Hashi. Bazu. +3',    -- 16 --
        Ring1 = 'Prolix Ring',        --  2 --
        Ring2 = 'Kishar Ring',        --  4 --
        Waist = 'Witful Belt',        --  3 --
        Back = 'Rosmerta\'s Cape',    -- 10 --
        Legs = 'Aya. Cosciales +2',   --  6 --
        Feet = 'Carmine Greaves +1',  --  8  80 + --
    },
    BluSkill = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Hashishin Kavuk +3',
        Neck = 'Mirage Stole +2',
        Ear1 = 'Njordr Earring',
        Ear2 = 'Hashi. Earring +1',
        Body = 'Hashishin Mintan +3',
        Hands = 'Hashi. Bazu. +3',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Cornflower Cape', -- skill 1-10 refractive crystal Detrovio Inventors --
        Waist = 'Acuity Belt +1',
        Legs = 'Hashishin Tayt +3',
        Feet = 'Hashi. Basmak +3',
    },
    BluMag = {
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Hashishin Kavuk +3',
        Neck = 'Mirage Stole +2',
        Ear1 = 'Friomisi Earring',
        Ear2 = 'Hashi. Earring +1',
        Body = 'Hashishin Mintan +3',
        Hands = 'Hashi. Bazu. +3',
        Ring1 = 'Freke Ring',
        Ring2 = 'Stikini Ring +1',
        Back = 'Rosmerta\'s Cape',
        Waist = 'Orpheus\'s Sash',
        Legs = 'Hashishin Tayt +3',
        Feet = 'Hashi. Basmak +3',
    },
    BluPhys = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Hashishin Kavuk +3',
        Neck = 'Mirage Stole +2',
        Ear1 = 'Njordr Earring',
        Ear2 = 'Hashi. Earring +1',
        Body = 'Hashishin Mintan +3',
        Hands = 'Hashi. Bazu. +3',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Cornflower Cape', -- skill 1-10 refractive crystal Detrovio Inventors --
        Waist = 'Acuity Belt +1',
        Legs = 'Hashishin Tayt +3',
        Feet = 'Hashi. Basmak +3',
    },
    Expiacion = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Hashishin Kavuk +3',
        Neck = 'Mirage Stole +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Rosmerta\'s Cape', -- STR WSD --
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Savage = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Hashishin Kavuk +3',
        Neck = 'Mirage Stole +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hoxne Earring',
		Body = 'Gleti\'s Cuirass',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Rosmerta\'s Cape', -- STR WSD --
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Requiescat = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Null Masque',
        Neck = 'Fotia Gorget',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Rosmerta\'s Cape', -- MND DA --
        Waist = 'Fotia Belt',
        Legs = 'Gleti\'s Breecehes',
        Feet = 'Nyame Sollerets',
    },
	DefaultWeaponskill = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Hashishin Kavuk +3',
        Neck = 'Mirage Stole +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Rosmerta\'s Cape', -- STR WSD --
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
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
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 012');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 012');
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

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local action = gData.GetAction();
    if (action.Skill == 'Blue Magic') then
        gFunc.EquipSet(sets.BluPrecast);
    elseif (action.Skill ~= nil) then
        gFunc.EquipSet(sets.Precast);
    end
end

profile.HandleMidcast = function()
    local action = gData.GetAction()
    if (action.Skill ~= 'Blue Magic') then
        return
    end
    if (BluSkill:contains(action.Name)) then
        gFunc.EquipSet(sets.BluSkill)
    elseif (BluPhys:contains(action.Name)) then
        gFunc.EquipSet(sets.BluPhys)
    else
        gFunc.EquipSet(sets.BluMag)
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if (action.Name == 'Expiacion') then
        gFunc.EquipSet(sets.Expiacion);
    elseif (action.Name == 'Savage Blade') then
        gFunc.EquipSet(sets.Savage);
    elseif (action.Name == 'Requiescat') then
        gFunc.EquipSet(sets.Requiescat);
    else
        gFunc.EquipSet(sets.DefaultWeaponskill);
    end
end

return profile;