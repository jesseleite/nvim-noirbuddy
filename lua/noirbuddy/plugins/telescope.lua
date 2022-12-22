local Group = require('colorbuddy').Group
local colors = require('colorbuddy').colors

-- Telescope colors
Group.new('TelescopeTitle', colors.noir_2)
Group.new('TelescopeBorder', colors.noir_7)
Group.new('TelescopeResultsNormal', colors.noir_5)
Group.new('TelescopeMatching', colors.white)
Group.new('TelescopePromptCounter', colors.noir_8, nil)
