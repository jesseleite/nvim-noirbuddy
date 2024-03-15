local cb = require('colorbuddy')

local Group = cb.Group
local colors = cb.colors

-- highlight reference:
-- https://github.com/glepnir/lspsaga.nvim/blob/main/lua/lspsaga/highlight.lua

-- general
Group.new('TitleString', colors.secondary)
Group.new('TitleSymbol', colors.primary)
Group.new('TitleIcon', colors.primary)
Group.new('SagaBorder', colors.noir_7)
Group.new('SagaNormal', nil, colors.background)
Group.new('SagaExpand', colors.diff_delete)
Group.new('SagaCollapse', colors.diff_delete)
Group.new('SagaBeacon', colors.primary)
-- code action
Group.new('ActionPreviewTitle', colors.primary)
Group.new('CodeActionText', colors.secondary)
Group.new('CodeActionConceal', colors.diff_add)
-- finder
Group.new('FinderSelection', colors.primary)
Group.new('FinderFileName', colors.noir_5)
Group.new('FinderIcon', colors.secondary)
Group.new('FinderType', colors.secondary)
Group.new('FinderCount', colors.secondary, colors.background)
-- finder spinner
Group.new('FinderSpinnerTitle', colors.primary)
Group.new('FinderSpinner', colors.primary)
Group.new('FinderVirtText', colors.noir_7)
-- hover
Group.new('HoverNormal', colors.primary, colors.background)
-- rename
Group.new('RenameNormal', colors.primary, colors.background)
-- diagnostic
Group.new('DiagnosticSource', colors.primary)
Group.new('DiagnosticPos', colors.noir_7)
Group.new('DiagnosticWord', colors.secondary)
-- call heirarchy
Group.new('CallHierarchyIcon', colors.primary)
Group.new('CallHierarchyTitle', colors.secondary)
-- outline
Group.new('OutlineIndent', colors.noir_7)
-- terminal
Group.new('TerminalNormal', colors.secondary, colors.background)
