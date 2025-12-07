--[[
DropInvis
Automatically removes invisible status when attempting to use commands while invisible.
Copyright (c) 2025 Seekey
https://github.com/seekey13/DropInvis

This addon is designed for Ashita v4.
]]

addon.name      = 'DropInvis';
addon.author    = 'Seekey';
addon.version   = '0.1';
addon.desc      = 'Automatically removes invisible status when blocked by invisibility';
addon.link      = 'https://github.com/seekey13/DropInvis';

require('common');

-- Event: Incoming text (chat messages)
ashita.events.register('text_in', 'text_in_cb', function (e)
    -- Check if the message contains the invisibility block message
    if string.find(e.message, 'You cannot use that command while invisible.') then
        -- Issue the command to remove invisible buff (buff ID 69)
        AshitaCore:GetChatManager():QueueCommand(1, '/debuff 69');
    end
end);