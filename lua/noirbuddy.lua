local Color, colors, Group, groups, styles = require('colorbuddy').setup()

local M = {}

-- TODO: We need to refactor this and probably split it into smaller functions or something
-- TODO: Add hi groups for GitGutter, fugitive, NERDTree, nvim-tree, lualine etc. (add under /plugins/{hi-group} for example: -> /plugins/lualine.lua) for reference see: https://github.com/lalitmee/cobalt2.nvim/blob/master/lua/cobalt2/plugins/lualine.lua

-- Provide the options for the user to setup their own primary and secondary colors
-- TODO: ? Maybe include entire presets as options?
function M.setup(opts)
    opts = opts or {}

    -- Set up primary and secondary colour palette
    -- These are the main flavour colours
    -- Overwrite if the user provides their own colors
    if opts.primary then
        Color.new('primary', opts.primary)
    else
        Color.new('primary', '#ff0088')
    end

    if opts.secondary then
        Color.new('secondary', opts.secondary)
    else
        Color.new('secondary', '#56c5cc')
    end

    -- Set up semantic colour palette
    -- These are to be used sparingly, but have semantic meaning for things like lsp diagnostics, git diffs, etc.
    Color.new('diagnostic_error', '#ff0088')
    Color.new('diagnostic_warning', '#f7aa1c')
    Color.new('diagnostic_info', '#56c5cc')
    Color.new('diagnostic_hint', '#a8f6f8')
    Color.new('diff_add', '#56c5cc')
    Color.new('diff_change', '#f7aa1c')
    Color.new('diff_delete', '#ff0088')

    -- Set up greyscale palette
    -- The rest of the theme is based on this greyscale palette, hence the name 'noir' buddy
    Color.new('black', '#121212')
    Color.new('grey_11', '#787878')
    Color.new('grey_10', '#b0b0b0')
    Color.new('grey_9', '#212121')
    Color.new('grey_8', '#323232')
    Color.new('grey_7', '#535353')
    Color.new('grey_6', '#737373')
    Color.new('grey_5', '#949494')
    Color.new('grey_4', '#a7a7a7')
    Color.new('grey_3', '#b4b4b4')
    Color.new('grey_2', '#d5d5d5')
    Color.new('grey_1', '#f5f5f5')
    Color.new('white', '#ffffff')

    -- Generic Highlighting
    Group.new('Normal', colors.grey_4, colors.black)
    Group.new('Search', colors.black, colors.white)
    Group.new('IncSearch', colors.black, colors.white)
    Group.new('Visual', nil, colors.grey_8)
    Group.new('SignColumn', nil, colors.black)
    Group.new('LineNr', colors.grey_8, colors.black)

    Group.new('Comment', colors.grey_7)
    Group.new('Constant', colors.primary)
    Group.new('Character', colors.grey_5)
    Group.new('Identifier', colors.white)
    Group.new('Statement', colors.grey_1)
    Group.new('PreProc', colors.primary)
    Group.new('Type', colors.grey_6)
    Group.new('Special', colors.grey_5)
    Group.new('Error', colors.primary)
    Group.new('Todo', colors.primary, colors.grey_8)
    Group.new('Function', colors.primary)

    Group.new('ColorColumn', nil, colors.grey_8)
    Group.new('Conceal', colors.grey_7)
    Group.new('Cursor', colors.black)
    Group.new('CursorColumn', colors.grey_8)
    Group.new('CursorLine', nil, colors.grey_9)
    Group.new('CursorLineNr', colors.grey_6, colors.grey_8)
    Group.new('Directory', colors.grey_10)
    Group.new('DiffAdd', colors.primary, colors.grey_8)
    Group.new('DiffChange', colors.white, colors.grey_8)
    Group.new('DiffDelete', colors.secondary, colors.grey_8)
    Group.new('DiffText', colors.white, colors.grey_7)
    Group.new('ErrorMsg', colors.grey_1, colors.primary)
    Group.new('VertSplit', colors.black, colors.grey_9)

    Group.new('Folded', colors.grey_5, colors.grey_8)
    Group.new('FoldColumn', colors.grey_5, colors.grey_8)
    Group.new('MatchParen', nil, colors.grey_7)
    Group.new('MoreMsg', colors.black, colors.grey_11)
    Group.new('NonText', colors.grey_8, colors.black)
    Group.new('Pmenu', colors.grey_2, colors.grey_8)
    Group.new('PmenuSel', colors.grey_11, colors.grey_8)
    Group.new('PmenuSbar', colors.primary, colors.grey_8)
    Group.new('PmenuThumb', colors.primary, colors.grey_7)
    Group.new('Question', colors.grey_1, colors.grey_8)
    Group.new('SpecialKey', colors.grey_6, colors.black)
    Group.new('SpellBad', colors.primary)
    Group.new('SpellCap', colors.white)
    Group.new('SpellLocal', colors.grey_5)
    Group.new('SpellRare', colors.primary)
    Group.new('StatusLine', colors.grey_5, colors.grey_8)
    Group.new('TabLine', colors.grey_3, colors.grey_8)
    Group.new('TabLineFill', nil, colors.grey_8)
    Group.new('TabLineSel', colors.grey_2, colors.black)
    Group.new('Title', colors.grey_10)
    Group.new('VisualNOS', colors.primary, colors.grey_8)
    Group.new('WarningMsg', colors.primary)
    Group.new('WildMenu', colors.grey_5, colors.grey_8)
    -- TODO... This section needs work for sure

    -- Treesitter Syntax Highlighting
    -- See :help treesitter-highlight-groups
    Group.new('@include', colors.grey_6)
    Group.new('@keyword', colors.grey_5)
    Group.new('@variable', colors.grey_2)
    Group.new('@punctuation.delimiter', colors.grey_6)
    Group.new('@punctuation.special', colors.primary)
    Group.new('@type.builtin', colors.grey_6)
    Group.new('@tag', colors.grey_6)
    Group.new('@tag.attribute', colors.grey_4)
    Group.new('@constructor', colors.grey_1)
    Group.new('@property', colors.grey_2)
    Group.new('@method', colors.grey_1)
    Group.new('@keyword.return', colors.white)
    Group.new('@keyword.function', colors.grey_5)
    Group.new('@function', colors.white)
    Group.new('@none', colors.grey_3)
    Group.new('@punctuation.bracket', colors.grey_6)
    Group.new('@tag.delimiter', colors.grey_3)
    Group.new('@type', colors.grey_3)

    -- TODO: The ones below need further testing
    Group.new('@text.literal', colors.secondary)
    Group.new('@text.reference', colors.secondary)
    Group.new('@text.title', colors.grey_2)
    Group.new('@text.uri', colors.grey_2)
    Group.new('@text.underline', colors.grey_2)
    Group.new('@text.todo', colors.grey_2)
    Group.new('@comment', colors.grey_7)
    Group.new('@punctuation', colors.grey_2)
    Group.new('@constant', colors.grey_2)
    Group.new('@constant.builtin', colors.grey_2)
    Group.new('@constant.macro', colors.grey_2)
    Group.new('@define', colors.grey_2)
    Group.new('@macro', colors.grey_2)
    Group.new('@character', colors.secondary)
    Group.new('@character.special', colors.grey_2)
    Group.new('@number', colors.grey_2)
    Group.new('@boolean', colors.grey_2)
    Group.new('@float', colors.grey_2)
    Group.new('@function.call', colors.grey_2)
    Group.new('@function.builtin', colors.grey_2)
    Group.new('@function.macro', colors.grey_2)
    Group.new('@parameter', colors.grey_2)
    Group.new('@method.call', colors.grey_2)
    Group.new('@field', colors.grey_2)
    Group.new('@conditional', colors.grey_2)
    Group.new('@repeat', colors.grey_2)
    Group.new('@label', colors.grey_2)
    Group.new('@operator', colors.grey_2)
    Group.new('@exception', colors.grey_2)
    Group.new('@variable.builtin', colors.grey_2)
    Group.new('@type.definition', colors.grey_2)
    Group.new('@storageclass', colors.grey_2)
    Group.new('@structure', colors.grey_2)
    Group.new('@namespace', colors.grey_2)
    Group.new('@preproc', colors.grey_2)
    Group.new('@debug', colors.grey_2)
    Group.new('@keyword.operator', colors.secondary)
    -- Group.new('@string', colors.grey_2)
    -- Group.new('@string.escape', colors.grey_2)
    -- Group.new('@string.special', colors.grey_2)
    -- TODO... This section needs work for sure

    -- Semantic Highlighting
    Group.new('DiagnosticError', colors.diagnostic_error, nil, styles.italic + styles.undercurl)
    Group.new('DiagnosticWarning', colors.diagnostic_warning, nil, styles.italic + styles.undercurl)
    Group.new('DiagnosticInfo', colors.diagnostic_info, nil, styles.italic + styles.undercurl)
    Group.new('DiagnosticHint', colors.diagnostic_hint, nil, styles.italic + styles.undercurl)
    Group.new('DiagnosticSignError', colors.diagnostic_error)
    Group.new('DiagnosticSignWarning', colors.diagnostic_warning)
    Group.new('DiagnosticSignInfo', colors.diagnostic_info)
    Group.new('DiagnosticSignHint', colors.diagnostic_hint)
    Group.new('DiffAdd', colors.diff_add)
    Group.new('DiffChange', colors.diff_change)
    Group.new('DiffDelete', colors.diff_delete)
end

return M
