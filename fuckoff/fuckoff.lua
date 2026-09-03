--[[
 * Ashita - Copyright (c) 2020 Ashita Development Team
 * Contact: https://www.ashitaxi.com/
 * Contact: https://discord.gg/Ashita
 *
 * This file is part of Ashita.
 *
 * Ashita is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Ashita is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Ashita.  If not, see <https://www.gnu.org/licenses/>.
]]--

addon.author  = 'atom0s (Ported from Chiaia version.)v4 port Kommissar';
addon.name    = 'fuckoff';
addon.version = '1.2';
addon.desc    = 'Blocks selected player names and chat messages.';
addon.link    = 'https://ashitaxi.com/';

require 'common';

----------------------------------------------------------------------------------------------------
-- Variables
----------------------------------------------------------------------------------------------------
local blacklist = {};

-- List of player names to block..
blacklist.names = T{
    'SomeBotName1',
    'SomeBotName2',
    'SomeBotName3',
};

-- List of words / Lua patterns to block..
blacklist.words = {
    string.char(0x81, 0x99), -- '☆'
    string.char(0x81, 0x9A), -- '★'
    '1%-99',
    'Job Point.*2100',
    'Job Point.*500',
    'JP.*2100',
    'JP.*500',
    'Capacity Point.*2100',
    'Capacity Point.*500',
    'CP.*2100',
    'CP.*500',
    'Job Points',
    'master',
};

-- List of chat modes to check..
blacklist.modes = T{
    1, 3, 26
};

---------------------------------------------------------------------------------------------------
-- func: packet_in
-- desc: Event called when the addon is asked to handle an incoming packet.
---------------------------------------------------------------------------------------------------
ashita.events.register('packet_in', 'packet_in_cb', function (e)
    -- Do not process packets already blocked by another addon..
    if (e.blocked) then
        return;
    end

    -- Packet: Chat
    if (e.id ~= 0x0017) then
        return;
    end

    -- Use the modified packet so earlier packet handlers can be respected.
    local data = e.data_modified;

    -- Extract the sender name..
    local name = struct.unpack('c15', data, 0x08 + 1):trim('\0');

    -- Extract the chat message size from the packet..
    local idSize = struct.unpack('H', data, 0x00 + 1);
    local msgSize = (4 * bit.rshift(idSize, 9)) - 0x18;

    if (msgSize > 150) then
        msgSize = 150;
    end

    -- Skip empty messages..
    if (msgSize <= 0) then
        return;
    end

    -- Extract and clean the message.
    local msg = struct.unpack(string.format('c%d', msgSize), data, 0x17 + 1):trim('\0');
    local cleaned = AshitaCore:GetChatManager():ParseAutoTranslate(msg, false):lower();

    -- Check for blocked names..
    if (blacklist.names:hasval(name) or blacklist.names:hasval(name:lower())) then
        e.blocked = true;
        return;
    end

    -- Check for blocked words in selected chat modes..
    local mode = struct.unpack('b', data, 0x04 + 1);

    if (blacklist.modes:hasval(mode)) then
        for _, pattern in ipairs(blacklist.words) do
            -- Ashita v4 no longer exposes the old ashita.regex helper.
            -- These blacklist expressions are Lua patterns, so string.find
            -- provides the equivalent matching needed here.
            if string.find(cleaned, pattern:lower()) ~= nil then
                e.blocked = true;
                return;
            end
        end
    end
end);
