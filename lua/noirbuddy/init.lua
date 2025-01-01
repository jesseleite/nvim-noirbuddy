local M = {}

M.options = nil

function M.setup(opts)
  M.options = opts
end

function M.load()
  vim.api.nvim_command("highlight clear")
  vim.api.nvim_command("set termguicolors")
  vim.api.nvim_command(string.format("set background=%s", "dark"))

  require("noirbuddy.colors").setup(M.options)
  require("noirbuddy.theme").setup(M.options)
  require("noirbuddy.plugins")
  require("noirbuddy.languages")

  vim.api.nvim_command(string.format('let g:colors_name = "%s"', "noirbuddy"))
end

return M
