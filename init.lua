vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("hackerinotopolino")

vim.api.nvim_create_autocmd("UiEnter", {
  callback = function(data)
    local path = vim.fn.fnamemodify(data.file, ":h")
    if vim.fn.isdirectory(path) == 1 then
      vim.cmd("cd " .. path)
      vim.cmd("Neotree show")
    end
  end
})
