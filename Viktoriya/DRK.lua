local profile = {};
local sets = {
-- handledefault --
    Idle = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Sakpata\'s Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Sakpata\'s Plate',
        Hands = 'Sakpata\'s Gauntlets',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Murky Ring',
        Back = { Name = 'Ankou\'s Mantle', Augment = { [1] = '"Dbl.Atk."+10', [2] = 'Accuracy+30', [3] = 'Mag. Evasion+15', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Carrier\'s Sash',
        Legs = 'Sakpata\'s Cuisses',
        Feet = 'Sakpata\'s Leggings',
    },
    Resting = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Sakpata\'s Helm',
        Neck = 'Bathy Choker +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Sakpata\'s Plate',
        Hands = 'Sakpata\'s Gauntlets',
        Ring1 = 'Chirich Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = { Name = 'Ankou\'s Mantle', Augment = { [1] = '"Dbl.Atk."+10', [2] = 'Accuracy+30', [3] = 'Mag. Evasion+15', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Carrier\'s Sash',
        Legs = 'Sakpata\'s Cuisses',
        Feet = 'Sakpata\'s Leggings',
    },
    Tp = {
        Ammo = 'Coiste Bodhar',
        Head = 'Sakpata\'s Helm',
        Neck = 'Abyssal Beads +2',
        Ear1 = 'Cessance Earring',
        Ear2 = 'Schere Earring',
        Body = 'Sakpata\'s Plate',
        Hands = 'Sakpata\'s Gauntlets',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Niqmaddu Ring',
        Back = { Name = 'Ankou\'s Mantle', Augment = { [1] = '"Dbl.Atk."+10', [2] = 'Accuracy+30', [3] = 'Mag. Evasion+15', [4] = 'Attack+20', [5] = 'DEX+20' } },
        Waist = 'Sailfi Belt +1',
        Legs = 'Ig. Flanchard +4',
        Feet = 'Sakpata\'s Leggings',
    },
-- handleprecast --
    Precast = {
        Ammo = 'Sapience Orb',        --  2 --
        Head = 'Carmine Mask +1',     -- 14 --
        Neck = 'Voltsurge Torque',    --  4 --
        Ear1 = 'Malignance Earring',  --  4 --
        Ear2 = 'Loquac. Earring',     --  4 --
        Body = 'Fall. Cuirass +1',    -- 10 --
        Hands = 'Odyssean Gauntlets', --  6 leyline possible 5+3 sinister reign --
        Ring1 = 'Kishar Ring',        --  4 --
        Ring2 = 'Rahab Ring',         --  2 -- 
        Back = 'Ankou\'s Mantle',     -- 10 --
        Legs = 'Odyssean Cuisses',    --  6 --
        Feet = 'Odyssean Greaves',    -- 11 5+6 Fern 78% 80 with leyline --
    },
-- handle midcast --
    Dreadspikes = {
        Main = 'Displaced',
        Sub = 'Displaced',
        Ammo = 'Happy Egg',
        Head = 'Ratri Sallet +1',
        Neck = 'Unmoving Collar +1',
        Ear1 = 'Tuisto Earring',
        Ear2 = 'Odnowa Earring +1',
        Body = 'Heath. Cuirass +1',
        Hands = 'Rat. Gadlings +1',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Gelatinous Ring +1',
        Back = 'Moonlight Cape',
        Waist = 'Plat. Mog. Belt',
        Legs = 'Ratri Cuisses +1',
        Feet = 'Rat. Sollerets +1',
    },
    Absorb = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Ig. Burgeonet +3',
        Neck = 'Erra Pendant',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Digni. Earring',
        Body = 'Carm. Sc. Mail +1',
        Hands = 'Fall. Fin. Gaunt. +1',
        Ring1 = 'Kishar Ring',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Chironic Hose',
        Legs = 'Fall. Flanchard +4',
        Feet = 'Rat. Sollerets +1',
    },
    DarkMagic = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Fall. Burgeonet +1',
        Neck = 'Erra Pendant',
        Ear1 = 'Nehalennia Earring',
        Ear2 = 'Hirudinea Earring',
        Body = 'Carm. Sc. Mail +1', -- any path C --
        Hands = 'Fall. Fin. Gaunt. +1',
        Ring1 = 'Evanescence Ring',
        Ring2 = 'Archon Ring',
        Back = 'Niht Mantle', -- drk +10 --
        Waist = 'Austerity Belt +1',
        Legs = 'Heath. Flanchard +1',
        Feet = 'Rat. Sollerets +1',
    },
    Elemental = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Nyame Helm',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Friomisi Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Shiva Ring +1',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Ankou\'s Mantle',
        Waist = 'Eschan Stone',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Endark = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Fall. Burgeonet +1',
        Neck = 'Erra Pendant',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Dark Earring',
        Body = 'Carm. Sc. Mail +1',
        Hands = 'Fall. Fin. Gaunt. +1',
        Ring1 = 'Evanescence Ring',
        Ring2 = 'Stikini Ring +1',
        Back = 'Niht Mantle',
        Legs = 'Heath. Flanchard +1',
        Feet = 'Rat. Sollerets +1',
    },
    Enfeebling = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Carmine Mask +1',
        Neck = 'Erra Pendant',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Digni. Earring',
        Body = 'Ig. Cuirass +4',
        Hands = 'Leyline Gloves',
        Ring1 = 'Kishar Ring',
        Ring2 = 'Stikini Ring +1',
        Back = 'Ankou\'s Mantle',
        Waist = 'Austerity Belt +1',
        Feet = 'Heath. Sollerets +3',
    },
-- handlejobability --
    BloodWeapon = {
        Body = 'Fall. Cuirass +1',
    },
    ArcaneCircle = {
        Feet = 'Igno. Sollerets +1',
    },
    LastResort = {
        Back = 'Ankou\'s Mantle', -- activation --
        Feet = 'Fall. Sollerets +3', -- buff duration id#64 --
    },
    WeaponBash = {
        Hands = 'Ig. Gauntlets +2',
    },
    Souleater = {
        Head = 'Ig. Burgeonet +3',
    },
    DarkSeal = {
        Head = 'Fall. Burgeonet +1',
    },
    DiabolicEye = {
        Hands = 'Fall. Fin. Gaunt. +1',
    },
    NetherVoid = {
        Legs = 'Heath. Flanchard +1',
    },
-- handleweaponskill --
    Torcleaver = {
        Main = 'Caladbolg',
        Sub = 'Utu Grip',
        Ammo = 'Knobkierrie',
        Head = 'Heath. Bur. +3',
        Neck = 'Abyssal Beads +2',
        Ear1 = 'Thrud Earring',
        Ear2 = 'Heathen\'s Earring',
        Body = 'Ig. Cuirass +4',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Niqmaddu Ring',
        Back = 'Ankou\'s Mantle',
        Waist = 'Sailfi Belt +1',
        Legs = 'Fall. Flanchard +4',
        Feet = 'Heath. Sollerets +3',
    },
    SavageBlade = {
        Main = 'Naegling',
        Sub = 'Blurred Shield +1',
        Ammo = 'Knobkierrie',
        Head = 'Nyame Helm',
        Neck = 'Abyssal Beads +2',
        Ear1 = 'Thrud Earring',
        Ear2 = 'Ishvara Earring',
        Body = 'Ig. Cuirass +4',
        Hands = 'Sakpata\'s Gauntlets',
        Ring1 = 'Epaminondas\'s Ring',
        Ring2 = 'Niqmaddu Ring',
        Back = 'Ankou\'s Mantle',
        Waist = 'Sailfi Belt +1',
        Legs = 'Sakpata\'s Cuisses',
        Feet = 'Heath. Sollerets +3',
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
    { Name = 'Instant Reraise', Quantity = 'all' },
    { Name = 'Hi-Reraiser', Quantity = 'all' },
    { Name = 'Coconut Rusk', Quantity = 'all' },
    { Name = 'Tropical Crepe', Quantity = 'all' },
    { Name = 'Mars Orb', Quantity = 'all' },
    { Name = 'Venus Orb', Quantity = 'all' },
    { Name = 'Miso Ramen', Quantity = 'all' },
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
        gFunc.EquipSet(sets.Tp);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        gFunc.EquipSet(sets.Idle);
    end

    -- Keeps duration feet on throughout Last Resort buff lifecycle (Buff ID 64)
    if (gData.GetBuffCount('Last Resort') > 0 or gData.GetBuffCount(64) > 0) then
        gFunc.Equip('Feet', 'Fall. Sollerets +3');
    end
end

profile.HandleAbility = function()
    local action = gData.GetAction();
    -- Strips spaces from Job Ability name to match key sets (e.g., Blood Weapon -> BloodWeapon)
    local abilitySet = action.Name:gsub('%s+', '');
    
    if (sets[abilitySet]) then
        gFunc.EquipSet(sets[abilitySet]);
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.Precast);
end

profile.HandleMidcast = function()
    local action = gData.GetAction();
    
    if (action.Name == 'Dread Spikes') then
        gFunc.EquipSet(sets.Dreadspikes);
    elseif (action.Name:match('^Absorb%-')) then
        gFunc.EquipSet(sets.Absorb);
    elseif (action.Name:match('^Drain') or action.Name:match('^Aspir') or action.Name:match('^Bio')) then
        gFunc.EquipSet(sets.DarkMagic);
    elseif (action.Name:match('^Endark')) then
        gFunc.EquipSet(sets.Endark);
    elseif (action.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Elemental);
    elseif (action.Skill == 'Enfeebling Magic' or action.Name == 'Tractor' or action.Name == 'Stun' or action.Name:match('^Poison') or action.Name:match('^Sleep') or action.Name == 'Bind' or action.Name == 'Break') then
        gFunc.EquipSet(sets.Enfeebling);
    else
        gFunc.EquipSet(sets.DarkMagic);
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    local wsSet = action.Name:gsub('%s+', '');
    
    if (sets[wsSet]) then
        gFunc.EquipSet(sets[wsSet]);
    else
        -- Fallback to Torcleaver set if specific WS set isn't defined
        gFunc.EquipSet(sets.Torcleaver);
    end
end

return profile;