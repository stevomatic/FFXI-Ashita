addon.name = 'jpmidnight';
addon.author = 'Kommissar';
addon.version = '1.1.0.0';
addon.desc = 'Buys Acheron Shields with Sparks and Prize Powder with Unity Accolades.';

require('common');
local struct = require('struct');

-- ============================================================
-- Item definitions
-- ============================================================

local ITEM_SHIELD = {Name = "Acheron Shield", Id = 12385, Cost = 2755, Option = 9, Index = 41, Stack = 1};
local ITEM_POWDER = {Name = "Prize Powder", Id = 5945, Cost = 10, Stack = 99};

-- Confirmed via packet capture (2026-08-07/08/16) across all four Accolades
-- vendors: buying Prize Powder is a 3-step exchange (pick from greeting ->
-- pick item -> confirm qty). The greeting-pick (10) and item-pick (387)
-- values are identical everywhere. The confirm-quantity value decomposes
-- cleanly and was verified exact against 6 independent quantities (1, 10,
-- 25, 50, 99, 500):
--   r  = qty mod 8
--   h2 = floor(qty / 8)
--   h1 = ((0x01 + r * 0x20) << 8) | 0x84
-- This lets a purchase of any size go through in a single 3-packet
-- transaction instead of chunking through repeated 99s.
local POWDER_START  = {h1 = 10,  h2 = 0};
local POWDER_SELECT = {h1 = 387, h2 = 0};

function powder_confirm_packet(qty)
    local r = qty % 8;
    local h2 = math.floor(qty / 8);
    local h1 = ((0x01 + r * 0x20) * 256) + 0x84;
    return h1, h2;
end

-- ============================================================
-- Vendor locations
-- ============================================================

-- All four Accolades vendor menu IDs below are confirmed via packet capture
-- (2026-08-07/08): Igsli, Teldro-Kesdrodo, Urbiolaine, and Nunaarl Bthtrogg.
valid_zones = {
    [230] = { -- Southern San d'Oria
        {npc = "Rolandienne", menu = 995,  type = "sparks"},
        {npc = "Urbiolaine",  menu = 3529, type = "accolades"}, -- confirmed 2026-08-08
    },
    [235] = { -- Bastok Markets
        {npc = "Isakoth", menu = 26,  type = "sparks"},
        {npc = "Igsli",   menu = 598, type = "accolades"}, -- confirmed 2026-08-07
    },
    [241] = { -- Windurst Woods
        {npc = "Fhelm Jobeizat",   menu = 850, type = "sparks"},
        {npc = "Teldro-Kesdrodo",  menu = 879, type = "accolades"}, -- confirmed 2026-08-08
    },
    [256] = { -- Western Adoulin
        {npc = "Eternal Flame",     menu = 5081, type = "sparks"},
        {npc = "Nunaarl Bthtrogg",  menu = 5149, type = "accolades"}, -- confirmed 2026-08-08
    },
};

-- ============================================================
-- State
-- ============================================================

pkt = {};
npc_name = "";
busy = false;
insideMenu = false;
currSparks = 0;
currAccolades = 0;
freeslots = 0;

local buyQueue = {};
local current_vendor_type = "sparks";
local buyTimer = 0;
local buyDelay = 0.65;
local pokeTime = 0;
local watchdogSeconds = 10;
local purchase_item = nil;
local pre_purchase_qty = 0;
local total_requested = 0;

-- ============================================================
-- Purchase loop
-- ============================================================

ashita.events.register('d3d_present', 'present_cb', function()
    -- Watchdog: if we poked the vendor but never got a menu-open response,
    -- don't stay stuck forever - reset automatically after a short wait.
    if (busy and not insideMenu and pokeTime > 0 and os.time() - pokeTime > watchdogSeconds) then
        print("\30\68[jpmidnight] No response from vendor menu, resetting.");
        reset_me();
        return;
    end;

    if (buyQueue and #buyQueue > 0 and busy and pkt and pkt['Target'] and insideMenu) then
        if (os.time() >= (buyTimer + buyDelay)) then
            buyTimer = os.time();

            local current_buy = buyQueue[1];

            if current_vendor_type == "accolades" then
                -- One confirmed step of the 3-step exchange (greeting pick /
                -- item pick / quantity confirm) per queue entry.
                local step_packet = struct.pack('bbbbihhhbbhh', 0x05B, 0x05, 0x00, 0x00, pkt['Target'], current_buy.h1, current_buy.h2, pkt['Target Index'], 1, 0, pkt['Zone'], pkt['Menu ID']):totable();
                AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, step_packet);
            else
                -- Sparks purchase packet (single unit)
                local packet = struct.pack('bbbbihhhbbhh', 0x05B, 0x05, 0x00, 0x00, pkt['Target'], pkt['Option Index'], pkt['_unknown1'], pkt['Target Index'], 1, 0, pkt['Zone'], pkt['Menu ID']):totable();
                AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, packet);
            end;

            table.remove(buyQueue, 1);

            if (#buyQueue == 0) then
                -- Finished buying - close the menu safely
                local close_packet = struct.pack('bbbbihhhbbhh', 0x05B, 0x05, 0x00, 0x00, pkt['Target'], 0, 16384, pkt['Target Index'], 0, 0, pkt['Zone'], pkt['Menu ID']):totable();
                AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, close_packet);

                local exit_packet = struct.pack('bbbbhh', 0x016, 0x02, 0x00, 0x00, GetPlayerEntity().TargetIndex, 0):totable();
                AshitaCore:GetPacketManager():AddOutgoingPacket(0x016, exit_packet);

                busy = false;
                pkt = {};
                insideMenu = false;
                pokeTime = 0;

                if purchase_item then
                    -- Give the client a moment to actually process the
                    -- item-grant packet before trusting an inventory read -
                    -- checking immediately here raced ahead of it and
                    -- produced false "rejected" reports on real successes.
                    local check_item = purchase_item;
                    local check_pre = pre_purchase_qty;
                    local check_total = total_requested;
                    purchase_item = nil;

                    ashita.tasks.once(2, function()
                        local post_qty = count_item_qty(check_item.Id);
                        local obtained = post_qty - check_pre;

                        if obtained >= check_total then
                            print(string.format("\30\110[jpmidnight] Purchase complete: obtained %d x %s.", obtained, check_item.Name));
                        elseif obtained > 0 then
                            print(string.format("\30\68[jpmidnight] Only obtained %d of %d requested %s (vendor stopped granting more - daily limit or other cap likely reached).", obtained, check_total, check_item.Name));
                        else
                            print(string.format("\30\68[jpmidnight] Obtained 0 of %d requested %s - purchase was rejected (daily limit or other cap likely reached).", check_total, check_item.Name));
                        end;
                    end);
                else
                    print("\30\110[jpmidnight] Purchase complete.");
                end;
            end;
        end
    end;
end);

-- ============================================================
-- Commands
-- ============================================================

ashita.events.register('command', 'command_cb', function(e)
    local args = e.command:args();
    if (#args < 2 or (args[1] ~= '/jpmidnight' and args[1] ~= '/jp')) then
        return;
    end;

    e.blocked = true;
    local command = args[2];

    if command == 'shield' then
        buy_item(ITEM_SHIELD, "sparks");
    elseif command == 'powder' then
        buy_item(ITEM_POWDER, "accolades");
    elseif command == 'cancel' or command == 'reset' then
        reset_me();
    else
        print("\30\110[jpmidnight] Commands: /jpmidnight shield | /jpmidnight powder | /jpmidnight cancel (or /jp)");
    end;
end);

-- ============================================================
-- Core logic
-- ============================================================

function buy_item(item, vendor_type)
    if busy then
        print("\30\68[jpmidnight] Still buying last item");
        return;
    end;

    local currentzone = AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0);
    if not valid_zones[currentzone] then
        print("\30\68[jpmidnight] You are not currently in a zone with a supported NPC");
        return;
    end;

    count_inv();

    -- Request a currency refresh so we buy against real Sparks/Accolades totals
    local currpacket = struct.pack('bbbb', 0x0F, 0x03, 0x00, 0x00):totable();
    AshitaCore:GetPacketManager():AddOutgoingPacket(0x10F, currpacket);

    ashita.tasks.once(2, function() start_buy_run(item, vendor_type) end);
end

function start_buy_run(item, vendor_type)
    local stack_size = item.Stack or 1;

    -- Reserve 1 empty inventory slot as a safety buffer
    local usable_slots = math.max(0, freeslots - 1);
    if usable_slots <= 0 then
        print(string.format("\30\68[jpmidnight] Inventory full or reserved (Free: %d).", freeslots));
        return;
    end;

    local currency = (vendor_type == "sparks") and currSparks or currAccolades;
    print(string.format("\30\110[jpmidnight] Currency check: %d %s available.", currency, (vendor_type == "sparks") and "Sparks" or "Accolades"));
    local max_affordable = math.floor(currency / item.Cost);
    local max_carriable = usable_slots * stack_size;

    local total;
    if currency > 0 then
        total = math.min(max_affordable, max_carriable);
    else
        total = max_carriable;
    end;

    if total <= 0 then
        print(string.format("\30\68[jpmidnight] Cannot afford any %s or no inventory space.", item.Name));
        return;
    end;

    pkt = validate(vendor_type, item);
    if not pkt then
        return;
    end;

    current_vendor_type = vendor_type;
    buyQueue = {};

    if vendor_type == "accolades" then
        -- The NPC's own prompt caps requests at 7920; clamp defensively.
        local qty = math.min(total, 7920);
        local confirm_h1, confirm_h2 = powder_confirm_packet(qty);

        table.insert(buyQueue, {h1 = POWDER_START.h1,  h2 = POWDER_START.h2});
        table.insert(buyQueue, {h1 = POWDER_SELECT.h1, h2 = POWDER_SELECT.h2});
        table.insert(buyQueue, {h1 = confirm_h1, h2 = confirm_h2});
    else
        for i = 1, total do
            table.insert(buyQueue, {count = 1});
        end;
    end;

    print(string.format("\30\110[jpmidnight] Purchasing %d x %s.", total, item.Name));

    purchase_item = item;
    pre_purchase_qty = count_item_qty(item.Id);
    total_requested = total;

    busy = true;
    pokeTime = os.time();
    poke_npc(pkt['Target'], pkt['Target Index']);
end

function validate(vendor_type, item)
    local zone = AshitaCore:GetMemoryManager():GetParty():GetMemberZone(0);
    local zone_vendors = valid_zones[zone];
    if not zone_vendors then
        print("\30\68[jpmidnight] Not in a zone with a supported NPC");
        return nil;
    end;

    local vendor_def;
    for _, v in ipairs(zone_vendors) do
        if v.type == vendor_type then
            vendor_def = v;
            break;
        end;
    end;
    if not vendor_def then
        print(string.format("\30\68[jpmidnight] No %s vendor known for this zone", vendor_type));
        return nil;
    end;

    local target_index, target_id, distance;
    for x = 0, 2303 do
        local e = GetEntity(x);
        if (e ~= nil and e.WarpPointer ~= 0 and e.Name == vendor_def.npc) then
            target_index = e.TargetIndex;
            target_id = e.ServerId;
            npc_name = e.Name;
            distance = e.Distance;
            break;
        end;
    end;

    if not distance then
        print(string.format("\30\68[jpmidnight] Can't find %s nearby", vendor_def.npc));
        return nil;
    end;

    if math.sqrt(distance) >= 15 then
        print(string.format("\30\68[jpmidnight] Too far from %s", vendor_def.npc));
        return nil;
    end;

    return {
        Target = target_id,
        ['Option Index'] = item.Option,
        _unknown1 = item.Index,
        ['Target Index'] = target_index,
        Zone = zone,
        ['Menu ID'] = vendor_def.menu,
    };
end

function reset_me()
    if pkt and pkt['Target'] then
        local packet = struct.pack('bbbbihhhbbhh', 0x05B, 0x05, 0x00, 0x00, pkt['Target'], 0, 16384, pkt['Target Index'], 0, 0, pkt['Zone'], pkt['Menu ID']):totable();
        AshitaCore:GetPacketManager():AddOutgoingPacket(0x05B, packet);
    end;

    local exit_packet = struct.pack('bbbbhh', 0x016, 0x02, 0x00, 0x00, GetPlayerEntity().TargetIndex, 0):totable();
    AshitaCore:GetPacketManager():AddOutgoingPacket(0x016, exit_packet);

    busy = false;
    insideMenu = false;
    buyQueue = {};
    pkt = {};
    pokeTime = 0;

    if purchase_item then
        local check_item = purchase_item;
        local check_pre = pre_purchase_qty;
        local check_total = total_requested;
        purchase_item = nil;

        print("\30\110[jpmidnight] State reset and menu force closed.");
        ashita.tasks.once(2, function()
            local post_qty = count_item_qty(check_item.Id);
            local obtained = post_qty - check_pre;
            print(string.format("\30\110[jpmidnight] Obtained %d of %d requested %s before reset.", obtained, check_total, check_item.Name));
        end);
    else
        print("\30\110[jpmidnight] State reset and menu force closed.");
    end;
end;

function count_inv()
    local playerinv = AshitaCore:GetMemoryManager():GetInventory();
    local uinv = 0;
    local max_slots = math.min(playerinv:GetContainerCountMax(0), 80);

    for i = 0, max_slots - 1 do
        local item = playerinv:GetContainerItem(0, i);
        if (item ~= nil and item.Id ~= 0) then
            uinv = uinv + 1;
        end
    end
    freeslots = max_slots - uinv;
    print(string.format("\30\110[jpmidnight] Main Inventory: %d/%d used (%d free slots)", uinv, max_slots, freeslots));
end

function count_item_qty(item_id)
    local playerinv = AshitaCore:GetMemoryManager():GetInventory();
    local max_slots = math.min(playerinv:GetContainerCountMax(0), 80);
    local qty = 0;

    for i = 0, max_slots - 1 do
        local it = playerinv:GetContainerItem(0, i);
        if (it ~= nil and it.Id == item_id) then
            qty = qty + it.Count;
        end;
    end;
    return qty;
end

function poke_npc(npc, target_index)
    if npc and target_index then
        local pokeNpcPacket = struct.pack('bbbbihhhhfff', 0x01A, 0x07, 0, 0, npc, target_index, 0, 0, 0, 0, 0, 0):totable();
        AshitaCore:GetPacketManager():AddOutgoingPacket(0x01A, pokeNpcPacket);
    end;
end

-- ============================================================
-- Packet handling
-- ============================================================

ashita.events.register('packet_in', 'packet_in_cb', function(e)
    if e.id == 0x032 or e.id == 0x034 then
        if busy == true and pkt and pkt['Target'] then
            insideMenu = true;
            e.blocked = true;
        end;
    elseif e.id == 0x113 then
        -- Sparks (0x74) unchanged - never reported broken. Accolades offset
        -- confirmed via packet capture 2026-08-09: 0x78 was reading an
        -- unrelated field (always returned 86 regardless of real balance).
        -- 0xE4 matches the real, live Accolades total exactly.
        currSparks = struct.unpack('I', e.data, 0x74 + 1);
        currAccolades = struct.unpack('I', e.data, 0xE4 + 1);
    end;
end);
