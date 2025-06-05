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
      close_if_last_window = true,
      popup_border_style = "NC",
      enable_diagnostics = false,
      sort_case_insensitive = true,
      default_component_configs = {
        file_size = {
          enabled = false,
        },
        type = {
          enabled = false,
        },
        last_modified = {
          enabled = false,
        },
        created = {
          enabled = false,
        },
        symlink_target = {
          true,
        },
      },
      commands = {},
      window = {
        position = "left",
        width = 40,
      },
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
      git_status = {
        window = {
          position = "float",
          mappings = {
            ["g"] = {
              "show_help",
              nowait = false,
              config = { title = "Git Commands", prefix_key = "g" },
            },
            ["gA"] = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
            ["o"] = {
              "show_help",
              nowait = false,
              config = { title = "Order by", prefix_key = "o" },
            },
            ["oc"] = { "order_by_created", nowait = false },
            ["od"] = { "order_by_diagnostics", nowait = false },
            ["om"] = { "order_by_modified", nowait = false },
            ["on"] = { "order_by_name", nowait = false },
            ["os"] = { "order_by_size", nowait = false },
            ["ot"] = { "order_by_type", nowait = false },
          },
        },
      },
    })
  end,
}
