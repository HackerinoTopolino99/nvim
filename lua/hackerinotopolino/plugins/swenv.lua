return {
  "AckslD/swenv.nvim",
  config = function()
    require("swenv").setup({
      auto_create_venv = true,
      auto_create_venv_dir = ".venv",

      get_venvs = function(venvs_path)
        return require("swenv.api").get_venvs(venvs_path)
      end,
      -- Path passed to `get_venvs`.
      venvs_path = vim.fn.expand(".venv"),
      -- Something to do after setting an environment, for example call vim.cmd.LspRestart
      post_set_venv = vim.cmd.LspRestart,
    })
  end,
}
