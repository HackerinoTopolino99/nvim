return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "miversen33/netman.nvim",
  },
  lazy = false,
  config = function()
    require("neo-tree").setup({
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "netman.ui.neo-tree",
      },
      source_selector = {
        winbar = true,
        status_line = false,
        sources = {
          {
            source = "filesystem", -- string
          },
          {
            source = "buffers", -- string
          },
          {
            source = "git_status", -- string
          },
          {
            source = "remote",
          },
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = false,
          always_show = {
            ".git",
            ".gitignore",
          },
          always_show_by_pattern = {
            ".env*",
          },
        },
      },
    })
  end,
}
