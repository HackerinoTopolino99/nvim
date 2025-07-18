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
			cmd = { "ansible-language-server", "--stdio" },
			settings = {
				ansible = {
					ansible = {
						path = "ansible",
					},
					executionEnvironment = {
						enabled = false,
					},
					validation = {
						enabled = true,
						lint = {
							enabled = true,
							path = "ansible-lint",
						},
					},
          completion = {
            provideRedirectModules = true,
            provideModuleOptionAliases = true
          },
				},
			},
			filetypes = { "yaml.ansible", "yaml", "yml" },
			root_dir = lspconfig.util.root_pattern("ansible.cfg", ".git"),
			single_file_support = true,
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})

		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		lspconfig.terraformls.setup({
			capabilities = capabilities,
			default_config = {
				cmd = { "terraform-ls", "serve" },
				filetypes = { "terraform", "terraform-vars" },
				root_dir = lspconfig.util.root_pattern(".terraform", ".git"),
			},
		})

		vim.diagnostic.config({
			update_in_insert = true,
			virtual_text = true,
			signs = true,
		})
	end,
}
