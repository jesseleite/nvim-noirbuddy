local Group = require('colorbuddy').Group
local colors = require('colorbuddy').colors

  -- Telescope colors
  Group.new('TelescopeTitle', colors.gray_2)
Group.new('TelescopeBorder', colors.gray_7)
Group.new('TelescopeResultsNormal', colors.gray_5)
Group.new('TelescopeMatching', colors.white)
Group.new('TelescopePromptCounter', colors.gray_8, nil)
