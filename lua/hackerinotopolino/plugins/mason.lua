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
					"docker_language_server",
          "gitlab_ci_ls",
          "gh_actions_ls",
          "ltex_plus",
					"lua_ls",
          "nginx_language_server",
					"pyright",
          "systemd_ls",
          "tofu_ls",
				},
			})
		end,
	},
}
