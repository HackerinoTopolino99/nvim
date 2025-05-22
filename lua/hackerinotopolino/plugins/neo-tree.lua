return{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  config = function()
      require("neo-tree").setup({
--        sources = {
--          "netman.ui.neo-tree"
--        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = true,
            hide_gitignored = false,
            always_show_by_pattern = {
              ".git*",
              ".env*",
            },
          }
        }
      })
  end
}
