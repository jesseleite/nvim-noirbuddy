local M = {}

M.options = nil

function M.setup(opts)
  M.options = opts
end

function M.load(opts)
  opts = vim.tbl_extend("force", M.options, opts or {})

  vim.api.nvim_command("highlight clear")
  vim.api.nvim_command("set termguicolors")
  vim.api.nvim_command(string.format("set background=%s", "dark"))

  require("noirbuddy.colors").setup(opts)
  require("noirbuddy.theme").setup(opts)
  require("noirbuddy.plugins")
  require("noirbuddy.languages")

  if opts.custom ~= nil then
    opts.custom(require("colorbuddy"))
  end

  vim.api.nvim_command(string.format('let g:colors_name = "%s"', "noirbuddy"))
end

return M
