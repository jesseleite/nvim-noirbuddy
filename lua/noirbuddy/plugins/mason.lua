local cb = require('colorbuddy')

local Group = cb.Group
local colors = cb.colors

-- highlight reference:
-- https://github.com/williamboman/mason.nvim/blob/main/lua/mason/ui/colors.lua

-- general
Group.new('MasonNormal', colors.secondary, colors.nb_background)
Group.new('MasonHeader', colors.primary, colors.noir_9)
Group.new('MasonHeaderSecondary', colors.secondary)

Group.new('MasonHighlight', colors.primary)
Group.new('MasonHighlightBlock', colors.primary)
Group.new('MasonHighlightBlockBold', colors.secondary, colors.noir_9)

Group.new('MasonHighlightSecondary', colors.primary)
Group.new('MasonHighlightBlockSecondary', colors.primary)
Group.new('MasonHighlightBlockBoldSecondary', colors.secondary, colors.noir_9) -- Selection current

Group.new('MasonMuted', colors.noir_5)
Group.new('MasonMutedBlock', colors.noir_5)
Group.new('MasonMutedBlockBold', colors.noir_5)

Group.new('MasonError', colors.diff_delete)
