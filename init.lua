vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("hackerinotopolino")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("Neotree show")
  end
})
