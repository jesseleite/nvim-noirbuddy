local M = {}

function M.setup(opts)
  opts = opts or {}

  require('colorbuddy').colorscheme('noirbuddy', false, {
    disable_defaults = true,
  })
  -- TODO: Discuss this...
  -- require('colorbuddy')

  require('noirbuddy.colors').setup(opts)
  require('noirbuddy.theme')
  require('noirbuddy.plugins')
  require('noirbuddy.languages')
end

return M
