local Group = require('colorbuddy').Group
local colors = require('colorbuddy').colors

Group.new('CmpItemKind', colors.noir_6)

-- Custom highlight group, for use in opt-in window config below
Group.new('CmpDocumentation', nil, colors.noir_9)

local M = {}

-- The default winhighlight config is based off NormalFloat, which is intended to
-- match `color.background`. However, it's difficult to read documentation over
-- top of the code window, so we provide a custom winhighlight override here.
M.window = {
  documentation = {
    winhighlight = 'FloatBorder:CmpDocumentation,NormalFloat:CmpDocumentation',
  },
}

return M
