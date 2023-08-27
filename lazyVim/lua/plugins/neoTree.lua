return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  event = "VeryLazy",
  keys = {
    { "<leader>fe", false },
    { "<leader>fE", false },
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
      end,
      desc = "Explorer NeoTree (root)",
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    {
      "<leader>ff",
      "<CMD>Neotree source=filesystem reveal toggle float<CR>",
      desc = "float Explorer files ",
    },
    {
      "<C-b>",
      "<CMD>Neotree source=filesystem left toggle reveal<CR>",
      desc = "Explorer NeoTree",
    },
    {
      "<C-g>",
      "<CMD>Neotree source=git_status left toggle reveal<CR>",
      desc = "Explorer changed files",
    },
    {
      "<leader>fg",
      "<CMD>Neotree source=git_status toggle float reveal<CR>",
      desc = "Explorer changed files",
    },
  },
  opts = {
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
      filte_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitigno = false,
        hide_hidden = true,
        hide_by_name = { ".git", "node_modules", ".docker", ".vscode", "dist" },
        hide_by_pattern = { "*.meta", ".git", "node_modules" },
        never_show = { "node_modules", ".next" },
        always_show = { ".gitignore, .env, .env.example" },
      },
      window = {
        mappings = {
          ["l"] = "open_file_without_losing_forcus",
        },
        fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
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
