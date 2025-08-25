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
      filetypes = { "yaml" },
      root_dir = lspconfig.util.root_pattern(
        "ansible.cfg",
        "inventory",
        "inventory.yml",
        "inventory.yaml",
        "inventory.ini",
        "inventory.example"
      ),
      single_file_support = false,
    })

    lspconfig.bashls.setup({
      capabilities = capabilities,
    })

    lspconfig.gitlab_ci_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.gh_actions_ls.setup({
      capabilities = capabilities,

      filetypes = { "yaml.github" },
      root_dir = lspconfig.util.root_pattern(".github/workflows"),
      single_file_support = false,
    })

    lspconfig.ltex_plus.setup({
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.nginx_language_server.setup({
      capabilities = capabilities,
    })

    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    lspconfig.systemd_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.yamlls.setup({
      capabilities = capabilities,
      filetypes = { "yaml" },
      single_file_support = true,
    })

    vim.diagnostic.config({
      update_in_insert = true,
      virtual_text = true,
      signs = true,
    })
  end,
}
