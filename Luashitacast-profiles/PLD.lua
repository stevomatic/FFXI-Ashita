local profile = {};
local sets = {
    Idle = {
        Main = "Burtgang",
        Sub = "Aegis",
        Ammo = "Staunch Tathlum +1",
        Head = "Sakpata\'s Helm",
        Neck = "Warder's Charm +1",
        Ear1 = "Eabani Earring",
        Ear2 = "Sanare Earring",
        Body = "Sakpata\'s Plate",
        Hands = "Sakpata\'s Gauntlets",
        Ring1 = "Vengeful Ring",
        Ring2 = "Purity Ring",
        Back = "Rudianos's Mantle",
        Waist = "Plat. Mog. Belt",
        Legs = "Sakpata\'s Cuisses",
        Feet = "Sakpata\'s Leggings",
    },
    Resting = {
        Main = "Burtgang",
        Sub = "Aegis",
        Ammo = "Staunch Tathlum +1",
        Head = "Sakpata\'s Helm",
        Neck = "Warder's Charm +1",
        Ear1 = "Eabani Earring",
        Ear2 = "Sanare Earring",
        Body = "Sakpata\'s Plate",
        Hands = "Sakpata\'s Gauntlets",
        Ring1 = "Vengeful Ring",
        Ring2 = "Purity Ring",
        Back = "Rudianos's Mantle",
        Waist = "Plat. Mog. Belt",
        Legs = "Sakpata\'s Cuisses",
        Feet = "Sakpata\'s Leggings",
    },
    TP = {
        Ammo = "Staunch Tathlum +1",
        Head = "Sakpata\'s Helm",
        Neck = "Warder's Charm +1",
        Ear1 = "Eabani Earring",
        Ear2 = "Sanare Earring",
        Body = "Sakpata\'s Plate",
        Hands = "Sakpata\'s Gauntlets",
        Ring1 = "Vengeful Ring",
        Ring2 = "Purity Ring",
        Back = "Rudianos's Mantle",
        Waist = "Plat. Mog. Belt",
        Legs = "Sakpata\'s Cuisses",
        Feet = "Sakpata\'s Leggings",
    },
    Atonement = {
        Ammo = "Sapience Orb",
        Head = "Loess Barbuta +1",
        Neck = "Moonlight Necklace",
        Ear1 = "Cryptic Earring",
        Ear2 = "Trux Earring",
        Body = "Souv. Cuirass +1",
        Hands = "Yorium Gauntlets",
        Ring1 = "Apeile Ring +1",
        Ring2 = "Supershear Ring",
        Back = "Rudianos's Mantle",
        Waist = "Fotia belt",
        Legs = "Souv. Diechlings +1",
        Feet = "Eschite Greaves",
    },
    Savage = {
        Main = "",
        Sub = "",
        Ammo = "",
        Head = "",
        Neck = "",
        Ear1 = "",
        Ear2 = "",
        Body = "",
        Hands = "",
        Ring1 = "",
        Ring2 = "",
        Back = "",
        Waist = "",
        Legs = "",
        Feet = "",
    },
    Requiescat = {
        Main = "",
        Sub = "",
        Ammo = "",
        Head = "",
        Neck = "",
        Ear1 = "",
        Ear2 = "",
        Body = "",
        Hands = "",
        Ring1 = "",
        Ring2 = "",
        Back = "",
        Waist = "",
        Legs = "",
        Feet = "",
    },
    Precast = {
        Ammo = "Sapience Orb",
        Head = "Loess Barbuta +1",
        Neck = "Moonlight Necklace",
        Ear1 = "Cryptic Earring",
        Ear2 = "Trux Earring",
        Body = "Souv. Cuirass +1",
        Hands = "Yorium Gauntlets",
        Ring1 = "Apeile Ring +1",
        Ring2 = "Supershear Ring",
        Back = "Rudianos's Mantle",
        Waist = "Creed Baudrier",
        Legs = "Souv. Diechlings +1",
        Feet = "Eschite Greaves",
    },
    Enmity = {
        Ammo = "Sapience Orb",
        Head = "Loess Barbuta +1",
        Neck = "Moonlight Necklace",
        Ear1 = "Cryptic Earring",
        Ear2 = "Trux Earring",
        Body = "Souv. Cuirass +1",
        Hands = "Yorium Gauntlets",
        Ring1 = "Apeile Ring +1",
        Ring2 = "Supershear Ring",
        Back = "Rudianos's Mantle",
        Waist = "Creed Baudrier",
        Legs = "Souv. Diechlings +1",
        Feet = "Eschite Greaves",
    },
    Cure = {
        Ammo = "Staunch Tathlum +1",
        Head = "Souv. Schaller +1",
        Neck = "Moonlight Necklace",
        Ear1 = "Tuisto Earring",
        Ear2 = "Nourish. Earring +1",
        Body = "Souv. Cuirass +1",
        Hands = "Macabre Gaunt. +1",
        Ring1 = "Gelatinous Ring +1",
        Ring2 = "Eihwaz Ring",
        Back = "Rudianos's Mantle",
        Waist = "Audumbla Sash",
        Legs = "Founder's Hose",
        Feet = "Odyssean Greaves",
    },
    Phalanx = {
        Ammo = "Staunch Tathlum +1",
        Head = "Souv. Schaller +1",
        Neck = "Moonlight Necklace",
        Ear1 = "Tuisto Earring",
        Ear2 = "Nourish. Earring +1",
        Body = "Souv. Cuirass +1",
        Hands = "Macabre Gaunt. +1",
        Ring1 = "Gelatinous Ring +1",
        Ring2 = "Eihwaz Ring",
        Back = "Rudianos's Mantle",
        Waist = "Audumbla Sash",
        Legs = "Founder's Hose",
        Feet = "Odyssean Greaves",
    },
    Reprisal = {
        Ammo = "Staunch Tathlum +1",
        Head = "Souv. Schaller +1",
        Neck = "Moonlight Necklace",
        Ear1 = "Knightly Earring",
        Ear2 = "Nourish. Earring +1",
        Body = "Souv. Cuirass +1",
        Hands = "Macabre Gaunt. +1",
        Ring1 = "Gelatinous Ring +1",
        Ring2 = "Eihwaz Ring",
        Back = "Rudianos's Mantle",
        Waist = "Audumbla Sash",
        Legs = "Founder's Hose",
        Feet = "Odyssean Greaves",
    },
    Fealty = {
        Body = "Cab. Surcoat +3",
    },
    Chivalry = {
        Hands = "Cab. Gauntlets +3",
    },
    DivineEmblem = {
        Feet = "Chev. Sabatons +2",
    },
    Flash = {
        Ammo = "Staunch Tathlum +1",
        Head = "Souv. Schaller +1",
        Neck = "Moonlight Necklace",
        Ear1 = "Cryptic Earring",
        Ear2 = "Odnowa Earring +1",
        Body = "Rev. Surcoat +3",
        Hands = "Souv. Handsch. +1",
        Ring1 = "Apeile Ring +1",
        Ring2 = "Supershear Ring",
        Back = "Rudianos's Mantle",
        Waist = "Audumbla Sash",
        Legs = "Founder's Hose",
        Feet = "Odyssean Greaves",
    },
    Haste = { 
        Ammo = "Sapience Orb",
        Head = "Chev. Armet +2",
        Neck = "Voltsurge Torque",
        Ear1 = "Loquac. Earring",
        Ear2 = "Enchntr. Earring +1",
        Body = "Rev. Surcoat +3",
        Hands = "Leyline Gloves",
        Ring1 = "Kishar Ring",
        Ring2 = "Rahab Ring",
        Back = "Rudianos's Mantle",
        Waist = "Audumbla Sash",
        Legs = "Odyssean Cuisses",
        Feet = "Chev. Sabatons +2",
    },
    Movement = {
        Legs = "Carmine Cuisses +1",
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
    {Name = 'Duban', Quantity = 'all'},
};
profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 005');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 001');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 005');
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();

    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.TP);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        gFunc.EquipSet(sets.Idle);
    end

    if (player.IsMoving) then
        gFunc.EquipSet(sets.Movement);
    end
end

-- Base set for all job abilities is Enmity; expand later with per-ability overrides.
profile.HandleAbility = function()
    gFunc.EquipSet(sets.Enmity);
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.Precast);
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();

    if (string.match(spell.Name, 'Cure')) then
        gFunc.EquipSet(sets.Cure);
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

-- All weaponskills use Atonement for now; expand later per-WS if needed.
profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.Atonement);
end

return profile;