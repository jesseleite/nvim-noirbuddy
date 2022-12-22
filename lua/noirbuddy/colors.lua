local Color = require('colorbuddy').Color
local colors = require('colorbuddy').colors

local M = {}

function M.getPreset(preset)
  return require('noirbuddy.presets.' .. preset)
end

function M.mergeWithPreset(preset, colors)
  return vim.tbl_extend('force', M.getPreset(preset), colors)
end

function M.all()
  local c = {}

  for name,_ in pairs(colors) do
    c[string.gsub(name, '^nb_', '')] = colors[name]:to_vim()
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
  -- TODO: This will eventually change to `background` when we PR a fix to colorbuddy (since `background` is currently reserved)
  Color.new('nb_background', getConfiguredColor('background') or '#121212')

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

  -- Set up grayscale palette
  -- The rest of the theme is based on this grayscale palette, hence the name 'noir' buddy
  -- TODO: By default, 0 is light and 9 is dark (or you can invert this for light themes with `light = true` in your setup or preset config)
  Color.new('noir_0', getConfiguredColor('noir_0') or '#ffffff')
  Color.new('noir_1', getConfiguredColor('noir_1') or '#f5f5f5')
  Color.new('noir_2', getConfiguredColor('noir_2') or '#d5d5d5')
  Color.new('noir_3', getConfiguredColor('noir_3') or '#b4b4b4')
  Color.new('noir_4', getConfiguredColor('noir_4') or '#a7a7a7')
  Color.new('noir_5', getConfiguredColor('noir_5') or '#949494')
  Color.new('noir_6', getConfiguredColor('noir_6') or '#737373')
  Color.new('noir_7', getConfiguredColor('noir_7') or '#535353')
  Color.new('noir_8', getConfiguredColor('noir_8') or '#323232')
  Color.new('noir_9', getConfiguredColor('noir_9') or '#212121')
end

return M
