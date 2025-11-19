return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  event = "VeryLazy",
  keys = {
    {
      "<leader>e",
      "<CMD>Neotree source=filesystem toggle left reveal<CR>",
      desc = "Explorer changed files",
    },
    {
      "<leader>ge",
      "<CMD>Neotree source=git_status toggle left reveal<CR>",
      desc = "Explorer changed files",
    },
    {
      "<leader>be",
      "<CMD>Neotree source=buffers toggle left reveal<CR>",
      desc = "Explorer changed files",
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
      bind_to_cwd = false,
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitigno = true,
        hide_hidden = false,
        hide_by_name = { ".git", "node_modules", ".docker", ".vscode", "dist" },
        hide_by_pattern = { "*.meta", ".git", "node_modules" },
        never_show = { "node_modules", ".next" },
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
