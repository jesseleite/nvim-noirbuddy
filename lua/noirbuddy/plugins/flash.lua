local Group = require('colorbuddy').Group
local groups = require('colorbuddy').groups

Group.link('FlashBackdrop', groups.Comment)
Group.link('FlashMatch', groups.Search)
Group.link('FlashCurrent', groups.IncSearch)
Group.link('FlashLabel', groups.NoirbuddyTextOnPrimary)
-- Group.link('FlashPrompt', groups.MsgArea) -- TODO: Figure out where this is used?
Group.link('FlashPromptIcon', groups.Special)
Group.link('FlashCursor', groups.Cursor)
