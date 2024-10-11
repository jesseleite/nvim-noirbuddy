local Color = require('colorbuddy').Color
local colors = require('colorbuddy').colors

local M = {}

function M.getPreset(preset)
  return require('noirbuddy.presets.' .. preset)
end

function M.mergeWithPreset(preset, merge)
  return vim.tbl_extend('force', M.getPreset(preset), merge)
end

function M.all()
  local c = {}

  for name,_ in pairs(colors) do
    c[name] = colors[name]:to_vim()
  end

  return c;
end

function M.setup(opts)
  local preset = M.getPreset(opts.preset or 'minimal')

  local getConfiguredColor = function(color)
    return opts.colors and opts.colors[color] or preset[color]
  end

  -- Set up background color
  -- Can be configured by preset or end user
  Color.new('background', getConfiguredColor('background'))

  -- Set up primary and secondary flavor colors
  -- Can be configured by preset or end user
  Color.new('primary', getConfiguredColor('primary'))
  Color.new('secondary', getConfiguredColor('secondary'))

  -- Set up semantic color palette
  -- These are to be used sparingly, but have semantic meaning for things like lsp diagnostics, git diffs, etc.
  -- Can be configured by preset or end user
  Color.new('diagnostic_error', getConfiguredColor('diagnostic_error'))
  Color.new('diagnostic_warning', getConfiguredColor('diagnostic_warning'))
  Color.new('diagnostic_info', getConfiguredColor('diagnostic_info'))
  Color.new('diagnostic_hint', getConfiguredColor('diagnostic_hint'))
  Color.new('diff_add', getConfiguredColor('diff_add'))
  Color.new('diff_change', getConfiguredColor('diff_change'))
  Color.new('diff_delete', getConfiguredColor('diff_delete'))

  -- Set up noir grayscale palette
  -- The rest of the theme is based on this grayscale palette, hence the name 'noir' buddy
  -- For dark themes: 0 is light and 9 is dark
  -- For light themes: 0 is dark and 9 is light
  Color.new('noir_0', getConfiguredColor('noir_0'))
  Color.new('noir_1', getConfiguredColor('noir_1'))
  Color.new('noir_2', getConfiguredColor('noir_2'))
  Color.new('noir_3', getConfiguredColor('noir_3'))
  Color.new('noir_4', getConfiguredColor('noir_4'))
  Color.new('noir_5', getConfiguredColor('noir_5'))
  Color.new('noir_6', getConfiguredColor('noir_6'))
  Color.new('noir_7', getConfiguredColor('noir_7'))
  Color.new('noir_8', getConfiguredColor('noir_8'))
  Color.new('noir_9', getConfiguredColor('noir_9'))

  -- Pure black and white for text on dynamic background colors
  Color.new('black', '#000000')
  Color.new('white', '#FFFFFF')
end

return M
