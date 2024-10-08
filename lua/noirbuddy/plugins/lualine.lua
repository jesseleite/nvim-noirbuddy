local cb = require('colorbuddy')

local Group = cb.Group
local groups = cb.groups
local colors = cb.colors

-- TODO: Should these be in a "setup" function?
Group.link('lualine_b_diff_added_normal', groups.DiffAdd)
Group.link('lualine_b_diff_added_insert', groups.DiffAdd)
Group.link('lualine_b_diff_added_visual', groups.DiffAdd)
Group.link('lualine_b_diff_added_replace', groups.DiffAdd)
Group.link('lualine_b_diff_added_command', groups.DiffAdd)
Group.link('lualine_b_diff_added_terminal', groups.DiffAdd)
Group.link('lualine_b_diff_added_inactive', groups.DiffAdd)

Group.link('lualine_b_diff_modified_normal', groups.DiffChange)
Group.link('lualine_b_diff_modified_insert', groups.DiffChange)
Group.link('lualine_b_diff_modified_visual', groups.DiffChange)
Group.link('lualine_b_diff_modified_replace', groups.DiffChange)
Group.link('lualine_b_diff_modified_command', groups.DiffChange)
Group.link('lualine_b_diff_modified_terminal', groups.DiffChange)
Group.link('lualine_b_diff_modified_inactive', groups.DiffChange)

Group.link('lualine_b_diff_removed_normal', groups.DiffDelete)
Group.link('lualine_b_diff_removed_insert', groups.DiffDelete)
Group.link('lualine_b_diff_removed_visual', groups.DiffDelete)
Group.link('lualine_b_diff_removed_replace', groups.DiffDelete)
Group.link('lualine_b_diff_removed_command', groups.DiffDelete)
Group.link('lualine_b_diff_removed_terminal', groups.DiffDelete)
Group.link('lualine_b_diff_removed_inactive', groups.DiffDelete)

Group.new('lualine_b_diagnostics_error_normal', colors.diagnostic_error)
Group.new('lualine_b_diagnostics_error_insert', colors.diagnostic_error)
Group.new('lualine_b_diagnostics_error_visual', colors.diagnostic_error)
Group.new('lualine_b_diagnostics_error_replace', colors.diagnostic_error)
Group.new('lualine_b_diagnostics_error_command', colors.diagnostic_error)
Group.new('lualine_b_diagnostics_error_terminal', colors.diagnostic_error)
Group.new('lualine_b_diagnostics_error_inactive', colors.diagnostic_error)

Group.new('lualine_b_diagnostics_warn_normal', colors.diagnostic_warning)
Group.new('lualine_b_diagnostics_warn_insert', colors.diagnostic_warning)
Group.new('lualine_b_diagnostics_warn_visual', colors.diagnostic_warning)
Group.new('lualine_b_diagnostics_warn_replace', colors.diagnostic_warning)
Group.new('lualine_b_diagnostics_warn_command', colors.diagnostic_warning)
Group.new('lualine_b_diagnostics_warn_terminal', colors.diagnostic_warning)
Group.new('lualine_b_diagnostics_warn_inactive', colors.diagnostic_warning)

Group.new('lualine_b_diagnostics_info_normal', colors.diagnostic_info)
Group.new('lualine_b_diagnostics_info_insert', colors.diagnostic_info)
Group.new('lualine_b_diagnostics_info_visual', colors.diagnostic_info)
Group.new('lualine_b_diagnostics_info_replace', colors.diagnostic_info)
Group.new('lualine_b_diagnostics_info_command', colors.diagnostic_info)
Group.new('lualine_b_diagnostics_info_terminal', colors.diagnostic_info)
Group.new('lualine_b_diagnostics_info_inactive', colors.diagnostic_info)

Group.new('lualine_b_diagnostics_hint_normal', colors.diagnostic_hint)
Group.new('lualine_b_diagnostics_hint_insert', colors.diagnostic_hint)
Group.new('lualine_b_diagnostics_hint_visual', colors.diagnostic_hint)
Group.new('lualine_b_diagnostics_hint_replace', colors.diagnostic_hint)
Group.new('lualine_b_diagnostics_hint_command', colors.diagnostic_hint)
Group.new('lualine_b_diagnostics_hint_terminal', colors.diagnostic_hint)
Group.new('lualine_b_diagnostics_hint_inactive', colors.diagnostic_hint)

local M = {}

-- Lualine requires hex codes,
-- But colorbuddy doesn't output hex codes,
-- So we use noirbuddy's `all()` method to get hex codes :)
local c = require('noirbuddy.colors').all()

M.theme = {
  normal = {
    a = { fg = c.noir_2, bg = c.noir_7 },
    b = { fg = c.noir_3, bg = c.noir_8 },
    c = { fg = c.noir_3, bg = c.noir_9 },
  },
  insert = { a = { fg = c.background, bg = c.primary } },
  visual = { a = { fg = c.background, bg = c.secondary } },
  replace = { a = { fg = c.background, bg = c.primary } },
  inactive =    {
    a = { fg = c.noir_6, bg = c.noir_9 },
    b = { fg = c.noir_6, bg = c.noir_9 },
    c = { fg = c.noir_6, bg = c.noir_9 },
  },
}

M.sections = {
  lualine_a = { 'mode' },
  lualine_b = { 'branch', 'diff' },
  lualine_c = { { 'filename', path = 1 } },
  lualine_x = { 'diagnostics', { 'filetype', colored = false }, 'encoding' },
  lualine_y = { 'progress' },
  lualine_z = { 'location' }
}

M.inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = { { 'filename', path = 1 } },
  lualine_x = { 'location' },
  lualine_y = {},
  lualine_z = {}
}

return M
