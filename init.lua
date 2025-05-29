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


vim.g.linefly_options = {
  tabline = true,
  with_file_icon = true,
  with_git_branch = true,
  with_git_status = false,
  with_diagnostic_status = true,
}
