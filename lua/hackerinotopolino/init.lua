require("hackerinotopolino.config.mapping")
require("hackerinotopolino.config.settings")
require("hackerinotopolino.config.lazy")

vim.cmd [[colorscheme nightfly]]

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = HackerinoTopolinoGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = HackerinoTopolinoGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

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
