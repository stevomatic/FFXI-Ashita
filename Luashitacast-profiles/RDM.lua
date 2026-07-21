local profile = {};
local sets = {
    Idle = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Null Masque',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Lethargy Sayon +3',
        Hands = 'Leth. Ganth. +3',
        Ring1 = 'Gurebu\'s Ring',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = '"Cure" potency +10%', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'MND+20', [5] = 'Magic Damage+20' } },
        Waist = 'Carrier\'s Sash',
        Legs = 'Leth. Fuseau +3',
        Feet = 'Leth. Houseaux +3',
    },
    Resting = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Null Masque',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Lethargy Sayon +3',
        Hands = 'Leth. Ganth. +3',
        Ring1 = 'Gurebu\'s Ring',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = '"Cure" potency +10%', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'MND+20', [5] = 'Magic Damage+20' } },
        Waist = 'Carrier\'s Sash',
        Legs = 'Leth. Fuseau +3',
        Feet = 'Leth. Houseaux +3',
    },
    Nuke = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Leth. Chappel +3',
        Neck = 'Sibyl Scarf',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Leth. Earring +2',
        Body = 'Lethargy Sayon +3',
        Hands = 'Leth. Ganth. +3',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = '"Mag. Atk. Bns."+10', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'INT+20', [5] = 'Magic Damage+20' } },
        Waist = 'Acuity Belt +1',
        Legs = 'Leth. Fuseau +3',
        Feet = 'Viti. Boots +4',
    },
    Precast = {
        Main = 'Sakpata\'s Sword',      -- fc 10, dt 10       --
        Sub = 'Ammurapi Shield', 
		Range = 'Displaced',
        Ammo = 'Impatiens',             --               qm 2 --
        Head = 'Atro. Chapeau +4',      -- fc 16              --
        Neck = 'Voltsurge Torque',      -- fc  4              --
        Ear1 = 'Alabaster Earring',     --        dt  5       --
        Ear2 = 'Leth. Earring +2',      -- fc  9              --
        Body = 'Nyame Mail',            --        dt  9       --
        Hands = 'Leth. Ganth. +3',      --        dt 11       --
        Ring1 = 'Kishar Ring',          -- fc  4              --
        Ring2 = 'Lebeche Ring',         --               qm 2 --
        Back = 'Perimede Cape',         --               qm 4 --
        Waist = 'Witful Belt',          -- fc  3         qm 3 --
        Legs = 'Nyame Flanchard',       --        dt  8       -- 
        Feet = 'Nyame Sollerets',       --        dt  7       -- 
    },
    PreImpact = {
        Main = 'Sakpata\'s Sword',
        Sub = 'Ammurapi Shield', 
		Range = 'Displaced',
        Ammo = 'Impatiens',
        Head = 'Displaced',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Malignance Earring',
        Body = 'Crepuscular Cloak',
        Hands = 'Merlinic Dastanas',
        Ring1 = 'Kishar Ring',
        Ring2 = 'Lebeche Ring',
        Back = 'Perimede Cape',
        Waist = 'Shinjutsu-No-Obi +1',
        Legs = 'Kaykaus Tights +1', 
        Feet = 'Merlinic Crackows', 
    },
    Haste = {
        Main = 'Sakpata\'s Sword',
        Sub = 'Ammurapi Shield', 
		Range = 'Displaced',
        Ammo = 'Impatiens',
        Head = 'Atro. Chapeau +4',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Leth. Earring +2',
        Body = 'Nyame Mail',
        Hands = 'Leth. Ganth. +3',
        Ring1 = 'Kishar Ring',
        Ring2 = 'Lebeche Ring',
        Back = 'Perimede Cape',
        Waist = 'Witful Belt',
        Legs = 'Nyame Flanchard', 
        Feet = 'Nyame Sollerets', 
    },
    Tp = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Coiste Bodhar',
        Head = 'Bunzi\'s Hat',
        Neck = 'Anu Torque',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Dedition Earring',
        Body = 'Malignance Tabard',
        Hands = 'Malignance Gloves',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Chirich Ring +1',
        Back = 'Null Shawl',
        Waist = 'Windbuffet Belt +1',
        Legs = 'Malignance Tights',
        Feet = 'Malignance Boots',
    },
    EnfAcc = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Ullr',
        Ammo = 'Displaced',
        Head = 'Atro. Chapeau +4',
        Neck = 'Null Loop',
        Ear1 = 'Snotra Earring',
        Ear2 = 'Leth. Earring +2',
        Body = 'Atrophy Tabard +4',
        Hands = 'Leth. Ganth. +3',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Null Shawl',
        Waist = 'Acuity Belt +1',
        Legs = 'Atro. Tights +4',
        Feet = 'Viti. Boots +4',
    },
    DebuffINT = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Leth. Chappel +3',
        Neck = 'Sibyl Scarf',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Leth. Earring +2',
        Body = 'Lethargy Sayon +3',
        Hands = 'Leth. Ganth. +3',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = '"Mag. Atk. Bns."+10', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'INT+20', [5] = 'Magic Damage+20' } },
        Waist = 'Acuity Belt +1',
        Legs = 'Leth. Fuseau +3',
        Feet = 'Viti. Boots +4',
    },
    DebuffMND = {
        Main = 'Daybreak',
        Sub = 'Ammurapi Shield',
		Range = 'Ullr',
        Ammo = 'Displaced',
        Head = 'Viti. Chapeau +4',
        Neck = 'Dls. Torque +2',
        Ear1 = 'Snotra Earring',
        Ear2 = 'Leth. Earring +2',
        Body = 'Lethargy Sayon +3',
        Hands = 'Leth. Ganth. +3',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = '"Cure" potency +10%', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'MND+20', [5] = 'Magic Damage+20' } },
        Waist = 'Luminary Sash',
        Legs = 'Leth. Fuseau +3',
        Feet = 'Viti. Boots +4',
    },
    EnfSkill = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Ullr',
        Ammo = 'Displaced',
        Head = 'Viti. Chapeau +4',
        Neck = 'Dls. Torque +2',
        Ear1 = 'Snotra Earring',
        Ear2 = 'Leth. Earring +2',
        Body = 'Lethargy Sayon +3',
        Hands = 'Leth. Ganth. +3',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = '"Cure" potency +10%', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'MND+20', [5] = 'Magic Damage+20' } },
        Waist = 'Obstin. Sash',
        Legs = 'Atro. Tights +4',
        Feet = 'Viti. Boots +4',
    }, 
    Impact = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Ullr',
        Ammo = 'Displaced',
        Head = 'Displaced',
        Neck = 'Null Loop',
        Ear1 = 'Alabaster Earring',
        Ear2 = 'Leth. Earring +2',
        Body = 'Crepuscular Cloak',
        Hands = 'Atro. Gloves +4',
        Ring1 = 'Metamor. Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Null Shawl',
        Waist = 'Null Belt',
        Legs = 'Atro. Tights +4',
        Feet = 'Atro. Boots +4',
    },
    DarkMagic = {
        Main = 'Rubicundity',
        Sub = 'Ammurapi Shield',
		Range = 'Ullr',
        Ammo = 'Displaced',
        Head = 'Pixie Hairpin +1',
        Neck = 'Erra Pendant',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Leth. Earring +2',
        Body = 'Merlinic Jubbah', -- D/A Pot. +11 Fern Maju --
        Hands = 'Merlinic Dastanas', -- D/A Pot. +11 Fern Kabandha --
        Ring1 = 'Evanescence Ring',
        Ring2 = 'Archon Ring',
        Back = 'Null Shawl',
        Waist = 'Fucho-No-Obi',
        Legs = 'Merlinic Shalwar', -- D/A Pot. +11 Fern Crom Dubh --
        Feet = 'Merlinic Crackows', -- D/A Pot. +11 Fern Selkit --
    },
    Stun = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Ullr',
        Ammo = 'Displaced',
        Head = 'Atro. Chapeau +4',
        Neck = 'Null Loop',
        Ear1 = 'Snotra Earring',
        Ear2 = 'Leth. Earring +2',
        Body = 'Atrophy Tabard +4',
        Hands = 'Leth. Ganth. +3',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Null Shawl',
        Waist = 'Acuity Belt +1',
        Legs = 'Atro. Tights +4',
        Feet = 'Viti. Boots +4',
    },
    Cure = {
        Main = 'Daybreak',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Kaykaus Mitra +1',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Beatific Earring',
        Ear2 = 'Meili Earring',
        Body = 'Kaykaus Bliaut +1',
        Hands = 'Kaykaus Cuffs +1',
        Ring1 = 'Sirona\'s Ring',
        Ring2 = 'Stikini Ring +1',
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = '"Cure" potency +10%', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'MND+20', [5] = 'Magic Damage+20' } },
        Waist = 'Bishop\'s Sash',
        Legs = 'Kaykaus Tights +1',
        Feet = 'Kaykaus Boots +1',
    },
    Cursna = {
        Main = 'Daybreak',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Sapience Orb',
        Head = 'Vanya Hood',
        Neck = 'Debilis Medallion',
        Ear1 = 'Beatific Earring',
        Ear2 = 'Meili Earring',
        Body = 'Viti. Tabard +4',
        Hands = 'Hieros Mittens',
        Ring1 = 'Menelaus\'s Ring',
        Ring2 = 'Haoma\'s Ring',
        Back = 'Oretan. Cape +1',
        Waist = 'Bishop\'s Sash',
        Legs = 'Vanya Slops',
        Feet = 'Vanya Clogs',
    },
    Aquaveil = {
        Main = '',
        Sub = '',
		Range = 'Displaced',
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
    Refresh = {
        Main = 'Daybreak', -- Colada 1-2 --
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Sapience Orb',
        Head = 'Amalric Coif +1',
        Neck = 'Dls. Torque +2',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Leth. Earring +2',
        Body = 'Atrophy Tabard +4',
        Hands = 'Atro. Gloves +4',
        Ring1 = 'Kishar Ring',
        Ring2 = 'Lebeche Ring',
        Back = 'Ghostfyre Cape', -- Dur. +20 --
        Waist = 'Embla Sash',
        Legs = 'Leth. Fuseau +3',
        Feet = 'Leth. Houseaux +3',
    },
    Phalanx = {
        Main = 'Sakpata\'s Sword',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Taeon Chapeau',
        Neck = 'Dls. Torque +2',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Leth. Earring +2',
        Body = 'Taeon Tabard',
        Hands = 'Taeon Gloves',
        Ring1 = 'Freke Ring',
        Ring2 = 'Murky Ring',
        Back = 'Ghostfyre Cape', -- Enh. Skill +10, Dur. +20 --
        Waist = 'Embla Sash',
        Legs = 'Taeon Tights',
        Feet = 'Taeon Boots',
    },
    SS = {
        Main = 'Pukulatmuj +1',
        Sub = 'Forfend +1',
		Range = 'Displaced',
        Ammo = 'Sapience Orb',
        Head = 'Befouled Crown',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Mimir Earring',
        Ear2 = 'Andoaa Earring',
        Body = 'Viti. Tabard +4',
        Hands = 'Viti. Gloves +4',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Ghostfyre Cape', -- Enh. Skill +10, Dur. +20 --
        Waist = 'Olympus Sash',
        Legs = 'Atro. Tights +4',
        Feet = 'Leth. Houseaux +3',
    },
    Enhancing = {
        Main = 'Pukulatmuj +1',
        Sub = 'Forfend +1',
		Range = 'Displaced',
        Ammo = 'Sapience Orb',
        Head = 'Leth. Chappel +3',
        Neck = 'Dls. Torque +2',
        Ear1 = 'Mimir Earring',
        Ear2 = 'Leth. Earring +2',
        Body = 'Lethargy Sayon +3',
        Hands = 'Atro. Gloves +4',
        Ring1 = 'Kishar Ring',
        Ring2 = 'Lebeche Ring',
        Back = 'Ghostfyre Cape', -- Enh. Skill +10, Dur. +20 --
        Waist = 'Embla Sash',
        Legs = 'Leth. Fuseau +3',
        Feet = 'Leth. Houseaux +3',
    },
    DeathB = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Coiste Bodhar',
        Head = 'Viti. Chapeau +4',
        Neck = 'Rep. Plat. Medal',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Alabaster Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Gere Ring',
        Back = 'Sucellos\'s Cape', -- STR WSD --
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Leth. Houseaux +3',
    },
    Savage = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Coiste Bodhar',
        Head = 'Viti. Chapeau +4',
        Neck = 'Rep. Plat. Medal',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Alabaster Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Gere Ring',
        Back = 'Sucellos\'s Cape', -- STR WSD --
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Leth. Houseaux +3',
    },
    Requiescat = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Coiste Bodhar',
        Head = 'Viti. Chapeau +4',
        Neck = 'Rep. Plat. Medal',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Alabaster Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Gere Ring',
        Back = 'Sucellos\'s Cape',
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Leth. Houseaux +3',
    },
    DefaultWeaponskill = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Coiste Bodhar',
        Head = 'Viti. Chapeau +4',
        Neck = 'Rep. Plat. Medal',
        Ear1 = 'Sherida Earring',
        Ear2 = 'Alabaster Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Gere Ring',
        Back = 'Sucellos\'s Cape',
        Waist = 'Sailfi Belt +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Leth. Houseaux +3',
    },
    Chainspell = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Null Masque',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Viti. Tabard +4',
        Hands = 'Leth. Ganth. +3',
        Ring1 = 'Gurebu\'s Ring',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = '"Cure" potency +10%', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'MND+20', [5] = 'Magic Damage+20' } },
        Waist = 'Carrier\'s Sash',
        Legs = 'Leth. Fuseau +3',
        Feet = 'Leth. Houseaux +3',
    },
    Convert = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Null Masque',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Lethargy Sayon +3',
        Hands = 'Leth. Ganth. +3',
        Ring1 = 'Gurebu\'s Ring',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = '"Cure" potency +10%', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'MND+20', [5] = 'Magic Damage+20' } },
        Waist = 'Carrier\'s Sash',
        Legs = 'Leth. Fuseau +3',
        Feet = 'Leth. Houseaux +3',
    },
    Saboteur = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Null Masque',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Lethargy Sayon +3',
        Hands = 'Leth. Ganth. +3',
        Ring1 = 'Gurebu\'s Ring',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = '"Cure" potency +10%', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'MND+20', [5] = 'Magic Damage+20' } },
        Waist = 'Carrier\'s Sash',
        Legs = 'Leth. Fuseau +3',
        Feet = 'Leth. Houseaux +3',
    },
    Composure = {
        Main = 'Murgleis',
        Sub = 'Ammurapi Shield',
		Range = 'Displaced',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Leth. Chappel +3',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Etiolation Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Lethargy Sayon +3',
        Hands = 'Leth. Ganth. +3',
        Ring1 = 'Gurebu\'s Ring',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Sucellos\'s Cape', Augment = { [1] = '"Cure" potency +10%', [2] = 'Mag. Acc.+30', [3] = 'Mag. Evasion+15', [4] = 'MND+20', [5] = 'Magic Damage+20' } },
        Waist = 'Carrier\'s Sash',
        Legs = 'Leth. Fuseau +3',
        Feet = 'Leth. Houseaux +3',
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

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 001');
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
    local action = gData.GetAction();
	if (action.Name == 'Saboteur') then
		gFunc.EquipSet(sets.Saboteur);
	elseif (action.Name == 'Chainspell') then
		gFunc.EquipSet(sets.Chainspell);
	elseif (action.Name == 'Composure') then
		gFunc.EquipSet(sets.Composure);
	else
		gFunc.EquipSet(sets.Convert);
	end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local action = gData.GetAction();
    if (action.Name == 'Impact') then
        -- Crepuscular Cloak must be worn at cast time for Impact to take
        -- effect, so it's equipped here on precast. Midcast still swaps
        -- into sets.Impact normally for the rest of the gear.
        gFunc.EquipSet(sets.PreImpact);
    else
        gFunc.EquipSet(sets.Precast);
    end
end

profile.HandleMidcast = function()
    local MndDebuffs = T{ 'Slow', 'Paralyze', 'Slow II', 'Paralyze II', 'Addle', 'Addle II' };
    local ElementalDebuffs = T{ 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock' };
    local action = gData.GetAction();				
    if (action.Skill == 'Enfeebling Magic') then
        if (MndDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.DebuffMND);
        else
            gFunc.EquipSet(sets.DebuffINT);
        end
    elseif (action.Skill == 'Elemental Magic') then
        if (ElementalDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.DebuffINT);
        elseif (action.Name == 'Impact') then
            gFunc.EquipSet(sets.Impact);
        else
            gFunc.EquipSet(sets.Nuke);
        end
    elseif (action.Skill == 'Dark Magic') then
        if (action.Name == 'Stun') then
            gFunc.EquipSet(sets.Stun);
        else
            gFunc.EquipSet(sets.DarkMagic);
        end
    elseif string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga') then
        gFunc.EquipSet(sets.Cure);
    elseif string.match(action.Name, 'Cursna') then
        gFunc.EquipSet(sets.Cursna);
	elseif (action.Skill == 'Enhancing Magic') then
		gFunc.EquipSet(sets.Enhancing)
		if action.Name == 'Phalanx' then
			gFunc.EquipSet(sets.Phalanx)
		elseif string.contains(action.Name,'Refresh') then
			gFunc.EquipSet(sets.Refresh)
		elseif action.Name == 'Stoneskin' then
			gFunc.EquipSet(sets.SS)
		elseif action.Name == 'Aquaveil' then
			gFunc.EquipSet(sets.Aquaveil)
		end
    else
        gFunc.EquipSet(sets.Haste);
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if (action.Name == 'Death Blossom') then
        gFunc.EquipSet(sets.DeathB);
    elseif (action.Name == 'Savage Blade') then
        gFunc.EquipSet(sets.Savage);
    elseif (action.Name == 'Requiescat') then
        gFunc.EquipSet(sets.Requiescat);
    else
        gFunc.EquipSet(sets.DefaultWeaponskill);
    end
end

return profile;