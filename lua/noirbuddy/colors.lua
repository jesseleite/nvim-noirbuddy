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
  -- TODO: Should we prefix all of our colors with `nb_`, at least while colorbuddy has reserved words?
  -- TODO: Can we eventually change to `background` if we PR a fix to colorbuddy?
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
  Color.new('black', getConfiguredColor('black') or '#121212')
  Color.new('gray_9', getConfiguredColor('gray_9') or '#212121')
  Color.new('gray_8', getConfiguredColor('gray_8') or '#323232')
  Color.new('gray_7', getConfiguredColor('gray_7') or '#535353')
  Color.new('gray_6', getConfiguredColor('gray_6') or '#737373')
  Color.new('gray_5', getConfiguredColor('gray_5') or '#949494')
  Color.new('gray_4', getConfiguredColor('gray_4') or '#a7a7a7')
  Color.new('gray_3', getConfiguredColor('gray_3') or '#b4b4b4')
  Color.new('gray_2', getConfiguredColor('gray_2') or '#d5d5d5')
  Color.new('gray_1', getConfiguredColor('gray_1') or '#f5f5f5')
  Color.new('white', getConfiguredColor('white') or '#ffffff')
end

return M
