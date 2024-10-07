local cb = require('colorbuddy')

local Group = cb.Group
local colors = cb.colors
local styles = cb.styles

Group.new('MiniStatuslineModeNormal', colors.noir_2, colors.noir_7)
Group.new('MiniStatuslineModeInsert', colors.background, colors.primary, styles.bold)
Group.new('MiniStatuslineModeVisual', colors.background, colors.secondary, styles.bold)
Group.new('MiniStatuslineModeReplace', colors.background, colors.primary, styles.bold)
Group.new('MiniStatuslineModeCommand', colors.noir_2, colors.noir_8, styles.bold)
Group.new('MiniStatuslineModeOther', colors.noir_2, colors.noir_8, styles.bold)

Group.new('MiniStatuslineDevinfo', colors.noir_3, colors.noir_8)
Group.new('MiniStatuslineFilename', colors.noir_3, colors.noir_9)
Group.new('MiniStatuslineFileinfo', colors.noir_3, colors.noir_9)

Group.new('MiniStatuslineInactive', nil, colors.noir_9)
