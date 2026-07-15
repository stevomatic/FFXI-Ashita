local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local sets = {
    Idle = {
		Main = 'Nirvana',
		Sub = 'Elan Strap +1',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Beckoner\'s Horn +3',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Bunzi\'s Robe',
        Hands = 'Bunzi\'s Gloves',
        Ring1 = 'Murky Ring',
        Ring2 = 'Gurebu\'s Ring',
        Back = 'Campestres\'s Cape',
        Waist = 'Carrier\'s Sash',
        Legs = 'Beck. Spats +3',
        Feet = 'Beck. Pigaches +3',
    },
    Pet_Idle = {
        Main = 'Nirvana',
        Sub = 'Elan Strap +1',
        Ammo = 'Sancus Sachet +1',
        Head = 'Convoker\'s Horn +3',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Lugalbanda Earring',
        Ear2 = 'Enmerkar Earring',
        Body = 'Glyphic Doublet +3',
        Hands = 'Convo. Bracers +3',
        Ring1 = 'Varar Ring +1',
        Ring2 = 'C. Palug Ring',
        Back = 'Campestres\'s Cape',
        Waist = 'Klouskap Sash +1',
        Legs = 'Convo. Spats +3',
        Feet = 'Convo. Pigaches +3',
    },
	Resting = {},
    Idle_Regen = {
        Neck = 'Bathy Choker +1',
        Ear1 = 'Infused Earring',
        Ring2 = 'Chirich Ring +1',
    },
    Idle_Refresh = {
        Head = 'Convoker\'s Horn +3',
        Ear1 = 'C. Palug Earring',
        Ear2 = 'Beck. Earring +1',
        Body = 'Shomonjijoe +1',
		Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Waist = 'Fucho-no-Obi',
        Legs = 'Assid. Pants +1',
    },
	Town = {
		Main = 'Nirvana',
		Sub = 'Elan Strap +1',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Beckoner\'s Horn +3',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Bunzi\'s Robe',
        Hands = 'Bunzi\'s Gloves',
        Ring1 = 'Murky Ring',
        Ring2 = 'Gurebu\'s Ring',
        Back = 'Campestres\'s Cape',
        Waist = 'Carrier\'s Sash',
        Legs = 'Beck. Spats +3',
        Feet = 'Beck. Pigaches +3',
    },
	
	Dt = {
		Main = 'Nirvana',
		Sub = 'Elan Strap +1',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Beckoner\'s Horn +3',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Bunzi\'s Robe',
        Hands = 'Bunzi\'s Gloves',
        Ring1 = 'Murky Ring',
        Ring2 = 'Gurebu\'s Ring',
        Back = 'Campestres\'s Cape',
        Waist = 'Carrier\'s Sash',
        Legs = 'Beck. Spats +3',
        Feet = 'Beck. Pigaches +3',
	},
    Pet_Dt = {
        Main = 'Nirvana',
        Sub = 'Elan Strap +1',
        Ammo = 'Sancus Sachet +1',
        Head = 'Convoker\'s Horn +3',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Lugalbanda Earring',
        Ear2 = 'Enmerkar Earring',
        Body = 'Glyphic Doublet +3',
        Hands = 'Convo. Bracers +3',
        Ring1 = 'Varar Ring +1',
        Ring2 = 'C. Palug Ring',
        Back = 'Campestres\'s Cape',
        Waist = 'Klouskap Sash +1',
        Legs = 'Convo. Spats +3',
        Feet = 'Convo. Pigaches +3',
	},
	
	Tp_Default = {
		Main = 'Nirvana',
		Sub = 'Elan Strap +1',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Beckoner\'s Horn +3',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Bunzi\'s Robe',
        Hands = 'Bunzi\'s Gloves',
        Ring1 = 'Murky Ring',
        Ring2 = 'Gurebu\'s Ring',
        Back = 'Campestres\'s Cape',
        Waist = 'Carrier\'s Sash',
        Legs = 'Beck. Spats +3',
        Feet = 'Beck. Pigaches +3',
    },
	Tp_Hybrid = {
		Main = 'Nirvana',
		Sub = 'Elan Strap +1',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Beckoner\'s Horn +3',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Bunzi\'s Robe',
        Hands = 'Bunzi\'s Gloves',
        Ring1 = 'Murky Ring',
        Ring2 = 'Gurebu\'s Ring',
        Back = 'Campestres\'s Cape',
        Waist = 'Carrier\'s Sash',
        Legs = 'Beck. Spats +3',
        Feet = 'Beck. Pigaches +3',
    },
	Tp_Acc = {
		Main = 'Nirvana',
		Sub = 'Elan Strap +1',
        Ammo = 'Staunch Tathlum +1',
        Head = 'Beckoner\'s Horn +3',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Bunzi\'s Robe',
        Hands = 'Bunzi\'s Gloves',
        Ring1 = 'Murky Ring',
        Ring2 = 'Gurebu\'s Ring',
        Back = 'Campestres\'s Cape',
        Waist = 'Carrier\'s Sash',
        Legs = 'Beck. Spats +3',
        Feet = 'Beck. Pigaches +3',
    },
    Pet_Only_Tp = {
        Main = 'Nirvana',
        Sub = 'Elan Strap +1',
        Ammo = 'Sancus Sachet +1',
        Head = 'Convoker\'s Horn +3',
        Neck = 'Shulmanu Collar',
        Ear1 = 'Lugalbanda Earring',
        Ear2 = 'Enmerkar Earring',
        Body = 'Glyphic Doublet +3',
        Hands = 'Convo. Bracers +3',
        Ring1 = 'Varar Ring +1',
        Ring2 = 'C. Palug Ring',
        Back = 'Campestres\'s Cape',
        Waist = 'Klouskap Sash +1',
        Legs = 'Convo. Spats +3',
        Feet = 'Convo. Pigaches +3',
    },

    Precast = {
        Ammo = 'Sapience Orb',
        Head = 'Merlinic Hood',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Malignance Earring',
        Body = 'Inyanga Jubbah +2',
		Hands = 'Merlinic Dastanas',
        Ring1 = 'Prolix Ring',
        Ring2 = 'Kishar Ring',
        Waist = 'Witful Belt',
		Back = 'Campestres\'s Cape',
		Legs = 'Merlinic Shalwar',
        Feet = 'Merlinic Crackows',
    },
    Cure_Precast = {
        Ear1 = 'Mendi. Earring',
        Feet = 'Vanya Clogs',
    },
    Enhancing_Precast = {
        Waist = 'Siegel Sash',
    },
    Stoneskin_Precast = {
        Head = 'Umuthi Hat',
        Waist = 'Siegel Sash',
    },

    Cure = {--I cap is 50, II cap is 30
        Main = 'Bunzi\'s Rod',--I 30
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Neck = 'Nodens Gorget',--I 5
        Ear1 = 'Mendi. Earring',--I 5
        Ear2 = 'Regal Earring',
        Hands = 'Telchine Gloves',--I 9
        Ring1 = 'Stikini Ring +1',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',--I 7
        Waist = 'Rumination Sash',
        Feet = { Name = 'Medium\'s Sabots', Augment = { [1] = 'MND+6', [2] = '"Conserve MP"+5', [3] = 'MP+40', [4] = '"Cure" potency +3%' } },
    },
    Regen = {
        Main = 'Bolelabunga',
        Sub = 'Ammurapi Shield',
        Body = 'Telchine Chas.',
        Waist = 'Embla Sash',
        Legs = 'Telchine Braconi',
        Feet = 'Telchine Pigaches',
    },
    Cursna = {
		Neck = 'Debilis Medallion',
		Ear1 = 'Healing Earring',
		Ear2 = 'Beatific Earring',
        Ring1 = 'Haoma\'s Ring',
		Ring2 = 'Haoma\'s Ring',
		Waist = 'Bishop\'s Sash',
		Back = 'Tempered Cape +1',
        Feet = 'Vanya Clogs',
    },

    Enhancing = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Befouled Crown',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Mendi. Earring',
        Ear2 = 'Andoaa Earring',
        Ring1 = 'Stikini Ring +1',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Waist = 'Embla Sash',
        Legs = 'Telchine Braconi',
        Feet = 'Telchine Pigaches',
    },
    Stoneskin = {
        Neck = 'Nodens Gorget',
        Waist = 'Siegel Sash',
    },
    Refresh = {
		Waist = 'Gishdubar Sash',
    },

    SIR = {
        Ammo = 'Staunch Tathlum +1',
        Neck = 'Loricate Torque +1',--5
        Hands = 'Amalric Gages +1',--11
        Waist = 'Rumination Sash',--10
        Feet = 'Amalric Nails +1',--16
    },

    Drain = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Neck = 'Erra Pendant',
        Ear1 = 'Regal Earring',
        Ear2 = 'Malignance Earring',
        Ring1 = 'Kishar Ring',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = { Name = 'Aurist\'s Cape +1', AugPath='A' },
        Waist = 'Fucho-no-Obi',
        Legs = 'Nyame Flanchard',
        Feet = 'Amalric Nails +1',
    },

	Ws_Default = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Pixie Hairpin +1',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Friomisi Earring',
        Ear2 = 'Crematio Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Shiva Ring +1',
        Ring2 = 'Karieyh Ring +1',
        Waist = 'Eschan Stone',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },
	
    BP = {--I/II cap at 15, the rest need 680 skill total
		Weapon = 'Espiritus',
        Ammo = 'Elan Strap +1',
        Head = 'Beckoner\'s Horn +3',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'C. Palug Earring',
        Ear2 = 'Lodurr Earring',
        Body = 'Baayami Robe +1',
        Hands = 'Baayami Cuffs +1',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Evoker\'s Ring',
		Waist = 'Kobo Obi',
        Back = 'Conveyance Cape',--II 3
		Legs = 'Baayami Slops +1',
		Feet = 'Baaya. Sabots +1',
    },
    Siphon = {
		Weapon = 'Chatoyant Staff',
        Ammo = 'Elan Strap +1',
        Head = 'Baayami Hat +1',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'C. Palug Earring',
        Ear2 = 'Lodurr Earring',
        Body = 'Baayami Robe +1',
        Hands = 'Baayami Cuffs +1',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Evoker\'s Ring',
		Waist = 'Kobo Obi',
        Back = 'Conveyance Cape',
        Legs = 'Baayami Slops +1',
        Feet = 'Beck. Pigaches +3',
    },

	SmnPhysical = {
        Main = 'Nirvana',
        Sub = 'Elan Strap +1',
        Ammo = 'Sancus Sachet +1',
        Head ='Apogee Crown +1',
        Neck = 'Smn. Collar +2',
        Ear1 = 'Lugalbanda Earring',
        Ear2 = 'Kyrene\'s Earring',
        Body = 'Con. Doublet +3',
		Hands = 'Convo. Bracers +3',
        Ring1 = 'Varar Ring +1',
        Ring2 = 'Varar Ring +1',
        Waist = 'Incarnation Sash',
		Back = 'Campestres\'s Cape',
        Legs = 'Apogee Slacks +1',
        Feet = 'Convo. Pigaches +3',
    },
	SmnMagical = {
        Main = 'Nirvana',
        Sub = 'Elan Strap +1',
        Ammo = 'Epitaph',
        Head = 'Beckoner\'s Horn +3',
        Neck = 'Smn. Collar +2',
        Ear1 = 'Enmerkar Earring',
        Ear2 = 'Beck. Earring +1',
        Body = 'Beck. Doublet +2',
        Hands = 'Lamassu Mitts +1',
        Ring1 = 'C. Palug Ring',
        Ring2 = 'Evoker\'s Ring',
        Back = 'Campestres\'s Cape',
        Waist = 'Regal Belt',
        Legs = 'Convo. Spats +3',
        Feet = 'Beck. Pigaches +3',
    },
	SmnSkill = {
		Weapon = 'Espiritus',
        Ammo = 'Elan Strap +1',
        Head = 'Beckoner\'s Horn +3',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'C. Palug Earring',
        Ear2 = 'Lodurr Earring',
        Body = 'Baayami Robe +1',
        Hands = 'Baayami Cuffs +1',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Evoker\'s Ring',
		Waist = 'Kobo Obi',
        Back = 'Conveyance Cape',--II 3
		Legs = 'Baayami Slops +1',
		Feet = 'Baaya. Sabots +1',
    },
    SmnAttributes = {--mostly for Wind's Blessing'
		Weapon = 'Espiritus',
        Ammo = 'Elan Strap +1',
        Head = 'Beckoner\'s Horn +3',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'C. Palug Earring',
        Ear2 = 'Lodurr Earring',
        Body = 'Baayami Robe +1',
        Hands = 'Baayami Cuffs +1',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Evoker\'s Ring',
		Waist = 'Kobo Obi',
        Back = 'Conveyance Cape',--II 3
		Legs = 'Baayami Slops +1',
		Feet = 'Baaya. Sabots +1',
    },
    SmnHealing = {--avatar HP+
		Weapon = 'Espiritus',
        Ammo = 'Elan Strap +1',
        Head = 'Beckoner\'s Horn +3',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'C. Palug Earring',
        Ear2 = 'Lodurr Earring',
        Body = 'Baayami Robe +1',
        Hands = 'Baayami Cuffs +1',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Evoker\'s Ring',
		Waist = 'Kobo Obi',
        Back = 'Conveyance Cape',--II 3
		Legs = 'Baayami Slops +1',
		Feet = 'Baaya. Sabots +1',
    },
	SmnEnfeebling = {
        Main = 'Nirvana',
        Sub = 'Elan Strap +1',
        Ammo = 'Sancus Sachet +1',
        Head = 'Convoker\'s Horn +3',
        Neck = 'Adad Amulet',
        Ear1 = 'Lugalbanda Earring',
        Ear2 = 'Gelos Earring',
        Body = 'Con. Doublet +3',
        Hands = 'Lamassu Mitts +1',
        Ring1 = 'Evoker\'s Ring',
        Ring2 = 'C. Palug Ring',
        Back = 'Campestres\'s Cape',
        Waist = 'Regal Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Convo. Pigaches +3',
    },
    SmnHybrid = {--special set for flamming crush and burning strike (for now)
        Main = 'Nirvana',
        Sub = 'Elan Strap +1',
        Ammo = 'Epitaph',
        Head ='C. Palug Crown',
        Neck = 'Smn. Collar +2',
        Ear1 = 'Lugalbanda Earring',
        Ear2 = 'Gelos Earring',
        Body = 'Apo. Dalmatica +1',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Varar Ring +1',
        Ring2 = 'Varar Ring +1',
        Back = 'Campestres\'s Cape',
        Waist = 'Regal Belt',
        Legs = 'Apogee Slacks +1',
        Feet = 'Apogee Pumps +1',
    },
	
    TH = {
		Head = 'Wh. Rarab Cap +1',
        Ammo = 'Per. Lucky Egg',
		Waist = 'Chaac Belt',
	},
	Movement = {
        Feet = 'Herald\'s Gaiters',
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

local function HandlePetAction(PetAction)
	if (gcinclude.SmnSkill:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnSkill);
        if PetAction.Name == 'Wind\'s Blessing' then
            gFunc.EquipSet(sets.SmnAttributes);
        end
	elseif (gcinclude.SmnMagical:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnMagical);
    elseif (gcinclude.SmnHybrid:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnHybrid);
	elseif (gcinclude.SmnHealing:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnHealing);
    elseif (gcinclude.SmnEnfeebling:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnEnfeebling);
    else
        gFunc.EquipSet(sets.SmnPhysical);
    end
end

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();
    gcinclude.settings.RegenGearHPP = 50;
    gcinclude.settings.RefreshGearMPP = 60;
    gcinclude.settings.PetDTGearHPP = 30;
    --[[ Set you job macro defaults here]]
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 6');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 6');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
	gcinclude.HandleCommands(args);
end

profile.HandleDefault = function()
    local pet = gData.GetPet();
	local petAction = gData.GetPetAction();
    if (petAction ~= nil) then
        HandlePetAction(petAction);
        return;
    end
	
	local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default);
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')) end
		if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
    elseif (pet ~= nil and pet.Status == 'Engaged') then
        gFunc.EquipSet(sets.Pet_Only_Tp);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
		gFunc.EquipSet(sets.Idle);
    end

    if (pet ~= nil) and (pet.Status == 'Idle') then
        gFunc.EquipSet(sets.Pet_Idle);
	end
	
	if (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
	end
	
	gcinclude.CheckDefault ();
    if (gcdisplay.GetToggle('DTset') == true) then
		gFunc.EquipSet(sets.Dt);
        if (pet ~= nil) then
            gFunc.EquipSet(sets.Pet_Dt);
		end
	end
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
    local ac = gData.GetBuffCount('Astral Conduit');
    if ac > 0 then return end

    if (ability.Name == 'Release') or (ability.Name == 'Avatar\'s Favor') or (ability.Name == 'Assault') or (ability.Name == 'Retreat') or (ability.Name == 'Apogee') then return end

    gFunc.EquipSet(sets.BP);

    if (ability.Name == 'Elemental Siphon') then
        gFunc.EquipSet(sets.Siphon);
    end

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
	local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast);

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing_Precast);

        if string.contains(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin_Precast);
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure_Precast);
    end

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();

    gFunc.EquipSet(sets.SIR);

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);

        if string.match(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin);
        elseif string.contains(spell.Name, 'Regen') then
            gFunc.EquipSet(sets.Regen);
        elseif string.contains(spell.Name, 'Refresh') then
            gFunc.EquipSet(sets.Refresh);
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
        if string.match(spell.Name, 'Cursna') then
            gFunc.EquipSet(sets.Cursna);
        end
    elseif (spell.Skill == 'Summoning Magic') then
        gFunc.EquipSet(sets.SIR);
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Drain);
    end
	if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
	if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
	local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end
    end
end

return profile;