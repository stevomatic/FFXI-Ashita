local profile = {};
local sets = {
    Idle = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Nyame Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Murky Ring',
        Back = 'Artio\'s Mantle',
        Waist = 'Engraved Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Resting = {
        Ammo = 'Staunch Tathlum +1',
        Head = 'Nyame Helm',
        Neck = 'Warder\'s Charm +1',
        Ear1 = 'Eabani Earring',
        Ear2 = 'Hearty Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Murky Ring',
        Back = 'Artio\'s Mantle',
        Waist = 'Engraved Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Tp = {
        Ammo = 'Coiste Bodhar',
        Head = 'Gleti\'s Mask',
        Neck = 'Bst. Collar +2',
        Ear1 = 'Dedition Earring',
        Ear2 = 'Sherida Earring',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Emi. Gauntlets +1', -- path d --
        Ring1 = 'Moonlight Ring',
        Ring2 = 'Epona\'s Ring',
        Back = 'Artio\'s Mantle', -- dex acc stp --
        Waist = 'Sailfi Belt +1',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Gleti\'s Boots',
    },
    PetTp = { -- hybrid set; equipped whenever PetMode toggle is set to PetTp, regardless of Idle/Engaged status
        Ammo = 'Hesperiidae',
        Head = 'Tali\'ah Turban +2',
        Neck = 'Bst. Collar +2',
        Ear1 = 'Domes. Earring',
        Ear2 = 'Enmerkar Earring',
        Body = 'An. Jackcoat +3',
        Hands = 'Emi. Gauntlets +1', -- path d --
        Ring1 = 'Varar Ring +1',
        Ring2 = 'Varar Ring +1',
        Back = 'Artio\'s Mantle', -- pet acc30att20 haste10 eva/meva pet:dt  --
        Waist = 'Incarnation Sash',
        Legs = 'Ankusa Trousers +3',
        Feet = 'Tot. Gaiter\'s +3',
    },
    Precast = {
        Ammo = 'Sapience Orb',
        Head = 'Taeon Chapeau',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Enchntr. Earring +1',
        Body = 'Sacro Breastplate',
        Hands = 'Leyline Gloves',
        Ring1 = 'Prolix Ring',
        Ring2 = 'Rahab Ring',
        Back = 'Artio\'s Mantle', -- +10 --
        Waist = 'Moblin Cest',
        Legs = 'Taeon Tights',
        Feet = 'Taeon Boots',
    },
    -- cure/self cure healing magic --
    Cure = {
        Ammo = '',
        Head = '',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Enchntr. Earring +1',
        Body = '',
        Hands = '',
        Ring1 = 'Prolix Ring',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    -- curing waltz jobability from dancer subjob --
    CuringWaltz = {
        Ammo = '',
        Head = '',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Enchntr. Earring +1',
        Body = '',
        Hands = '',
        Ring1 = 'Prolix Ring',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    -- stoneskin midcast enhancing magic --
    Stoneskin = {
        Ammo = '',
        Head = '',
        Neck = 'Voltsurge Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Enchntr. Earring +1',
        Body = '',
        Hands = '',
        Ring1 = 'Prolix Ring',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    -- jobability --
    CallBeast = {
        Head = 'Acro Helm', -- call beast delay --
        Body = 'Acro Surcoat', -- call beast delay --
        Hands = 'Ankusa Gloves +3',
        Legs = 'Acro Breeches', -- cbd --
        Feet = 'Acro Leggins', -- cbd --
    },
    BestialLoyalty = {
        Head = 'Acro Helm', -- call beast delay --
        Body = 'Acro Surcoat', -- call beast delay --
        Hands = 'Ankusa Gloves +3',
        Legs = 'Acro Breeches', -- cbd --
        Feet = 'Acro Leggins', -- cbd --
    },
    Reward = {
        Ammo = 'Pet Food Theta',
        Head = 'Stout Bonnet',
        Neck = 'Aife\'s Medal',
        Ear1 = 'Lifestorm Earring',
        Ear2 = 'Hoxne Earring',
        Body = 'Tot. Jackcoat +3',
        Hands = 'Malignance Gloves',
        Ring1 = 'Levia. Ring +1',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Artio\'s Mantle', -- MND +30 --
        Legs = 'Ankusa Trousers +3',
        Feet = 'Ankusa Gaiters +3',
    },
    FeralHowl = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Nuk. Cabbaset +2',
        Neck = 'Null Loop',
        Ear1 = 'Digni. Earring',
        Ear2 = 'Crep. Earring',
        Body = 'An. Jackcoat +3',
        Hands = 'Nukumi Manoplas +2',
        Ring1 = 'Stikini Ring +1',
        Ring2 = 'Stikini Ring +1',
        Back = 'Null Shawl',
        Waist = 'Null Belt',
        Legs = 'Nukumi Quijotes +2',
        Feet = 'Nukumi Ocreae +2',
    },
    Familiar = {
        Legs = 'Ankusa Trousers +3',
    },
    Charm = {
        Ammo = 'Voluspa Tathlum',
        Head = 'Totemic Helm +3',
        Neck = 'Unmoving Collar +1',
        Ear1 = 'Enchntr. Earring',
        Ear2 = 'Enchntr. Earring +1',
        Body = 'An. Jackcoat +3',
        Hands = 'Ankusa Gloves +3',
        Ring1 = 'Carb. Ring +1',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Artio\'s Mantle', -- CHR macc --
        Waist = 'Aristo Belt',
        Legs = 'Ankusa Trousers +3',
        Feet = 'Ankusa Gaiters +3',
    },
    Tame = {
        Head = 'Totemic Helm +3',
    },
    KillerInstinct = {
        Head = 'Ankusa Helm +3',
    },
    Sic = {
        --Main Aymur--
        Hands = 'Nukumi Manoplas +2',
        Legs = 'Gleti\'s Breeches',
    },
    Spur = {
        Feet = 'Nukumi Ocreae +2',
    },
    -- Ready sets Physical Multi Magical --
    Physical = {
        Ammo = 'Hesperiidae',
        Head = 'Gleti\'s Mask',
        Neck = 'Bst. Collar +2',
        Ear1 = 'Enmerkar Earring',
        Ear2 = 'Nukumi Earring +1',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Nukumi Manoplas +2',
        Ring1 = 'C. Palug Ring',
        Ring2 = 'Varar Ring +1',
        Back = 'Artio\'s Mantle', -- pet acc30att20 --
        Waist = 'Klouskap Sash +1',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Gleti\'s Boots',
    },
    Multi = {
        Ammo = 'Hesperiidae',
        Head = 'Emicho Coronet +1',
        Neck = 'Bst. Collar +2',
        Ear1 = 'Sroda Earring',
        Ear2 = 'Nukumi Earring +1',
        Body = 'Valorous Mail', -- Fern Pet:DA STR ATT --
        Hands = 'Nukumi Manoplas +2',
        Ring1 = 'C. Palug Ring',
        Ring2 = 'Varar Ring +1',
        Back = 'Artio\'s Mantle', -- pet acc30att20 --
        Waist = 'Incarnation Sash',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Gleti\'s Boots',
    },
    Magical = {
        Ammo = 'Hesperiidae',
        Head = 'Valorous Mask', -- pet: int mab --
        Neck = 'Adad Amulet',
        Ear1 = 'Hija Earring',
        Ear2 = 'Nukumi Earring +1',
        Body = 'Udug Jacket',
        Hands = 'Nukumi Manoplas +2',
        Ring1 = 'C. Palug Ring',
        Ring2 = 'Tali\'ah Ring',
        Back = 'Argocham. Mantle',
        Waist = 'Incarnation Sash',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Valorous Greaves', -- pet int mab --
    },
    -- weaponskills --
    Rampage = {
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
    Mistral = {
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
    Decimation = {
        Ammo = 'Coiste Bodhar',
        Head = 'Gleti\'s Mask',
        Neck = 'Bst. Collar +2',
        Ear1 = 'Sroda Earring',
        Ear2 = 'Nukumi Earring +1',
        Body = 'Gleti\'s Cuirass',
        Hands = 'Gleti\'s Gauntlets',
        Ring1 = 'Sroda Ring',
        Ring2 = 'Cornelia\'s Ring',
        Back = 'Artio\'s Mantle',
        Waist = 'Fotia Belt',
        Legs = 'Gleti\'s Breeches',
        Feet = 'Nukumi Ocreae +2',
    },
    Ruinator = {
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
    Onslaught = {
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
    Primal = {
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
    Cloudsplitter = {
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
    Blitz = {
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
    Calamity = {
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
    Bora = {
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
    Savage = {
        Main = 'Naegling',
        Sub = 'Thorfinn Shield +1',
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
};
profile.Sets = sets;

profile.Packer = {
    {Name = 'Silver Voucher', Quantity = 'all'},
    {Name = 'Panacea', Quantity = 'all'},
    {Name = 'Prism Powder', Quantity = 'all'},
    {Name = 'Silent Oil', Quantity = 'all'},
    {Name = 'Holy Water', Quantity = 'all'},
    {Name = 'Echo Drops', Quantity = 'all'},
    {Name = 'Warp Ring', Quantity = 'all'},
    {Name = 'Dim. Ring (Dem)', Quantity = 'all'},
    {Name = 'Copper Voucher', Quantity = 'all'},
    {Name = 'Befouled Water', Quantity = 'all'},
    {Name = 'Instant Warp', Quantity = 'all'},
    {Name = 'Adapa Shield', Quantity = 'all'},
    {Name = 'Dolichenus', Quantity = 'all'},
    {Name = 'Pet Food Theta', Quantity = 'all'},
    {Name = 'Spicy Broth', Quantity = 'all'},
};

-- ==========================================================================
-- State variables
-- ==========================================================================

-- PetMode toggle: Tp = standard melee split (Idle/Engaged), PetTp = hybrid
-- pet-support set that overrides Idle/Engaged while active.
local PetModeOrder = {[1] = 'Tp', [2] = 'PetTp'};
local Settings = {
    PetMode = 1,
    JugId = 0,
    JugName = nil,
};

-- Ready move classification. Multi is checked before Physical since all six
-- Multi moves also belong to the broader physical-attack pool.
local MultiMoves = T{'Sweeping Gouge', 'Tickling Tendrils', 'Chomp Rush', 'Pentapeck', 'Wing Slap', 'Pecking Flurry'};

local PhysicalMoves = T{'Foot Kick', 'Whirl Claws', 'Big Scissors', 'Tail Blow', 'Blockhead', 'Sensilla Blades',
    'Tegmina Buffet', 'Lamb Chop', 'Sheep Charge', 'Recoil Dive', 'Frogkick', 'Queasyshroom', 'Numbshroom',
    'Shakeshroom', 'Nimble Snap', 'Cyclotail', 'Somersault', 'Grapple', 'Double Claw', 'Spinning Top',
    'Suction', 'Tortoise Stomp', 'Power Attack', 'Rhino Attack', 'Razor Fang', 'Claw Cyclone', 'Crossthrash',
    'Scythe Tail', 'Ripper Fang', 'Sickle Slash', 'Mandibular Bite', 'Beak Lunge', 'Head Butt', 'Wild Oats',
    'Needle Shot', 'Disembowel', 'Extirpating Salvo', 'Mega Scissors', 'Back Heel', 'Hoof Volley',
    'Fluid Toss', 'Fluid Spread'};

local MagicalMoves = T{'Gloom Spray', 'Fireball', 'Acid Spray', 'Molting Plumage', 'Cursed Sphere', 'Nectarous Deluge',
    'Charged Whisker', 'Nepenthic Plunge', 'Toxic Spit', 'Leaf Dagger', 'Venom Spray', 'Venom', 'Dark Spore',
    'Sandblast', 'Dust Cloud', 'Stink Bomb', 'Slug Family', 'Intimidate', 'Gloeosuccus', 'Spider Web',
    'Filamented Hold', 'Choke Breath', 'Blaster', 'Snow Cloud', 'Roar', 'Palsy Pollen', 'Spore', 'Brain Crush',
    'Silence Gas', 'Chaotic Eye', 'Sheep Song', 'Soporific', 'Predatory Glare', 'Sudden Lunge', 'Numbing Noise',
    'Jettatura', 'Bubble Shower', 'Spoil', 'Scream', 'Noisome Powder', 'Acid Mist', 'Rhinowrecker',
    'Swooping Frenzy', 'Venom Shower', 'Corrosive Ooze', 'Spiral Spin', 'Infrasonics', 'Hi-Freq Field',
    'Purulent Ooze', 'Foul Waters', 'Sandpit', 'Infected Leech', 'Pestilent Plume'};

-- ==========================================================================
-- Jug persistence
-- ==========================================================================

-- Resolves an item ID to its Broth name across all Name language indices.
-- Returns the resolved name string, or nil if the ID isn't a valid jug item.
local function ResolveJugName(id)
    local item = AshitaCore:GetResourceManager():GetItemById(id);
    if (item == nil) then
        return nil;
    end
    for i = 0, 2 do
        if (item.Name[i] ~= nil) and (item.Name[i]:len() > 0) and (item.Name[i]:find('Broth') ~= nil) then
            return item.Name[i];
        end
    end
    return nil;
end

local JugSaveFile = string.format('%s\\config\\addons\\luashitacast\\bst_jug.txt', AshitaCore:GetInstallPath());

local function SaveJugId()
    local f = io.open(JugSaveFile, 'w');
    if (f ~= nil) then
        f:write(tostring(Settings.JugId));
        f:close();
    end
end

local function LoadJugId()
    local f = io.open(JugSaveFile, 'r');
    if (f == nil) then
        return;
    end
    local contents = f:read('*all');
    f:close();
    local id = tonumber(contents);
    if (id == nil) or (id <= 0) then
        return;
    end
    local resolvedName = ResolveJugName(id);
    if (resolvedName ~= nil) then
        Settings.JugId = id;
        Settings.JugName = resolvedName;
        gFunc.Message('Jug restored: ' .. resolvedName .. ' (' .. id .. ')');
    end
end

-- ==========================================================================
-- Lifecycle
-- ==========================================================================

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 008');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 008');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /petmode /lac fwd petmode');
    AshitaCore:GetChatManager():QueueCommand(1, '/bind F5 /petmode');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias /jug /lac fwd jug');
    LoadJugId();
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/unbind F5');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias del /petmode');
    AshitaCore:GetChatManager():QueueCommand(1, '/alias del /jug');
end

-- ==========================================================================
-- Commands
-- ==========================================================================

profile.HandleCommand = function(args)
    if (args[1] == 'petmode') then
        Settings.PetMode = Settings.PetMode + 1;
        if (Settings.PetMode > #PetModeOrder) then
            Settings.PetMode = 1;
        end
        gFunc.Message('Pet Mode: ' .. PetModeOrder[Settings.PetMode]);
    elseif (args[1] == 'jug') then
        if (#args > 1) then
            local id = tonumber(args[2]);
            if (id ~= nil) then
                local resolvedName = ResolveJugName(id);
                if (resolvedName ~= nil) then
                    Settings.JugId = id;
                    Settings.JugName = resolvedName;
                    gFunc.Message('Jug set: ' .. Settings.JugName .. ' (' .. id .. ')');
                    SaveJugId();
                else
                    gFunc.Message('Invalid jug ID: ' .. args[2]);
                end
            end
        end
    elseif (args[1] == 'jugdebug') then
        if (#args > 1) then
            local id = tonumber(args[2]);
            if (id ~= nil) then
                local item = AshitaCore:GetResourceManager():GetItemById(id);
                if (item == nil) then
                    gFunc.Message('No item found for ID: ' .. args[2]);
                else
                    for i = 0, 2 do
                        local n = item.Name[i];
                        gFunc.Message('Name[' .. i .. '] = ' .. (n ~= nil and ('"' .. n .. '"') or 'nil'));
                    end
                end
            end
        end
    end
end

-- ==========================================================================
-- Default (idle / engaged / resting)
-- ==========================================================================

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    local mode = PetModeOrder[Settings.PetMode];

    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (mode == 'PetTp') then
        gFunc.EquipSet(sets.PetTp);
    elseif (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp);
    else
        gFunc.EquipSet(sets.Idle);
    end
end

-- ==========================================================================
-- Job abilities (Call Beast, Bestial Loyalty, Ready moves, etc.)
-- ==========================================================================

profile.HandleAbility = function()
    local action = gData.GetAction();

    if (action.Name == 'Call Beast') then
        gFunc.EquipSet(sets.CallBeast);
        if (Settings.JugName ~= nil) then
            gFunc.Equip('Ammo', Settings.JugName);
        end
    elseif (action.Name == 'Bestial Loyalty') then
        gFunc.EquipSet(sets.BestialLoyalty);
        if (Settings.JugName ~= nil) then
            gFunc.Equip('Ammo', Settings.JugName);
        end
    elseif (action.Name == 'Reward') then
        gFunc.EquipSet(sets.Reward);
    elseif (action.Name == 'Familiar') then
        gFunc.EquipSet(sets.Familiar);
    elseif (action.Name == 'Charm') then
        gFunc.EquipSet(sets.Charm);
    elseif (action.Name == 'Tame') then
        gFunc.EquipSet(sets.Tame);
    elseif (action.Name == 'Killer Instinct') then
        gFunc.EquipSet(sets.KillerInstinct);
    elseif (action.Name == 'Sic') then
        gFunc.EquipSet(sets.Sic);
    elseif (action.Name == 'Spur') then
        gFunc.EquipSet(sets.Spur);
    elseif (action.Name == 'Feral Howl') then
        gFunc.EquipSet(sets.FeralHowl);
    elseif (action.Name:find('Curing Waltz') ~= nil) then
        gFunc.EquipSet(sets.CuringWaltz);
    elseif (MultiMoves:contains(action.Name)) then
        gFunc.EquipSet(sets.Multi);
    elseif (PhysicalMoves:contains(action.Name)) then
        gFunc.EquipSet(sets.Physical);
    elseif (MagicalMoves:contains(action.Name)) then
        gFunc.EquipSet(sets.Magical);
    end
end

profile.HandleItem = function()
end

-- ==========================================================================
-- Spellcasting (Cure, Stoneskin, etc.)
-- ==========================================================================

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.Precast);
end

profile.HandleMidcast = function()
    local action = gData.GetAction();

    if (action.Name == 'Stoneskin') then
        gFunc.EquipSet(sets.Stoneskin);
    elseif (action.Name:find('Cure') ~= nil) then
        gFunc.EquipSet(sets.Cure);
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

-- ==========================================================================
-- Weaponskills
-- ==========================================================================

profile.HandleWeaponskill = function()
    local action = gData.GetAction();

    if (action.Name == 'Rampage') then
        gFunc.EquipSet(sets.Rampage);
    elseif (action.Name == 'Mistral Axe') then
        gFunc.EquipSet(sets.Mistral);
    elseif (action.Name == 'Decimation') then
        gFunc.EquipSet(sets.Decimation);
    elseif (action.Name == 'Ruinator') then
        gFunc.EquipSet(sets.Ruinator);
    elseif (action.Name == 'Onslaught') then
        gFunc.EquipSet(sets.Onslaught);
    elseif (action.Name == 'Primal Rend') then
        gFunc.EquipSet(sets.Primal);
    elseif (action.Name == 'Cloudsplitter') then
        gFunc.EquipSet(sets.Cloudsplitter);
    elseif (action.Name == 'Blitz') then
        gFunc.EquipSet(sets.Blitz);
    elseif (action.Name == 'Calamity') then
        gFunc.EquipSet(sets.Calamity);
    elseif (action.Name == 'Bora Axe') then
        gFunc.EquipSet(sets.Bora);
    elseif (action.Name == 'Savage Blade') then
        gFunc.EquipSet(sets.Savage);
    end
end

return profile;
