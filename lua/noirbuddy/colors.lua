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
  Color.new('nb_background', getConfiguredColor('background'))

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
  -- TODO: By default, 0 is light and 9 is dark (or you can invert this for light themes with `light = true` in your setup or preset config)
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

  -- Invert noir grayscale palette for light themes?
  -- WARNING: Feeling experimental, might delete later 💅
  if opts.light then
    local c = M.all()
    Color.new('noir_0', c.noir_9)
    Color.new('noir_1', c.noir_8)
    Color.new('noir_2', c.noir_7)
    Color.new('noir_3', c.noir_6)
    Color.new('noir_4', c.noir_5)
    Color.new('noir_5', c.noir_4)
    Color.new('noir_6', c.noir_3)
    Color.new('noir_7', c.noir_2)
    Color.new('noir_8', c.noir_1)
    Color.new('noir_9', c.noir_0)
  end
end

return M
