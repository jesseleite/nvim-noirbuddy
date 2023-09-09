local Group = require('colorbuddy').Group
local colors = require('colorbuddy').colors

Group.new('OilDir', colors.noir_0)
Group.new('OilFile', colors.noir_4)
Group.new('OilLink', colors.primary)
Group.new('OilCopy', colors.diff_add)
Group.new('OilCreate', colors.diff_add)
Group.new('OilChange', colors.diff_change)
Group.new('OilMove', colors.diff_change)
Group.new('OilDelete', colors.diff_delete)
