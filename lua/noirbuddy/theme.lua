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

-- Dynamically determine best text color for a given background color
local textOnColor = function(color)
  local r, g, b = require('colorbuddy.util').hsl_to_rgb(color.base.H, color.base.S, color.base.L)

  r = r * 255
  g = g * 255
  b = b * 255

  -- Thx colorizer.nvim and stack overflow! <3
  -- https://stackoverflow.com/questions/596216/formula-to-determine-perceived-brightness-of-rgb-color
  local luminance = (0.299 * r + 0.587 * g + 0.114 * b) / 255

  if luminance > 0.5 then
    return colors.black
  else
    return colors.white
  end
end

local M = {}

function M.setup(opts)
  opts = opts or {}

  local s = parseStyleOpts(opts)

  -- Text on Primary / Secondary Background Colors
  -- NOTE: Experimental! Might not stay!
  Group.new('NoirbuddyTextOnPrimary', textOnColor(colors.primary), colors.primary)
  Group.new('NoirbuddyTextOnSecondary', textOnColor(colors.secondary), colors.secondary)

  -- Generic Highlighting
  Group.new('Normal', colors.noir_4, colors.background)
  Group.new('Search', nil, colors.noir_8)
  Group.new('IncSearch', colors.noir_0, colors.noir_7)
  Group.new('Substitute', nil, colors.noir_8)
  Group.new('CurSearch', colors.noir_9, colors.noir_2)
  Group.new('Visual', nil, colors.noir_8)
  Group.new('SignColumn', nil, colors.background)
  Group.new('LineNr', colors.noir_8, colors.background)
  Group.new("EndOfBuffer", colors.noir_8, nil)

  Group.new('Comment', colors.noir_7)
  Group.new('Constant', colors.primary)
  Group.new('Character', colors.noir_5)
  Group.new('Identifier', colors.noir_0)
  Group.new('Statement', colors.noir_1)
  Group.new('PreProc', colors.primary)
  Group.new('Type', colors.secondary)
  Group.new('Special', colors.noir_5)
  Group.new('Error', colors.primary)
  Group.new('Todo', colors.primary, colors.noir_8)
  Group.new('Function', colors.noir_0)

  Group.new('ColorColumn', nil, colors.noir_8)
  Group.new('Conceal', colors.noir_7)
  Group.new('Cursor', nil)
  Group.new('CursorColumn', nil, colors.noir_9)
  Group.new('CursorLine', nil, colors.noir_9)
  Group.new('CursorLineNr', colors.noir_6, colors.noir_9)
  Group.new('Directory', colors.noir_3)
  Group.new('DiffAdd', colors.primary, colors.noir_8)
  Group.new('DiffChange', colors.noir_0, colors.noir_8)
  Group.new('DiffDelete', colors.secondary, colors.noir_8)
  Group.new('DiffText', colors.noir_0, colors.noir_7)
  Group.new('ErrorMsg', textOnColor(colors.diagnostic_error), colors.diagnostic_error)
  Group.new('VertSplit', colors.noir_8, colors.noir_9)
  Group.new('WinSeparator', colors.noir_8, colors.noir_9)

  Group.new('Folded', colors.noir_5, colors.noir_8)
  Group.new('FoldColumn', colors.noir_7)
  Group.new('MatchParen', nil, colors.noir_7)
  Group.new('MoreMsg', nil, colors.noir_6)
  Group.new('NonText', colors.noir_8, nil)
  Group.new('Pmenu', colors.noir_2, colors.noir_8)
  Group.new('PmenuSel', colors.noir_0, colors.noir_7)
  Group.new('PmenuSbar', nil, colors.noir_8)
  Group.new('PmenuThumb', nil, colors.noir_7)
  Group.new('Question', colors.noir_1, colors.noir_8)
  Group.new('SpecialKey', colors.noir_6, nil)
  Group.new('SpellBad', colors.primary)
  Group.new('SpellCap', colors.noir_0)
  Group.new('SpellLocal', colors.noir_5)
  Group.new('SpellRare', colors.primary)
  Group.new('StatusLine', colors.noir_5, colors.noir_8)
  Group.new('TabLine', colors.noir_3, colors.noir_8)
  Group.new('TabLineFill', nil, colors.noir_8)
  Group.new('TabLineSel', colors.noir_2, nil)
  Group.new('Title', colors.noir_3)
  Group.new('VisualNOS', colors.primary, colors.noir_8)
  Group.new('WarningMsg', colors.primary)
  Group.new('WildMenu', colors.noir_5, colors.noir_8)

  Group.new('FloatBorder', colors.noir_7)
  Group.new('FloatTitle', colors.noir_0)
  Group.new('NormalFloat', colors.noir_4)

  -- Treesitter Syntax Highlighting
  -- See :help treesitter-highlight-groups
  Group.new('@boolean', colors.primary)
  Group.new('@character', colors.secondary)
  Group.new('@character.special', colors.noir_2)
  Group.new('@comment', colors.noir_7)
  Group.new('@conditional', colors.noir_2)
  Group.new('@constant', colors.noir_2)
  Group.new('@constant.builtin', colors.noir_2)
  Group.new('@constant.macro', colors.primary)
  Group.new('@constructor', colors.noir_1)
  Group.new('@debug', colors.noir_2)
  Group.new('@define', colors.noir_2)
  Group.new('@exception', colors.noir_2)
  Group.new('@field', colors.noir_2)
  Group.new('@float', colors.noir_2)
  Group.new('@function', colors.noir_0)
  Group.new('@function.builtin', colors.noir_2)
  Group.new('@function.call', colors.noir_2)
  Group.new('@function.macro', colors.primary)
  Group.new('@include', colors.noir_6)
  Group.new('@keyword', colors.noir_5)
  Group.new('@keyword.function', colors.noir_5)
  Group.new('@keyword.operator', colors.noir_6)
  Group.new('@keyword.return', colors.noir_0)
  Group.new('@label', colors.noir_2)
  Group.new('@macro', colors.primary)
  Group.new('@method', colors.noir_1)
  Group.new('@method.call', colors.noir_2)
  Group.new('@namespace', colors.noir_2)
  Group.new('@none', colors.noir_3)
  Group.new('@number', colors.primary)
  Group.new('@operator', colors.noir_6)
  Group.new('@parameter', colors.noir_2)
  Group.new('@preproc', colors.noir_2)
  Group.new('@property', colors.noir_2)
  Group.new('@punctuation', colors.noir_2)
  Group.new('@punctuation.bracket', colors.noir_6)
  Group.new('@punctuation.delimiter', colors.noir_6)
  Group.new('@punctuation.special', colors.primary)
  Group.new('@repeat', colors.noir_2)
  Group.new('@storageclass', colors.noir_2)
  Group.new('@string', colors.primary)
  Group.new('@string.escape', colors.noir_2)
  Group.new('@string.special', colors.noir_2)
  Group.new('@structure', colors.noir_2)
  Group.new('@tag', colors.noir_6)
  Group.new('@tag.attribute', colors.noir_4)
  Group.new('@tag.delimiter', colors.noir_3)
  Group.new('@text.literal', colors.secondary)
  Group.new('@text.reference', colors.secondary)
  Group.new('@text.title', colors.noir_2)
  Group.new('@text.todo', colors.noir_2)
  Group.new('@text.underline', colors.noir_2)
  Group.new('@text.uri', colors.noir_2)
  Group.new('@type', colors.noir_2)
  Group.new("@identifier", colors.noir_0)
  Group.new('@type.builtin', colors.noir_6)
  Group.new('@type.definition', colors.noir_2)
  Group.new('@variable', colors.secondary)
  Group.new('@variable.builtin', colors.noir_2)
  Group.new('@lsp.type.function', colors.noir_0)
  Group.new('@lsp.type.macro', colors.primary)
  Group.new('@lsp.type.method', colors.noir_2)

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
