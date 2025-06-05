return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
      patterns = {
        ".git",
        "Makefile",
        "requirements.txt",
        "pyproject.toml",
        "setup.py",
        "ansible.cfg",
      },
    })
	end,
}
