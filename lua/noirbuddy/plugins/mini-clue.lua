local cb = require('colorbuddy')

local Group = cb.Group
local colors = cb.colors
local groups = cb.groups

Group.new('MiniClueNextKey', colors.primary)
-- Group.new('MiniClueNextKeyWithPostkeys', colors.secondary) --- What's this?
Group.new('MiniClueSeparator', colors.noir_8)
Group.new('MiniClueDescGroup', colors.secondary)
Group.new('MiniClueDescSingle', colors.noir_3)

Group.link('MiniClueTitle', groups.FloatTitle)
Group.link('MiniClueBorder', groups.FloatBorder)
