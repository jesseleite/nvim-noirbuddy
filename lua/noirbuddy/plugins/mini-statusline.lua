local cb = require('colorbuddy')

local Group = cb.Group
local colors = cb.colors

Group.new('MiniStatuslineModeNormal', colors.noir_2, colors.noir_7)
Group.new('MiniStatuslineModeInsert', colors.background, colors.primary)
Group.new('MiniStatuslineModeVisual', colors.background, colors.secondary)
Group.new('MiniStatuslineModeReplace', colors.background, colors.primary)
Group.new('MiniStatuslineModeCommand', colors.noir_2, colors.noir_7)
Group.new('MiniStatuslineModeOther', colors.noir_2, colors.noir_7)

Group.new('MiniStatuslineDevinfo', colors.noir_3, colors.noir_8)
Group.new('MiniStatuslineFilename', colors.noir_3, colors.noir_9)
Group.new('MiniStatuslineFileinfo', colors.noir_6, colors.noir_9)

Group.new('MiniStatuslineInactive', colors.noir_6, colors.noir_9)

local M = {}

-- Always use relative filename where possible, and space out modified and readonly flags
M.section_filename = function()
  if vim.bo.buftype == 'terminal' then
    return '%t'
  end

  local path = vim.fn.expand('%:~:.')

  if path == '' then
    return '%f %m %r'
  end

  return path .. ' %m %r'
end

-- A more minimal file info section
M.section_fileinfo = function(args)
  args = args or {}

  local filetype = vim.bo.filetype

  if filetype == '' then return '' end

  if require('mini.statusline').is_truncated(args.trunc_width) or vim.bo.buftype ~= '' then
    return filetype
  end

  local encoding = vim.bo.fileencoding or vim.bo.encoding

  return string.format('%s %s', filetype, encoding)
end

-- Just show current line and column
M.section_location = function()
  return '%l:%v'
end

-- Noirbuddy active theme
M.active = function()
  local mini = require('mini.statusline')
  local noirbuddy = require('noirbuddy.plugins.mini-statusline')

  if mini.config.use_icons then
    local has_mini_icons, icons = pcall(require, 'mini.icons')
    if has_mini_icons then
      lsp_icon = icons.get('default', 'os')
    else
      lsp_icon = '󰰎'
    end
  end

  local mode, mode_hl = mini.section_mode({ trunc_width = 120 })
  local git           = mini.section_git({ trunc_width = 40 })
  local diff          = mini.section_diff({ trunc_width = 75 })
  local filename      = noirbuddy.section_filename()
  local fileinfo      = noirbuddy.section_fileinfo({ trunc_width = 120 })
  local diagnostics   = mini.section_diagnostics({ trunc_width = 75 })
  local lsp           = mini.section_lsp({ trunc_width = 75, icon = lsp_icon or 'LSP' })
  local location      = noirbuddy.section_location()
  local search        = mini.section_searchcount({ trunc_width = 75 })

  return mini.combine_groups({
    { hl = mode_hl,                  strings = { mode } },
    { hl = 'MiniStatuslineDevinfo',  strings = { git, diff } },
    '%<', -- Mark general truncate point
    { hl = 'MiniStatuslineFilename', strings = { filename } },
    '%=', -- End left alignment
    { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
    { hl = 'MiniStatuslineDevinfo',  strings = { lsp, diagnostics } },
    { hl = mode_hl,                  strings = { location, search } },
  })
end

-- Noirbuddy inactive theme
M.inactive = function()
  local mini = require('mini.statusline')
  local noirbuddy = require('noirbuddy.plugins.mini-statusline')

  local filename = noirbuddy.section_filename()
  local location = noirbuddy.section_location({ minimal = true })

  return mini.combine_groups({
    { hl = 'MiniStatuslineInactive', strings = { filename } },
    '%=', -- End left alignment
    { hl = 'MiniStatuslineInactive', strings = { location } },
  })
end

return M
