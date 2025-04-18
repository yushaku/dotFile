return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  event = "VeryLazy",
  enabled = true,
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          position = "left",
          dir = require("lazyvim.util").root.get(),
        })
      end,
      desc = "[NeoTree] Files Explorer (root)",
    },
    {
      "<leader>ge",
      "<CMD>Neotree git_status toggle left reveal<CR>",
      desc = "[NeoTree] Explorer changed files",
    },
    {
      "<M-f>",
      "<CMD>Neotree source=filesystem float toggle reveal<CR>",
      desc = "[NeoTree] Explorer NeoTree",
    },
  },
  opts = {
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      git_status = {
        symbols = {
          added = "+",
          modified = "",
          deleted = "-",
          renamed = "~",
          untracked = "?",
          igno = "",
          conflict = "",
        },
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      bind_to_cwd = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitigno = true,
        hide_hidden = false,
        hide_by_name = { ".git", "node_modules", ".docker", ".vscode", "dist" },
        hide_by_pattern = { "*.meta", ".git", "node_modules" },
        always_show = { ".gitignore", ".env", ".env.example" },
      },
      window = {
        mappings = {
          ["l"] = "open_file_without_losing_forcus",
          ["tab"] = { "next_source" },
        },
        fuzzy_finder_mappings = {
          ["<C-j>"] = "move_cursor_down",
          ["<C-k>"] = "move_cursor_up",
        },
      },
      commands = {
        open_file_without_losing_forcus = function(state)
          local node = state.tree:get_node()
          if require("neo-tree.utils").is_expandable(node) then
            state.commands["toggle_node"](state)
          else
            state.commands["open"](state)
            vim.cmd("Neotree reveal")
          end
        end,
      },
    },
  },
}
