local M = {}

function M.setup(opts)
  opts = opts or {}

  require('colorbuddy').colorscheme('noirbuddy', false, {
    disable_defaults = true,
  })

  require('noirbuddy.colors').setup(opts)
  require('noirbuddy.theme').setup(opts)
  require('noirbuddy.plugins')
  require('noirbuddy.languages')
end

return M
