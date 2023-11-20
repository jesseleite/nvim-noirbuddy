local M = {}

function M.setup(opts)
  opts = opts or {}

  vim.api.nvim_command("set termguicolors")
  vim.api.nvim_command(string.format("set background=%s", 'dark'))

  require('noirbuddy.colors').setup(opts)
  require('noirbuddy.theme').setup(opts)
  require('noirbuddy.plugins')
  require('noirbuddy.languages')

  vim.api.nvim_command(string.format('let g:colors_name = "%s"', 'noirbuddy'))
end

return M
