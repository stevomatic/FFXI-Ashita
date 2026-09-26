local profile = {};
local WeaponModes = {
    'Katana',
	'Gkt',
	'Sword',
	'Dagger',
	'Hth',
}
local CurrentWeaponMode = 1

-- Ninjutsu spell "roots" (tier suffix like ": Ichi/Ni/San" stripped off).
-- T{} is Ashita's sugar-lib table type, giving us :contains() for free.
local NinjutsuEnhancing = T{ 'Tonko', 'Utsusemi', 'Monomi', 'Myoshu', 'Migawari', 'Gekka', 'Yain', 'Kakka' };
local NinjutsuEnfeebling = T{ 'Kurayami', 'Hojo', 'Dokumori', 'Jubaku', 'Aisha', 'Yurin' };
local NinjutsuElemental = T{ 'Katon', 'Suiton', 'Raiton', 'Doton', 'Huton', 'Hyoton' };

-- Sets that must stay equipped for as long as their buff is active, rather
-- than only at the moment of activation. Confirmed against the resource
-- dump (id_.txt): Migawari (id 471) is its own distinct status, separate
-- from the Copy Image ids (444-446) that Utsusemi's shadows use, so a
-- plain name match is safe here. Yonin=420, Innin=421, Futae=441, Sange=352.
local PersistentBuffSets = {
    { Buff = 'Migawari', Set = 'Migawari' },
    { Buff = 'Yonin',    Set = 'Yonin' },
    { Buff = 'Innin',    Set = 'Innin' },
    { Buff = 'Futae',    Set = 'Futae' },
    { Buff = 'Sange',    Set = 'Sange' },
};

-- Wing items (warps) that should equip sets.Wing when used. Keyed by item
-- Id rather than name: gData.GetAction() reports the same resource Id for
-- an item regardless of whether it came from normal inventory or the
-- Temporary Items bag, so one table covers both without extra branching.
local WingItems = {
    [4202] = true, -- Daedalus Wing
    [4213] = true, -- Icarus Wing
    [5440] = true, -- Dusty Wing
    [5834] = true, -- Lucid Wings I
    [6475] = true, -- Lucid Wings II
};

-- Weaponskill name -> profile.Sets entry. Several names intentionally share
-- one set per your grouping convention (e.g. Tachi: Jinpu/Kagero/Goten all
-- use sets.JinpuKageroGoten).
local WeaponskillSets = {
    ['Aeolian Edge']  = 'Aeolian',
    ['Savage Blade']  = 'Savage',
    ['Tachi: Ageha']  = 'Ageha',
    ['Tachi: Jinpu']  = 'JinpuKageroGoten',
    ['Tachi: Kagero'] = 'JinpuKageroGoten',
    ['Tachi: Goten']  = 'JinpuKageroGoten',
    ['Tachi: Kasha']  = 'Kasha',
    ['Blade: Shun']   = 'Shun',
    ['Blade: Ten']    = 'Ten',
    ['Blade: Chi']    = 'ChiTekiTo',
    ['Blade: Teki']   = 'ChiTekiTo',
    ['Blade: To']     = 'ChiTekiTo',
    ['Blade: Hi']     = 'Hi',
    ['Blade: Ku']     = 'Ku',
    ['Blade: Kamu']   = 'Kamu',
    ['Blade: Jin']    = 'Jin',
    ['Blade: Ei']     = 'Ei',
    ['Blade: Yu']     = 'Yu',
    ['Asuran Fists']  = 'Asuran',
};

local sets = {
    Idle = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Nyame Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Mag. Evasion+45', [3] = 'INT+20', [4] = 'Evasion+20' } },
        Waist = 'Engraved Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Resting = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Null Masque',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Mag. Evasion+45', [3] = 'INT+20', [4] = 'Evasion+20' } },
        Waist = 'Engraved Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Movement = {
        Feet = 'Hachiya Kyahan +2',
    },
	Katana = {
		Main = 'Heishi Shorinken',
		Sub = 'Kunimitsu',
	},
	Gkt = {
		Main = 'Hachimonji',
		Sub = 'Rigorous Grip +1',
	},
	Sword = {
		Main = 'Naegling',
		Sub = 'Hitaki',
	},
	Dagger = {
		Main = 'Malevolence',
		Sub = 'Hitaki',
	},
	Hth = {
		Main = 'Karambit',
		Sub = 'Displaced',
	},
    KatanaTp = {
        Ammo = 'Seki Shuriken',
        Head = 'Mpaca\'s Cap',
        Neck = 'Ninja Nodowa +2',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Dedition Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Malignance Gloves',
        Ring1 = 'Gere Ring',
        Ring2 = 'Epona\'s Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = 'Windbuffet Belt +1',
        Legs = 'Malignance Tights',
        Feet = 'Malignance Boots',
    },
    GktTp = {
        Ammo = 'Seki Shuriken',
        Head = 'Mpaca\'s Cap',
        Neck = 'Ninja Nodowa +2',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Dedition Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Malignance Gloves',
        Ring1 = 'Gere Ring',
        Ring2 = 'Epona\'s Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = 'Windbuffet Belt +1',
        Legs = 'Malignance Tights',
        Feet = 'Nyame Sollerets',
    },
    SwordTp = {
        Ammo = 'Seki Shuriken',
        Head = 'Mpaca\'s Cap',
        Neck = 'Ninja Nodowa +2',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Telos Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Malignance Gloves',
        Ring1 = 'Gere Ring',
        Ring2 = 'Murky Ring',
        Back = 'Null Shawl',
        Waist = 'Kentarch Belt +1',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Malignance Boots',
    },
    DaggerTp = {
        Ammo = 'Seki Shuriken',
        Head = 'Mpaca\'s Cap',
        Neck = 'Ninja Nodowa +2',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Dedition Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Malignance Gloves',
        Ring1 = 'Gere Ring',
        Ring2 = 'Epona\'s Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = 'Windbuffet Belt +1',
        Legs = 'Malignance Tights',
        Feet = 'Malignance Boots',
    },
    HthTp = {
        Ammo = 'Seki Shuriken',
        Head = 'Mpaca\'s Cap',
        Neck = 'Ninja Nodowa +2',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Dedition Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Malignance Gloves',
        Ring1 = 'Gere Ring',
        Ring2 = 'Epona\'s Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Damage taken-5%', [2] = '"Dbl.Atk."+10', [3] = 'Accuracy+20', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = 'Windbuffet Belt +1',
        Legs = 'Malignance Tights',
        Feet = 'Malignance Boots',
    },
-- enhancing ninjutsu: Tonko, Utsusemi (has its own precast and midcast), Monomi, Myoshu, Migawari, Gekka, Yain, Kakka
-- enfeebling ninjutsu: Kurayami, Hojo, Dokumori, Jubaku, Aisha, Yurin
-- elemental ninjutsu: Katon, Suiton, Raiton, Doton, Huton, Hyoton
    Precast = {
        Ammo = 'Sapience Orb',
        Head = 'Herculean Helm',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Enchntr. Earring +1',
        Body = 'Adhemar Jacket +1', -- path d --
        Hands = 'Leyline Gloves',
        Ring1 = 'Weather. Ring',
        Ring2 = 'Kishar Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = '"Fast Cast"+10', [2] = 'Spell interruption rate down-10%', [3] = 'Mag. Evasion+20', [4] = 'AGI+20', [5] = 'Evasion+30' } },
		Waist = 'Sailfi Belt +1',
        Legs = 'Herculean Trousers',
        Feet = 'Herculean Boots',
    },
    UtsusemiPrecast = {
        Ammo = 'Sapience Orb',
        Head = 'Herculean Helm',
        Neck = 'Magoraga Beads',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Enchntr. Earring +1',
        Body = 'Adhemar Jacket +1', -- path d --
        Hands = 'Leyline Gloves',
        Ring1 = 'Weather. Ring',
        Ring2 = 'Kishar Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = '"Fast Cast"+10', [2] = 'Spell interruption rate down-10%', [3] = 'Mag. Evasion+20', [4] = 'AGI+20', [5] = 'Evasion+30' } },
		Waist = 'Sailfi Belt +1',
        Legs = 'Herculean Trousers',
        Feet = 'Herculean Boots',
    },
    IchiPrecast = {
        Ammo = 'Impatiens',
        Head = 'Herculean Helm',
        Neck = 'Magoraga Beads',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Enchntr. Earring +1',
        Body = 'Adhemar Jacket +1', -- path d --
        Hands = 'Leyline Gloves',
        Ring1 = 'Weather. Ring',
        Ring2 = 'Lebeche Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = '"Fast Cast"+10', [2] = 'Spell interruption rate down-10%', [3] = 'Mag. Evasion+20', [4] = 'AGI+20', [5] = 'Evasion+30' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Herculean Trousers',
        Feet = 'Herculean Boots',
    },
    Utsusemi = {
        Ammo = 'Sapience Orb',
        Head = 'Versa Celata +1',
        Neck = 'Moonlight Necklace',
        Ear1 = 'Cryptic Earring',
        Ear2 = 'Trux Earring',
        Body = 'Emet Harness +1',
        Hands = 'Mochizuki Tekko +3',
        Ring1 = 'Eihwaz Ring',
        Ring2 = 'Supershear Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Mag. Evasion+45', [3] = 'INT+20', [4] = 'Evasion+20' } },
        Waist = 'Kasiri Belt',
        Legs = 'Zoar Subligar +1',
        Feet = 'Hattori Kyahan +2',
    },
    Ichi = {
		Main = 'Tancho +1',          -- 35 -- 
        Ammo = 'Staunch Tathlum +1', -- 11 --
        Neck = 'Moonlight Necklace', -- 15 -- 
        Ear1 = 'Halasz Earring',     --  5 --
        Ear2 = 'Magnetic Earring',   --  8 --
        Body = 'Emet Harness +1',
        Hands = 'Rawhide Gloves',    -- 15 path b --
        Ring1 = 'Evanescence Ring',  --  5 --
        Ring2 = 'Supershear Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = '"Fast Cast"+10', [2] = 'Spell interruption rate down-10%', [3] = 'Mag. Evasion+20', [4] = 'AGI+20', [5] = 'Evasion+30' } },
        Waist = 'Audumbla Sash',     -- 10 --
        Legs = 'Zoar Subligar +1',
        Feet = 'Hattori Kyahan +2',
    }, 
 Enhancing = {
        Ammo = 'Sapience Orb',
        Head = 'Versa Celata +1',
        Neck = 'Moonlight Necklace',
        Ear1 = 'Cryptic Earring',
        Ear2 = 'Trux Earring',
        Body = 'Emet Harness +1',
        Hands = 'Kurys Gloves',
        Ring1 = 'Eihwaz Ring',
        Ring2 = 'Supershear Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Mag. Evasion+45', [3] = 'INT+20', [4] = 'Evasion+20' } },
        Waist = 'Kasiri Belt',
        Legs = 'Zoar Subligar +1',
        Feet = 'Mochi. Kyahan +2',
    },
    Enfeebling = {
        Ammo = 'Yamarang',
        Head = 'Hachiya Hatsu. +2',
        Neck = 'Null Loop',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Hattori Earring +1',
        Body = 'Hachiya Chain. +2',
        Hands = 'Hachiya Tekko +2',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Null Shawl',
		Waist = 'Null Belt',
        Legs = 'Hachiya Hakama +2',
        Feet = 'Hachiya Kyahan +2',
    },
    Elemental = {
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Mochi. Hatsuburi +3',
        Neck = 'Sibyl Scarf',
        Ear1 = 'Crematio Earring',
        Ear2 = 'Friomisi Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Dingir Ring',
        Back = 'Null Shawl',
		Waist = 'Skrymir Cord +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Mochi. Kyahan +2',
    },
    ElementalBurst = {
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Mochi. Hatsuburi +3',
        Neck = 'Sibyl Scarf',
        Ear1 = 'Crematio Earring',
        Ear2 = 'Friomisi Earring',
        Body = 'Nyame Mail',
        Hands = 'Hattori Tekko +2',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Mujin Band',
        Back = 'Null Shawl',
		Waist = 'Skrymir Cord +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Mochi. Kyahan +2',
    },
	-- Migawari set must be worn while buffactive --
	Migawari = {
		Body = 'Hattori Ningi +2',
	},
	Mijin = {
		Legs = 'Mochi. Hakama +3',
	},
	-- Yonin set must be worn while buffactive --
	Yonin = {
		Head = 'Mochi. Hatsuburi +3',
		Legs = 'Hattori Hakama +2',
	},
	-- Innin set must be worn while buffactive --
	Innin = {
		Head = 'Hattori Zukin +2',
	},
	Sange = {
		Body = 'Mochi. Chainmail +3',
	},
	-- Futae set must be worn while buffactive --
	Futae = {
		Hands = 'Hattori Tekko +2',
	},
    Enmity = {
        Ammo = 'Sapience Orb',
        Head = 'Versa Celata +1',
        Neck = 'Moonlight Necklace',
        Ear1 = 'Cryptic Earring',
        Ear2 = 'Trux Earring',
        Body = 'Emet Harness +1',
        Hands = 'Kurys Gloves',
        Ring1 = 'Eihwaz Ring',
        Ring2 = 'Supershear Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Enmity+10', [2] = 'Mag. Evasion+45', [3] = 'INT+20', [4] = 'Evasion+20' } },
        Waist = 'Kasiri Belt',
        Legs = 'Zoar Subligar +1',
        Feet = 'Mochi. Kyahan +2',
    },
    Wing = {
        Ammo = 'Aurgelmir Orb +1',
        Head = 'Malignance Chapeau',
        Neck = 'Iskur Gorget',
        Ear1 = 'Dedition Earring',
        Ear2 = 'Hattori Earring +1',
        Body = 'Malignance Tabard',
        Hands = 'Malignance Gloves',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Chirich Ring +1',
        Back = 'Null Shawl',
        Waist = 'Gerdr Belt +1',
        Legs = 'Malignance Tights',
        Feet = 'Malignance Boots',
    },
    PreShot = {
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
    Midshot = {
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
	-- Weapon skill sets --
	Asuran = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Mpaca\'s Cap',
        Neck = 'Fotia Gorget',
        Ear1 = 'Hoxne Earring',
        Ear2 = 'Alabaster Earring',
        Body = 'Mpaca\'s Doublet',
        Hands = 'Mpaca\'s Gloves',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Niqmaddu Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Accuracy+20', [2] = 'STR+30', [3] = 'Mag. Evasion+15', [4] = 'Attack+20', [5] = 'Weapon skill damage +10%' } },
        Waist = 'Fotia Belt',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Nyame Sollerets',		
	},	
    Aeolian = {
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Mochi. Hatsuburi +3',
        Neck = 'Sibyl Scarf',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Friomisi Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Dingir Ring',
        Back = 'Andartia\'s Mantle', -- int wsd --
        Waist = 'Orpheus\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Savage = {
        Ammo = 'Seeth. Bomblet +1',
        Head = 'Hachiya Hatsu. +2',
        Neck = 'Rep. Plat. Medal',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Alabaster Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Accuracy+20', [2] = 'STR+30', [3] = 'Mag. Evasion+15', [4] = 'Attack+20', [5] = 'Weapon skill damage +10%' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Hattori Kyahan +2',
    },
    Ageha = {
        Ammo = 'Yamarang',
        Head = 'Hachiya Hatsu. +2',
        Neck = 'Null Loop',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Hattori Earring +1',
        Body = 'Hachiya Chain. +2',
        Hands = 'Hachiya Tekko +2',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Murky Ring',
        Back = 'Null Shawl',
        Waist = 'Null Belt',
        Legs = 'Hachiya Hakama +2',
        Feet = 'Hachiya Kyahan +2',
    },
    JinpuKageroGoten = {
        Ammo = 'Seeth. Bomblet +1',
        Head = 'Mpaca\'s Cap',
        Neck = 'Fotia Gorget',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hattori Earring +1',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Gere Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Accuracy+20', [2] = 'STR+30', [3] = 'Mag. Evasion+15', [4] = 'Attack+20', [5] = 'Weapon skill damage +10%' } },
        Waist = 'Orpheus\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Kasha = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Mpaca\'s Cap',
        Neck = 'Ninja Nodowa +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hattori Earring +1',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Accuracy+20', [2] = 'STR+30', [3] = 'Mag. Evasion+15', [4] = 'Attack+20', [5] = 'Weapon skill damage +10%' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Hattori Kyahan +2',
    },
    Shun = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Ken. Jinpachi +1',
        Neck = 'Ninja Nodowa +2',
        Ear1 = 'Lugra Earring +1',
        Ear2 = 'Hattori Earring +1',
        Body = 'Malignance Tabard',
        Hands = 'Malignance Gloves',
        Ring1 = 'Gere Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = '"Dbl.Atk."+10', [2] = 'Accuracy+20', [3] = 'Mag. Evasion+15', [4] = 'Attack+20', [5] = 'DEX+30' } },
        Waist = 'Fotia Belt',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Ken. Sune-Ate +1',
    },
    Ten = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Hachiya Hatsu. +2',
        Neck = 'Ninja Nodowa +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hattori Earring +1',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Accuracy+20', [2] = 'STR+30', [3] = 'Mag. Evasion+15', [4] = 'Attack+20', [5] = 'Weapon skill damage +10%' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Hattori Kyahan +2',
    },
    ChiTekiTo = {
        Ammo = 'Seeth. Bomblet +1',
        Head = 'Mochi. Hatsuburi +3',
        Neck = 'Ninja Nodowa +2',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Hattori Earring +1',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Gere Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = { Name = 'Andartia\'s Mantle', Augment = { [1] = 'Accuracy+20', [2] = 'STR+30', [3] = 'Mag. Evasion+15', [4] = 'Attack+20', [5] = 'Weapon skill damage +10%' } },
        Waist = 'Orpheus\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Hi = {
        Ammo = 'Yetshila +1',
        Head = 'Hachiya Hatsu. +2',
        Neck = 'Ninja Nodowa +2',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Hattori Earring +1',
        Body = 'Nyame Mail',
        Hands = 'Malignance Gloves',
        Ring1 = 'Regal Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Andartia\'s Mantle', -- agi wsd --
        Waist = 'Gerdr Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Hattori Kyahan +2',
    },
    Ku = {
        Ammo = 'Crepuscular Pebble',
        Head = 'Blistering Sallet +1',
        Neck = 'Ninja Nodowa +2',
        Ear1 = 'Lugra Earring +1',
        Ear2 = 'Hattori Earring +1',
        Body = 'Nyame Mail',
        Hands = 'Malignance Gloves',
        Ring1 = 'Gere Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Andartia\'s Mantle', -- str DA --
        Waist = 'Fotia Belt',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Hattori Kyahan +2',
    },
    Kamu = {
        Ammo = 'Coiste Bodhar',
        Head = 'Nyame Helm',
        Neck = 'Ninja Nodowa +2',
        Ear1 = 'Lugra Earring +1',
        Ear2 = 'Hattori Earring +1',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Gere Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Andartia\'s Mantle', -- str DA --
        Waist = 'Sailfi Belt +1',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Nyame Sollerets',
    },
    Jin = {
        Ammo = 'Yetshila +1',
        Head = 'Adhemar Bonnet +1',
        Neck = 'Ninja Nodowa +2',
        Ear1 = 'Lugra Earring +1',
        Ear2 = 'Hattori Earring +1',
        Body = 'Ken. Samue +1',
        Hands = 'Ryuo Tekko +1',
        Ring1 = 'Gere Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Andartia\'s Mantle', -- dex crit --
        Waist = 'Fotia Belt',
        Legs = 'Mpaca\'s Hose',
        Feet = 'Ken. Sune-Ate +1',
    },
    Ei = {
        Ammo = 'Seeth. Bomblet +1',
        Head = 'Mochi. Hatsuburi +3',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Moonshade Earring',
        Ear2 = 'Friomisi Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Archon Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Andartia\'s Mantle', -- int wsd --
        Waist = 'Orpheus\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Yu = {
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Mochi. Hatsuburi +3',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Crematio Earring',
        Ear2 = 'Friomisi Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Dingir Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Andartia\'s Mantle', -- int wsd --
        Waist = 'Orpheus\'s Sash',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
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
    { Name = 'Seki Shuriken', Quantity = 'all' },
    { Name = 'Seki Sh. Pouch', Quantity = 'all' },
    { Name = 'Kikoku', Quantity = 'all' },
    { Name = 'Venus Orb', Quantity = 'all' },
    { Name = 'Dokoku', Quantity = 'all' },
    { Name = 'Chonofuda', Quantity = 'all' },
    { Name = 'Toolbag (Cho)', Quantity = 'all' },
    { Name = 'Toolbag (Ino)', Quantity = 'all' },
    { Name = 'Instant Reraise', Quantity = 'all' },
    { Name = 'Inoshishinofuda', Quantity = 'all' },
    { Name = 'Toolbag (Shika)', Quantity = 'all' },
    { Name = 'Mars Orb', Quantity = 'all' },
    { Name = 'Shikanofuda', Quantity = 'all' },
    { Name = 'Miso Ramen', Quantity = 'all' },
};

-- Direct id check for whether Utsusemi shadows are currently up. Uses the
-- exact ids pulled from your id_.txt dump (66, 444-446) rather than trusting
-- that the display string is exactly "Copy Image" on this server - a name
-- mismatch would silently make GetBuffCount('Copy Image') always read 0,
-- which would explain casting on cooldown alone instead of waiting for
-- shadows to actually deplete.
local CopyImageBuffIds = { 66, 444, 445, 446 };
local function HasUtsusemiShadows()
    for i = 1, #CopyImageBuffIds do
        if (gData.GetBuffCount(CopyImageBuffIds[i]) > 0) then
            return true;
        end
    end
    return (gData.GetBuffCount('Copy Image') > 0); -- name-based fallback, in case the id list is incomplete
end

local Settings = {
    MagicBurst = false,     -- toggled with /lac fwd mb; swaps Elemental <-> ElementalBurst
    AutoUtsusemi = false,   -- toggled with /ci; defaults off on load/job change
};

-- Priority order for auto-refresh: San > Ni > Ichi. Shikanofuda is the tool
-- consumed for all three specifically because this profile runs NIN as
-- main job - Shihei is what gets consumed instead when NIN is a subjob,
-- which doesn't apply to this profile.
local UtsusemiPriority = {
    { Spell = 'Utsusemi: San',  Tool = 'Shikanofuda' },
    { Spell = 'Utsusemi: Ni',   Tool = 'Shikanofuda' },
    { Spell = 'Utsusemi: Ichi', Tool = 'Shikanofuda' },
};
local UtsusemiResolved = {};   -- filled in OnLoad: [spell name] = { SpellId, ItemId, Tool }
local UtsusemiToolWarned = {}; -- [spell name] = true once we've warned about it, so we don't spam chat
local LastZoneId = nil;

-- Resolves spell/tool names to their resource Ids once at load, so the
-- per-tick check below never has to touch the resource manager.
local function ResolveUtsusemiIds()
    local resMgr = AshitaCore:GetResourceManager();
    for i = 1, #UtsusemiPriority do
        local entry = UtsusemiPriority[i];
        local spellRes = resMgr:GetSpellByName(entry.Spell, 2);
        local itemRes = resMgr:GetItemByName(entry.Tool, 2);
        if (spellRes ~= nil) and (itemRes ~= nil) then
            UtsusemiResolved[entry.Spell] = { SpellId = spellRes.Index, ItemId = itemRes.Id, Tool = entry.Tool };
        else
            gFunc.Message('Auto-Utsusemi: could not resolve "' .. entry.Spell .. '" or "' .. entry.Tool .. '" - check spelling.');
        end
    end
end

-- Seconds remaining on a spell's recast (0 = ready). Bypasses gData since it
-- has no general recast-query function - this reads Ashita's recast table
-- directly, the same way recast/timer addons do.
local function GetSpellRecast(spellId)
    if (spellId == nil) then
        return 999;
    end
    return AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(spellId) / 60;
end

-- Total count of a given item Id currently held in main inventory.
local function GetToolCount(itemId)
    if (itemId == nil) then
        return 0;
    end
    local inventoryManager = AshitaCore:GetMemoryManager():GetInventory();
    local max = gData.GetContainerMax(0); -- 0 = Inventory
    local total = 0;
    for i = 0, max do
        local item = inventoryManager:GetContainerItem(0, i);
        if (item ~= nil) and (item.Id == itemId) then
            total = total + item.Count;
        end
    end
    return total;
end

-- Casts the highest-priority available Utsusemi tier when shadows are down.
-- Only runs from HandleDefault, which only fires when nothing else is in
-- progress, so this can never stack a cast on top of another action.
local function CheckAutoUtsusemi()
    if (Settings.AutoUtsusemi ~= true) then
        return;
    end
    if (HasUtsusemiShadows()) then
        return; -- shadows already up, nothing to do
    end

    for i = 1, #UtsusemiPriority do
        local entry = UtsusemiPriority[i];
        local resolved = UtsusemiResolved[entry.Spell];
        if (resolved ~= nil) and (GetSpellRecast(resolved.SpellId) <= 0) then
            local toolCount = GetToolCount(resolved.ItemId);
            if (toolCount > 0) then
                UtsusemiToolWarned[entry.Spell] = false;
                AshitaCore:GetChatManager():QueueCommand(-1, '/ma "' .. entry.Spell .. '" <me>');
                gFunc.Message('Auto-Utsusemi: casting ' .. entry.Spell .. ' (' .. toolCount .. ' ' .. resolved.Tool .. ' on hand)');
                return; -- one attempt per tick; let the cast resolve before checking again
            elseif (UtsusemiToolWarned[entry.Spell] ~= true) then
                gFunc.Message('Auto-Utsusemi: out of ' .. resolved.Tool .. ' for ' .. entry.Spell .. '!');
                UtsusemiToolWarned[entry.Spell] = true;
            end
        end
    end
end

-- Returns the root of a tiered ninjutsu name, e.g. 'Utsusemi: Ichi' -> 'Utsusemi'
local function GetNinjutsuRoot(name)
    return name and name:match('^(%a+)') or name;
end

-- Layers any buff-persistent gear on top of whatever is already queued.
-- Call this LAST in a handler so persistent pieces win slot conflicts.
local function ApplyPersistentGear()
    for i = 1, #PersistentBuffSets do
        local entry = PersistentBuffSets[i];
        if (gData.GetBuffCount(entry.Buff) > 0) then
            gFunc.EquipSet(sets[entry.Set]);
        end
    end
end

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    
    -- Bind directly to /lac fwd (no alias required)
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^= /lac fwd');

    -- Auto-Utsusemi toggle, bound to Alt+Q. Bound directly (no alias) since
    -- that's the pattern that's already proven to work for weapon cycling.
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind !q /lac fwd ci');
    ResolveUtsusemiIds();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 009');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 009');
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^=');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !q');
end

profile.HandleCommand = function(args)
    -- Handle bare command or '/lac fwd'
    if (#args == 0 or args[1] == 'fwd') then
        CurrentWeaponMode = CurrentWeaponMode + 1;
        if (CurrentWeaponMode > #WeaponModes) then
            CurrentWeaponMode = 1;
        end
        gFunc.Message('Weapon Mode: ' .. WeaponModes[CurrentWeaponMode]);
    elseif (args[1] == 'mb') then
        Settings.MagicBurst = not Settings.MagicBurst;
        gFunc.Message('Magic Burst: ' .. tostring(Settings.MagicBurst));
    elseif (args[1] == 'ci') then
        Settings.AutoUtsusemi = not Settings.AutoUtsusemi;
        gFunc.Message('Auto-Utsusemi: ' .. tostring(Settings.AutoUtsusemi));
    end
end

profile.HandleDefault = function()
    -- Zoning resets Auto-Utsusemi to off, same as a fresh load/job change.
    local zoneId = AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0);
    if (LastZoneId ~= nil) and (zoneId ~= LastZoneId) then
        Settings.AutoUtsusemi = false;
    end
    LastZoneId = zoneId;

    local player = gData.GetPlayer();
    local mode = WeaponModes[CurrentWeaponMode];

    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets[mode]);          -- Main/Sub for the active weapon mode
        gFunc.EquipSet(sets[mode .. 'Tp']);  -- Matching TP armor set
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        gFunc.EquipSet(sets.Idle);
        gFunc.EquipSet(sets[mode]);          -- Ensures main/sub weapons equip while idle
        if (player.IsMoving == true) then
            gFunc.EquipSet(sets.Movement);   -- Feet swap while walking/running
        end
    end
    ApplyPersistentGear();
    CheckAutoUtsusemi();
end

profile.HandleAbility = function()
    local action = gData.GetAction();

    -- Equip-on-activation only: gear just needs to be on for the instant
    -- the ability fires, nothing to persist afterward.
    if (action.Name == 'Mijin Gakure') then
        gFunc.EquipSet(sets.Mijin);

    -- Stance/buff abilities: equip immediately for responsiveness. The
    -- matching entry in PersistentBuffSets keeps the set on afterward via
    -- ApplyPersistentGear(), as long as the buff is active.
    elseif (action.Name == 'Yonin') then
        gFunc.EquipSet(sets.Yonin);
    elseif (action.Name == 'Innin') then
        gFunc.EquipSet(sets.Innin);
    elseif (action.Name == 'Sange') then
        gFunc.EquipSet(sets.Sange);

    -- Anything else isn't a recognized NIN main-job ability, so it must be
    -- coming from whatever subjob is out (Provoke/WAR, Steps/DNC, Chi
    -- Blast/MNK, etc.). Catching it here means a new/different subjob never
    -- needs its own branch, and it can't collide with the NIN logic above
    -- since those are matched first and this only runs when none of them do.
    else
        gFunc.EquipSet(sets.Enmity);
    end

    ApplyPersistentGear();
end

profile.HandleItem = function()
    local action = gData.GetAction();
    if (WingItems[action.Id] == true) then
        gFunc.EquipSet(sets.Wing);
    end
end

profile.HandlePrecast = function()
    local action = gData.GetAction();
    if (action.Skill == 'Ninjutsu' and action.Name == 'Utsusemi: Ichi') then
        gFunc.EquipSet(sets.IchiPrecast);
    elseif (action.Skill == 'Ninjutsu' and GetNinjutsuRoot(action.Name) == 'Utsusemi') then
        gFunc.EquipSet(sets.UtsusemiPrecast);
    else
        gFunc.EquipSet(sets.Precast);
    end
    ApplyPersistentGear();
end

profile.HandleMidcast = function()
    local action = gData.GetAction();
    if (action.Skill == 'Ninjutsu') then
        local root = GetNinjutsuRoot(action.Name);
        if (action.Name == 'Utsusemi: Ichi') then
            gFunc.EquipSet(sets.Ichi);
        elseif (root == 'Utsusemi') then
            gFunc.EquipSet(sets.Utsusemi);
        elseif (NinjutsuEnhancing:contains(root)) then
            gFunc.EquipSet(sets.Enhancing);
        elseif (NinjutsuEnfeebling:contains(root)) then
            gFunc.EquipSet(sets.Enfeebling);
        elseif (NinjutsuElemental:contains(root)) then
            if (Settings.MagicBurst == true) then
                gFunc.EquipSet(sets.ElementalBurst);
                gFunc.Message('Magic Burst: ' .. action.Name);
            else
                gFunc.EquipSet(sets.Elemental);
                gFunc.Message('Free Cast: ' .. action.Name);
            end
        end
    end
    ApplyPersistentGear();
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.PreShot);
    ApplyPersistentGear();
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
    ApplyPersistentGear();
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    local setName = WeaponskillSets[action.Name];
    if (setName ~= nil) then
        gFunc.EquipSet(sets[setName]);
    end
    ApplyPersistentGear();
end

return profile;


-- One thing worth flagging: this else swap is equip-once-on-activation only, same as Mijin Gakure. If a subjob ability ever grants a buff you'd want the Enmity gear to persist through (e.g. a WAR subjob Warcry-type effect), it won't stick around the way Yonin/Innin/Sange do, since those are wired into PersistentBuffSets. Not a problem for something like Provoke, but worth keeping in mind if you notice gear reverting mid-buff on a particular subjob ability later.