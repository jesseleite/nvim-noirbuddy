local Group = require('colorbuddy').Group
local colors = require('colorbuddy').colors
local styles = require('colorbuddy').styles

local parseStyleOpts = function(opts)
  return {
    italic = vim.tbl_get(opts, 'styles', 'italic') and styles.italic or styles.NONE,
    bold = vim.tbl_get(opts, 'styles', 'bold') and styles.bold or styles.NONE,
    underline = vim.tbl_get(opts, 'styles', 'underline') and styles.underline or styles.NONE,
    undercurl = vim.tbl_get(opts, 'styles', 'undercurl') and styles.undercurl or styles.NONE,
  }
end

-- We need this function because we can't do styles.NONE + styles.NONE (we need to ensure it's only added once)
local sumStyles = function(values)
  local sum = styles.NONE;

  for _, value in ipairs(values) do
    if value ~= styles.NONE then
      sum = sum + value
    end
  end

  return sum
end

local M = {}

function M.setup(opts)
  opts = opts or {}

  local s = parseStyleOpts(opts)

  -- Generic Highlighting
  Group.new('Normal', colors.gray_4, colors.nb_background)
  Group.new('Search', colors.black, colors.white)
  Group.new('IncSearch', colors.black, colors.white)
  Group.new('Visual', nil, colors.gray_8)
  Group.new('SignColumn', nil, colors.nb_background)
  Group.new('LineNr', colors.gray_8, colors.nb_background)
  Group.new("EndOfBuffer", colors.gray_8, nil)

  Group.new('Comment', colors.gray_7)
  Group.new('Constant', colors.primary)
  Group.new('Character', colors.gray_5)
  Group.new('Identifier', colors.white)
  Group.new('Statement', colors.gray_1)
  Group.new('PreProc', colors.primary)
  Group.new('Type', colors.secondary)
  Group.new('Special', colors.gray_5)
  Group.new('Error', colors.primary)
  Group.new('Todo', colors.primary, colors.gray_8)
  Group.new('Function', colors.primary)

  Group.new('ColorColumn', nil, colors.gray_8)
  Group.new('Conceal', colors.gray_7)
  Group.new('Cursor', colors.black)
  Group.new('CursorColumn', nil, colors.gray_9)
  Group.new('CursorLine', nil, colors.gray_9)
  Group.new('CursorLineNr', colors.gray_6, colors.gray_9)
  Group.new('Directory', colors.gray_3)
  Group.new('DiffAdd', colors.primary, colors.gray_8)
  Group.new('DiffChange', colors.white, colors.gray_8)
  Group.new('DiffDelete', colors.secondary, colors.gray_8)
  Group.new('DiffText', colors.white, colors.gray_7)
  Group.new('ErrorMsg', colors.gray_1, colors.primary)
  Group.new('VertSplit', colors.black, colors.gray_9)

  Group.new('Folded', colors.gray_5, colors.gray_8)
  Group.new('FoldColumn', colors.gray_5, colors.gray_8)
  Group.new('MatchParen', nil, colors.gray_7)
  Group.new('MoreMsg', colors.black, colors.gray_6)
  Group.new('NonText', colors.gray_8, colors.black)
  Group.new('Pmenu', colors.gray_2, colors.gray_8)
  Group.new('PmenuSel', colors.gray_6, colors.gray_8)
  Group.new('PmenuSbar', colors.primary, colors.gray_8)
  Group.new('PmenuThumb', colors.primary, colors.gray_7)
  Group.new('Question', colors.gray_1, colors.gray_8)
  Group.new('SpecialKey', colors.gray_6, colors.black)
  Group.new('SpellBad', colors.primary)
  Group.new('SpellCap', colors.white)
  Group.new('SpellLocal', colors.gray_5)
  Group.new('SpellRare', colors.primary)
  Group.new('StatusLine', colors.gray_5, colors.gray_8)
  Group.new('TabLine', colors.gray_3, colors.gray_8)
  Group.new('TabLineFill', nil, colors.gray_8)
  Group.new('TabLineSel', colors.gray_2, colors.black)
  Group.new('Title', colors.gray_3)
  Group.new('VisualNOS', colors.primary, colors.gray_8)
  Group.new('WarningMsg', colors.primary)
  Group.new('WildMenu', colors.gray_5, colors.gray_8)

  -- Treesitter Syntax Highlighting
  -- See :help treesitter-highlight-groups
  Group.new('@boolean', colors.primary)
  Group.new('@character', colors.secondary)
  Group.new('@character.special', colors.gray_2)
  Group.new('@comment', colors.gray_7)
  Group.new('@conditional', colors.gray_2)
  Group.new('@constant', colors.gray_2)
  Group.new('@constant.builtin', colors.gray_2)
  Group.new('@constant.macro', colors.gray_2)
  Group.new('@constructor', colors.gray_1)
  Group.new('@debug', colors.gray_2)
  Group.new('@define', colors.gray_2)
  Group.new('@exception', colors.gray_2)
  Group.new('@field', colors.gray_2)
  Group.new('@float', colors.gray_2)
  Group.new('@function', colors.white)
  Group.new('@function.builtin', colors.gray_2)
  Group.new('@function.call', colors.gray_2)
  Group.new('@function.macro', colors.primary)
  Group.new('@include', colors.gray_6)
  Group.new('@keyword', colors.gray_5)
  Group.new('@keyword.function', colors.gray_5)
  Group.new('@keyword.operator', colors.gray_6)
  Group.new('@keyword.return', colors.white)
  Group.new('@label', colors.gray_2)
  Group.new('@macro', colors.gray_2)
  Group.new('@method', colors.gray_1)
  Group.new('@method.call', colors.gray_2)
  Group.new('@namespace', colors.gray_2)
  Group.new('@none', colors.gray_3)
  Group.new('@number', colors.primary)
  Group.new('@operator', colors.gray_6)
  Group.new('@parameter', colors.gray_2)
  Group.new('@preproc', colors.gray_2)
  Group.new('@property', colors.gray_2)
  Group.new('@punctuation', colors.gray_2)
  Group.new('@punctuation.bracket', colors.gray_6)
  Group.new('@punctuation.delimiter', colors.gray_6)
  Group.new('@punctuation.special', colors.primary)
  Group.new('@repeat', colors.gray_2)
  Group.new('@storageclass', colors.gray_2)
  Group.new('@string', colors.primary)
  Group.new('@string.escape', colors.gray_2)
  Group.new('@string.special', colors.gray_2)
  Group.new('@structure', colors.gray_2)
  Group.new('@tag', colors.gray_6)
  Group.new('@tag.attribute', colors.gray_4)
  Group.new('@tag.delimiter', colors.gray_3)
  Group.new('@text.literal', colors.secondary)
  Group.new('@text.reference', colors.secondary)
  Group.new('@text.title', colors.gray_2)
  Group.new('@text.todo', colors.gray_2)
  Group.new('@text.underline', colors.gray_2)
  Group.new('@text.uri', colors.gray_2)
  Group.new('@type', colors.gray_2)
  Group.new('@type.builtin', colors.gray_6)
  Group.new('@type.definition', colors.gray_2)
  Group.new('@variable', colors.secondary)
  Group.new('@variable.builtin', colors.gray_2)

  -- Semantic Highlighting
  Group.new('DiagnosticError', colors.diagnostic_error, nil, sumStyles({ s.bold, s.italic, s.undercurl }))
  Group.new('DiagnosticWarn', colors.diagnostic_warning, nil, sumStyles({ s.bold, s.italic, s.undercurl }))
  Group.new('DiagnosticInfo', colors.diagnostic_info, nil, sumStyles({ s.bold, s.italic, s.undercurl }))
  Group.new('DiagnosticHint', colors.diagnostic_hint, nil, sumStyles({ s.bold, s.italic, s.undercurl }))
  Group.new('DiagnosticSignError', colors.diagnostic_error)
  Group.new('DiagnosticSignWarn', colors.diagnostic_warning)
  Group.new('DiagnosticSignInfo', colors.diagnostic_info)
  Group.new('DiagnosticSignHint', colors.diagnostic_hint)
  Group.new('DiffAdd', colors.diff_add)
  Group.new('DiffChange', colors.diff_change)
  Group.new('DiffDelete', colors.diff_delete)
end

return M
