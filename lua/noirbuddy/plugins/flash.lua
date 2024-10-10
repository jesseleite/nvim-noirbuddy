local Group = require('colorbuddy').Group
local groups = require('colorbuddy').groups
local colors = require('colorbuddy').colors

Group.link('FlashBackdrop', groups.Comment)
Group.link('FlashMatch', groups.Search)
Group.link('FlashCurrent', groups.IncSearch)
-- Group.link('FlashPrompt', groups.MsgArea) -- TODO: Figure out where this is used?
Group.link('FlashPromptIcon', groups.Special)
Group.link('FlashCursor', groups.Cursor)

-- This one has been carefully balanced to stand out brighter against `Search` and `IncSearch` groups,
-- while not being too bright to avoid visually conflicting with flash's default f/F/t/T highlights.
-- Whether you're using flash's jump mode, `/` search with jump enabled, or f/F/t/T, you need
-- to be able to differentiate where the active cursor is against other matches. We also
-- want to avoid using primary & secondary bg colors against black & white fg text.
Group.new('FlashLabel', colors.noir_0, colors.noir_7)
