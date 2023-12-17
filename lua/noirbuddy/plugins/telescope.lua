local Group = require('colorbuddy').Group
local colors = require('colorbuddy').colors
local groups = require('colorbuddy').groups

-- Telescope colors
Group.new('TelescopeTitle', colors.noir_2)
Group.new('TelescopeResultsNormal', colors.noir_5)
Group.new('TelescopeMatching', colors.noir_0)
Group.new('TelescopePromptCounter', colors.noir_8, nil)

-- Link groups
Group.link('TelescopeBorder', groups.FloatBorder)
