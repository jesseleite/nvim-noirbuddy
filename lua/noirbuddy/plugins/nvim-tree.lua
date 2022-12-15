local Group = require('colorbuddy').Group
local colors = require('colorbuddy').colors

Group.new('NvimTreeRootFolder', colors.gray_6)
Group.new('NvimTreeFolderIcon', colors.primary)
Group.new("NvimTreeIndentMarker", colors.gray_6)
Group.new("NvimTreeExecFile", colors.gray_6)
Group.new("NvimTreeSpecialFile", colors.gray_2, nil)
