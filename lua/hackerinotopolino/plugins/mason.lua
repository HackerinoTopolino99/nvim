return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ansiblels",
					"bashls",
					"docker_compose_language_service",
					"lua_ls",
					"pyright",
					"terraformls",
				},
			})
		end,
	},
}
