vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("hackerinotopolino")

vim.api.nvim_create_autocmd("UiEnter", {
  callback = function(data)
    vim.cmd("cd " .. vim.fn.fnamemodify(data.file, ":h"))
    vim.cmd("Neotree show")
  end
})
