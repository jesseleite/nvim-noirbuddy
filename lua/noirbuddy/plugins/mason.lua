local cb = require('colorbuddy')

local Group = cb.Group
local groups = cb.groups
local colors = cb.colors

-- highlight reference:
-- https://github.com/williamboman/mason.nvim/blob/main/lua/mason/ui/colors.lua

-- general
Group.link('MasonNormal', groups.Normal)

Group.new('MasonHeader', colors.secondary, colors.noir_9)
Group.new('MasonHeaderSecondary', colors.secondary)

Group.new('MasonHighlight', colors.primary)
Group.new('MasonHighlightBlock', colors.primary)
Group.new('MasonHighlightBlockBold', colors.secondary, colors.noir_9)

Group.new('MasonHighlightSecondary', colors.primary)
Group.new('MasonHighlightBlockSecondary', colors.primary)
Group.new('MasonHighlightBlockBoldSecondary', colors.secondary, colors.noir_9)

Group.new('MasonMuted', colors.noir_5)
Group.new('MasonMutedBlock', colors.noir_5)
Group.new('MasonMutedBlockBold', colors.noir_5)

Group.new('MasonError', colors.diff_delete)
