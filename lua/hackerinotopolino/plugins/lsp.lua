return {
    "neovim/nvim-lspconfig",
    config = function()
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
                              "force",
                              {},
                              vim.lsp.protocol.make_client_capabilities(),
                              cmp_lsp.default_capabilities())

      local lspconfig = require("lspconfig")

      lspconfig.pyright.setup({
              capabilities = capabilities
          })
          -- ["pylsp"] = function()
          --   local lspconfig = require("lspconfig")
          --   lspconfig.pylsp.setup {
          --     capabilities = capabilities,
          --     settings = {
          --       pylsp = {
          --         plugins = {
          --           -- Code format
          --           isort = {
          --             enabled = false
          --           },
          --           autopep8 = {
          --             enabled = false
          --           },
          --           pycodestyle = {
          --             enabled = enable,
          --             ignore = {'E501', 'W391'},
          --             maxLineLength = 120
          --           },
          --           pyflakes = {
          --             enabled = false
          --           },
          --           mccabe = {
          --             enabled = false
          --           }
          --         },
          --       }
          --     }
          --   }
          -- end,

      vim.diagnostic.config({
          update_in_insert = true,
          virtual_text = true,
          signs = true
      })
    end
}
