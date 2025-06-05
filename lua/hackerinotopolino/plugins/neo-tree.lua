return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "miversen33/netman.nvim",
  },
  opts = {
    close_if_last_window = false,
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
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<space>"] = {
          "toggle_node",
          nowait = false,
          config = { show_help = true },
        },
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open_drop",
        ["<esc>"] = "cancel",
        ["l"] = "focus_preview",
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        -- ["t"] = "open_tab_drop",
        ["t"] = function(state)
          local node = state.tree:get_node()
          if node.type == "file" then
            vim.cmd("tabnew " .. node.path)
            vim.cmd("Neotree show")
          end
        end,
        ["w"] = "open_with_window_picker",
        ["C"] = "close_node",
        ["z"] = "close_all_nodes",
        ["Z"] = "expand_all_nodes",
        ["a"] = {
          "add",
          config = {
            show_path = "none",
          },
        },
        ["A"] = "add_directory",
        ["d"] = "delete",
        ["r"] = "rename",
        ["b"] = "rename_basename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = {
          "copy",
          config = {
            show_path = "absolute",
          },
        },
        ["m"] = "move",
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
        ["i"] = "show_file_details",
      },
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
          source = "filesystem",
        },
        {
          source = "buffers",
        },
        {
          source = "git_status",
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
        always_show = {},
        always_show_by_pattern = {
          ".env*",
          ".git*",
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
  },
}
