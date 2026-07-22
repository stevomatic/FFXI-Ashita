local profile = {};
local WeaponModes = {
    'Annihilator',
	'Armageddon',
	'Earp',
	'FailNot',
	'Fomalhaut',
	'Gandiva',
    'Gastraphetes',
    'Naegling',
	'Pinaka',
	'Yoichinoyumi',
}
local CurrentWeaponMode = 1
local sets = {
    Idle = {
		Head = 'Nyame Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Murky Ring',
        Ring2 = 'Defending Ring',
        Back = 'Belenus\'s Cape',
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
        Back = 'Belenus\'s Cape',
        Waist = 'Carrier\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
	},
	Precast = {
		Head = 'Carmine Mask +1', 
		Neck = 'Voltsurge Torque',
		Back = 'Belenus\'s Cape', -- +10 --
		Body = 'Dread Jupon', -- 7 --
		Hands = 'Leyline Gloves',
		Feet = 'Carmine Greaves +1', -- +8 --
		Ear1 = 'Loquac. Earring',
		Ear2 = 'Enchntr. Earring +1',
		Ring1 = 'Weather. Ring',
		Ring2 = 'Prolix Ring',
		Legs = 'Herculean Trousers', -- Fern +6 --
	},
	Midcast = {
	},
	Preshot = {
		Head = 'Taeon Chapeau', -- Snapshot 10 -- 
		Neck = 'Scout\'s Gorget +2',
		Body = 'Amini Caban +3',
		Hands = 'Carmine Fin. Ga. +1',
		Ring1 = 'Crepuscular Ring',
        Back = { Name = 'Belenus\'s Cape', Augment = '"Snapshot"+10' },
		Waist = 'Yemaya Belt',
		Legs = 'Orion Braccae +4',
		Feet = 'Meg. Jam. +2',
	},
	PreshotF1 = {
		Head = 'Orion Beret +3',
		Neck = 'Scout\'s Gorget +2',
		Body = 'Amini Caban +3',
		Hands = 'Carmine Fin. Ga. +1',
		Ring1 = 'Crepuscular Ring',
        Back = { Name = 'Belenus\'s Cape', Augment = '"Snapshot"+10' },
		Waist = 'Yemaya Belt',
		Legs = 'Adhemar Kecks +1', -- Path D --
		Feet = 'Meg. Jam. +2',
	},
	PreshotF2 = {
		Head = 'Orion Beret +3',
		Neck = 'Scout\'s Gorget +2',
		Body = 'Amini Caban +3',
		Hands = 'Carmine Fin. Ga. +1',
		Ring1 = 'Crepuscular Ring',
        Back = { Name = 'Belenus\'s Cape', Augment = '"Snapshot"+10' },
		Waist = 'Yemaya Belt',
		Legs = 'Pursuer\'s Pants', -- path A --
		Feet = 'Arcadian Socks +2',
	},
	GPreshot = {
		Head = 'Orion Beret +3',
		Neck = 'Scout\'s Gorget +2',
		Body = 'Amini Caban +3',
		Hands = 'Carmine Fin. Ga. +1',
		Ring1 = 'Crepuscular Ring',
        Back = { Name = 'Belenus\'s Cape', Augment = '"Snapshot"+10' },
		Waist = 'Yemaya Belt',
		Legs = 'Orion Braccae +4',
		Feet = 'Meg. Jam. +2',
	},
	GPreshot1 = {
		Head = 'Orion Beret +3',
		Neck = 'Scout\'s Gorget +2',
		Body = 'Amini Caban +3',
		Hands = 'Carmine Fin. Ga. +1',
		Ring1 = 'Crepuscular Ring',
        Back = { Name = 'Belenus\'s Cape', Augment = '"Snapshot"+10' },
		Waist = 'Yemaya Belt',
		Legs = 'Adhemar Kecks +1', -- Path D --
		Feet = 'Arcadian Socks +2',
	},
	GPreshot2 = {
		Head = 'Orion Beret +3',
		Neck = 'Scout\'s Gorget +2',
		Body = 'Amini Caban +3',
		Hands = 'Carmine Fin. Ga. +1',
		Ring1 = 'Crepuscular Ring',
        Back = { Name = 'Belenus\'s Cape', Augment = '"Snapshot"+10' },
		Waist = 'Yemaya Belt',
		Legs = 'Pursuer\'s Pants', -- path A --
		Feet = 'Arcadian Socks +2',
	},
	Midshot = {
		Head = 'Arcadian Beret +4',
		Neck = 'Scout\'s Gorget +2',
		Ear1 = 'Beyla Earring',
		Ear2 = 'Crep. Earring',
		Body = 'Ikenga\'s Vest',
		Hands = 'Amini Glove. +3',
		Ring1 = 'Crepuscular Ring',
		Ring2 = 'Cacoethic Ring +1',
        Back = { Name = 'Belenus\'s Cape', Augment = { [1] = 'AGI+20', [2] = 'Rng.Acc.+30', [3] = 'Mag. Evasion+15', [4] = '"Store TP"+10', [5] = 'Rng.Atk.+20' } },
		Waist = 'K. Kachina Belt +1',
		Legs = 'Amini Bragues +2',
		Feet = 'Ikenga\'s Clogs',
	},
	Annihilator = {
		Main = 'Ternion Dagger +1',	
		Sub = 'Crepuscular Knife',
		Range = 'Annihilator',
		Ammo = 'Chrono Bullet',
	},
	Armageddon = {
		Main = 'Malevolence',	
		Sub = 'Malevolence',
		Range = 'Armageddon',
		Ammo = 'Chrono Bullet',
	},
	Earp = {
		Main = 'Crepuscular Knife',	
		Sub = 'Ternion Dagger +1',
		Range = 'Earp',
		Ammo = 'Chrono Bullet',
	},
	FailNot = {
		Main = 'Crepuscular Knife',	
		Sub = 'Ternion Dagger +1',
		Range = 'Fail-Not',
		Ammo = 'Chrono Arrow',
	},
	Fomalhaut = {
		Main = 'Crepuscular Knife',	
		Sub = 'Ternion Dagger +1',
		Range = 'Fomalhaut',
		Ammo = 'Chrono Bullet',
	},
	Gandiva = {
		Main = 'Oneiros Knife',	
		Sub = 'Gleti\'s Knife',
		Range = 'Gandiva',
		Ammo = 'Chrono Arrow',
	},
	Gastraphetes = {
		Main = 'Malevolence',	
		Sub = 'Malevolence',
		Range = 'Gastraphetes',
		Ammo = 'Quelling Bolt',
	},
	Naegling = {
		Main = 'Naegling',	
		Sub = 'Gleti\'s Knife',
		Range = 'Accipiter',
		Ammo = 'Hauksbok Arrow',	
	},
	Pinaka = {
		Main = 'Ternion Dagger +1',	
		Sub = 'Odium',
		Range = 'Pinaka',
		Ammo = 'Chrono Arrow',
	},
	Yoichinoyumi = {
		Main = 'Ternion Dagger +1',	
		Sub = 'Odium',
		Range = 'Yoichinoyumi',
		Ammo = 'Chrono Arrow',
	},
	ApexArrow = {
		Head = 'Orion Beret +3',
        Neck = 'Scout\'s Gorget +2',
        Ear1 = 'Hoxne Earring',
        Ear2 = 'Amini Earring',
        Body = 'Amini Caban +3',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Belenus\'s Cape', Augment = { [1] = 'Mag. Acc.+20', [2] = 'Weapon skill damage +10%', [3] = 'Mag. Evasion+15', [4] = 'AGI+30', [5] = 'Magic Damage+20' } },
        Waist = 'Fotia Belt',
        Legs = 'Arc. Braccae +4',
        Feet = 'Amini Bottillons +2',
	},
	Coronach = {
		Head = 'Orion Beret +3',
        Neck = 'Scout\'s Gorget +2',
        Ear1 = 'Hoxne Earring',
        Ear2 = 'Amini Earring',
        Body = 'Amini Caban +3',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Alabaster Mantle',
        Waist = 'Fotia Belt',
        Legs = 'Arc. Braccae +4',
        Feet = 'Amini Bottillons +2',
	},
	FlamingArrow = {
		Head = 'Nyame Helm',
        Neck = 'Fotia Gorget',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Amini Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Belenus\'s Cape', -- STR WSD --
        Waist = 'Fotia Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
	},
	HotShot = {
		Head = 'Nyame Helm',
        Neck = 'Fotia Gorget',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Amini Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Dingir Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Belenus\'s Cape', Augment = { [1] = 'Mag. Acc.+20', [2] = 'Weapon skill damage +10%', [3] = 'Mag. Evasion+15', [4] = 'AGI+30', [5] = 'Magic Damage+20' } },
        Waist = 'Fotia Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
	},
	JishnusRadiance = {
		Head = 'Clemen. Somen',
        Neck = 'Scout\'s Gorget +2',
        Ear1 = 'Hoxne Earring',
        Ear2 = 'Amini Earring',
        Body = 'Clemen. Hara.',
        Hands = 'Clemency Kote',
        Ring1 = 'Regal Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Belenus\'s Cape', -- DEX WSD --
        Waist = 'Fotia Belt',
        Legs = 'Clem. Haidate',
        Feet = 'Clem. Sune-Ate',
	},
	LastStand = {
		Head = 'Orion Beret +3',
        Neck = 'Scout\'s Gorget +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Amini Earring',
        Body = 'Ikenga\'s Vest',
        Hands = 'Clemency Kote',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Belenus\'s Cape', Augment = { [1] = 'Mag. Acc.+20', [2] = 'Weapon skill damage +10%', [3] = 'Mag. Evasion+15', [4] = 'AGI+30', [5] = 'Magic Damage+20' } },
        Waist = 'Fotia Belt',
        Legs = 'Clem. Haidate',
        Feet = 'Amini Bottillons +2',
	},
	NamasArrow = {
		Head = 'Orion Beret +3',
        Neck = 'Scout\'s Gorget +2',
        Ear1 = 'Hoxne Earring',
        Ear2 = 'Amini Earring',
        Body = 'Amini Caban +3',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Belenus\'s Cape', -- STR WSD --
        Waist = 'Fotia Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Amini Bottillons +2',
	},
	Sarv = {
		Head = 'Orion Beret +3',
        Neck = 'Scout\'s Gorget +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Amini Earring',
        Body = 'Ikenga\'s Vest',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Belenus\'s Cape', -- STR WSD --
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Amini Bottillons +2',
	},
	SavageBlade = {
		Head = 'Orion Beret +3',
        Neck = 'Scout\'s Gorget +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Amini Earring',
        Body = 'Ikenga\'s Vest',
        Hands = 'Clemency Kote',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Belenus\'s Cape', -- STR WSD --
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Amini Bottillons +2',
	},
	Terminus = {
		Head = 'Orion Beret +3',
        Neck = 'Scout\'s Gorget +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Amini Earring',
        Body = 'Ikenga\'s Vest',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Regal Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Alabaster Mantle',
        Waist = 'Fotia Belt',
        Legs = 'Arc. Braccae +4',
        Feet = 'Amini Bottillons +2',
	},
	TrueFlight = {
		Head = 'Nyame Helm',
        Neck = 'Scout\'s Gorget +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Weather. Ring',
        Ring2 = 'Dingir Ring',
        Back = { Name = 'Belenus\'s Cape', Augment = { [1] = 'Mag. Acc.+20', [2] = 'Weapon skill damage +10%', [3] = 'Mag. Evasion+15', [4] = 'AGI+30', [5] = 'Magic Damage+20' } },
        Waist = 'Skrymir Cord +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
	},
	Wildfire = {
		Ammo = 'Eradicating Bullet',
		Head = 'Nyame Helm',
        Neck = 'Scout\'s Gorget +2',
        Ear1 = 'Friomisi Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Dingir Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Belenus\'s Cape', Augment = { [1] = 'Mag. Acc.+20', [2] = 'Weapon skill damage +10%', [3] = 'Mag. Evasion+15', [4] = 'AGI+30', [5] = 'Magic Damage+20' } },
        Waist = 'Skrymir Cord +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
	},
	DoubleShot = {
		Head = 'Meghanada Visor +2',
		Neck = 'Scout\'s Gorget +2',
		Ear1 = 'Odr Earring',
		Ear2 = 'Amini Earring',
		Body = 'Arc. Jerkin +2',
		Hands = 'Oshosi Gloves +1',
		Ring1 = 'Begrudging Ring',
		Ring2 = 'Mummu Ring',
		Back = 'Belenus\'s Cape', -- AGI +Crit Racc/Ratt --
		Waist = 'K. Kachina Belt +1',
		Legs = 'Osh. Trousers +1',
		Feet = 'Osh. Leggings +1',
	},
	EES = { -- need to stack base damage physical damage limit crit chance crit damage ratt true shot, swaps malig amaini sroda--
		Head = 'Meghanada Visor +2',
		Neck = 'Scout\'s Gorget +2',
		Ear1 = 'Odr Earring',
		Ear2 = 'Amini Earring',
		Body = 'Nisroch Jerkin',
		Hands = 'Oshosi Gloves +1',
		Ring1 = 'Begrudging Ring',
		Ring2 = 'Mummu Ring',
		Back = 'Belenus\'s Cape', -- AGI +Crit Racc/Ratt --
		Waist = 'Tellen Belt',
		Legs = 'Amini Bragues +2',
		Feet = 'Osh. Leggings +1',
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
    {Name = 'Chrono Bullet', Quantity = 'all'},
    {Name = 'Chrono Arrow', Quantity = 'all'},
    {Name = 'Naegling', Quantity = 'all'},
    {Name = 'Yoichi\'s Arrow', Quantity = 'all'},
    {Name = 'Chrono Quiver', Quantity = 'all'},
    {Name = 'Chr. Bul. Pouch', Quantity = 'all'},
    {Name = 'Devastating Bullet', Quantity = 'all'},
    {Name = 'Dev. Bul. Pouch', Quantity = 'all'},
    {Name = 'Quelling Bolt', Quantity = 'all'},
    {Name = 'Quelling B. Quiver', Quantity = 'all'},
    {Name = 'Eradicating Bullet', Quantity = 'all'},
    {Name = 'Era. Bul. Pouch', Quantity = 'all'},
};
-- barrage use Yoichi's arrow and devastating bullet --
-- buff active double shot --
-- need add to chat for weapon modes --
-- movement speed + ---

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/bind F5 /lac fwd fwd');
    AshitaCore:GetChatManager():QueueCommand(1, '/bind F6 /lac fwd back');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 004');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(21, '/lockstyleset 004');
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/unbind F5')
    AshitaCore:GetChatManager():QueueCommand(1, '/unbind F6')
end

-------------------------------------------------
-- Helper Functions
-------------------------------------------------

local function EquipCurrentWeapon()
    local mode = WeaponModes[CurrentWeaponMode]
    if mode and sets[mode] then gFunc.EquipSet(sets[mode]) end
end

local function GetFlurryLevel()
    if gData.GetBuffCount('Flurry II')>0 then return 2
    elseif gData.GetBuffCount('Flurry')>0 then return 1 end
    return 0
end

local function GetPreshotSet()
    local weapon=WeaponModes[CurrentWeaponMode]
    local flurry=GetFlurryLevel()
    if weapon=='Gastraphetes' then
        if flurry==2 then return sets.GPreshot2 elseif flurry==1 then return sets.GPreshot1 else return sets.GPreshot end
    else
        if flurry==2 then return sets.PreshotF2 elseif flurry==1 then return sets.PreshotF1 else return sets.Preshot end
    end
end

local function HandleBuffGear()
    if gData.GetBuffCount('Double Shot')>0 then gFunc.EquipSet(sets.DoubleShot) end
end

local function EquipIdle()
    EquipCurrentWeapon()
    gFunc.EquipSet(sets.Idle)
    HandleBuffGear()
end

local function GetWeapon()
    return WeaponModes[CurrentWeaponMode]
end

local function GetWeaponFamily()

    local w = GetWeapon()

    if w == 'Gastraphetes' then
        return 'Crossbow'
    elseif w == 'Naegling' then
        return 'Melee'
    elseif w == 'Annihilator'
        or w == 'Armageddon'
        or w == 'Earp'
        or w == 'Fomalhaut' then
        return 'Gun'
    else
        return 'Bow'
    end
end

local function GetBarrageAmmo()

    local w = GetWeapon()

    if w == 'Naegling' then
        return nil

    elseif w == 'Gastraphetes' then
        return 'Quelling Bolt'

    elseif w == 'Annihilator'
        or w == 'Armageddon'
        or w == 'Earp'
        or w == 'Fomalhaut' then
        return 'Devastating Bullet'

    else
        return "Yoichi's Arrow"
    end
end

local function EquipEngaged()
    EquipCurrentWeapon()
    gFunc.EquipSet(sets.Midshot)
    HandleBuffGear()
end

profile.HandleCommand = function(args)
    if args[1] == 'fwd' then

        CurrentWeaponMode = CurrentWeaponMode + 1

        if CurrentWeaponMode > #WeaponModes then
            CurrentWeaponMode = 1
        end

        EquipCurrentWeapon()
		gFunc.Message(string.format(
			'[RNG] Weapon Mode [%d/%d]: %s',
			CurrentWeaponMode,
			#WeaponModes,
			WeaponModes[CurrentWeaponMode]
		))

    elseif args[1] == 'back' then

        CurrentWeaponMode = CurrentWeaponMode - 1

        if CurrentWeaponMode < 1 then
            CurrentWeaponMode = #WeaponModes
        end

        EquipCurrentWeapon()
		gFunc.Message(string.format(
			'[RNG] Weapon Mode [%d/%d]: %s',
			CurrentWeaponMode,
			#WeaponModes,
			WeaponModes[CurrentWeaponMode]
		))
    end
end

profile.HandleDefault = function()
    if gData.GetPlayer().Status == 'Engaged' then
        EquipEngaged()
    else
        EquipIdle()
    end
end

profile.HandleAbility = function()
    local action = gData.GetAction()
    if not action then
        return
    end

    if action.Name == 'Barrage' then
        local ammo = GetBarrageAmmo()
        if ammo then
            gFunc.Equip('Ammo', ammo)
        end

    elseif action.Name == 'Eagle Eye Shot' then
        gFunc.EquipSet(sets.EES)
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
    gFunc.EquipSet(GetPreshotSet())
end

profile.HandleMidshot = function()
    -- Naegling never performs ranged attacks.
    if GetWeaponFamily() == 'Melee' then
        return
    end

    EquipCurrentWeapon()
    gFunc.EquipSet(sets.Midshot)
    HandleBuffGear()
end

profile.HandleWeaponskill = function()
    local ws = gData.GetAction().Name

    if ws == 'Apex Arrow' then
        gFunc.EquipSet(sets.ApexArrow)

    elseif ws == 'Coronach' then
        gFunc.EquipSet(sets.Coronach)

    elseif ws == 'Flaming Arrow' then
        gFunc.EquipSet(sets.FlamingArrow)

    elseif ws == 'Hot Shot' then
        gFunc.EquipSet(sets.HotShot)

    elseif ws == "Jishnu's Radiance" then
        gFunc.EquipSet(sets.JishnusRadiance)

    elseif ws == 'Last Stand' then
        gFunc.EquipSet(sets.LastStand)

    elseif ws == 'Namas Arrow' then
        gFunc.EquipSet(sets.NamasArrow)

    elseif ws == 'Sarv' then
        gFunc.EquipSet(sets.Sarv)

    elseif ws == 'Savage Blade' then
        gFunc.EquipSet(sets.SavageBlade)

    elseif ws == 'Terminus' then
        gFunc.EquipSet(sets.Terminus)

    elseif ws == 'Trueflight' then
        gFunc.EquipSet(sets.TrueFlight)

	elseif ws == 'Wildfire' then
		gFunc.EquipSet(sets.Wildfire)

		if GetWeapon() == 'Gastraphetes' then
			gFunc.Equip('Ammo', 'Quelling Bolt')

		elseif GetWeaponFamily() == 'Gun' then
			gFunc.Equip('Ammo', 'Eradicating Bullet')
		end

    else
        gFunc.Message('No WS set defined for: ' .. ws)
    end
end

return profile;