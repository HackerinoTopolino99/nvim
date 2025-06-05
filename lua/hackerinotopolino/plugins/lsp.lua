return {
  "neovim/nvim-lspconfig",
  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    local lspconfig = require("lspconfig")

    lspconfig.ansiblels.setup({
      capabilities = capabilities,
      settings = {
        ansible = {
          ansible = {
            path = "ansible",
          },
          ansibleLint = {
            path = "ansible-lint",
          },
        },
      },
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "it", "describe", "before_each", "after_each" },
          },
        },
      },
    })

    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    lspconfig.terraformls.setup({
      capabilities = capabilities,
      settings = {
        terraform = {
          path = "terraform",
        },
        terraform_lsp = {
          path = "terraform-lsp",
        },
      },
    })

    vim.diagnostic.config({
      update_in_insert = true,
      virtual_text = true,
      signs = true,
    })
  end,
}
