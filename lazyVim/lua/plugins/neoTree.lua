return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    { "<C-b>", "<leader>e", desc = "Explorer NeoTree (root dir)", remap = true },
    { "<C-S-b>", "<leader>E", desc = "Explorer NeoTree (cwd)", remap = true },
  },
  opts = {
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "",
          untracked = "+",
          ignored = "",
          conflict = "",
        },
      },
    },
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = true,
        -- hide_by_name = { ".git", "node_modules", ".docker", ".vscode" },
        -- hide_by_pattern = { "*.meta", ".git", "node_modules" },
        never_show = { "node_modules", ".next" },
        always_show = { ".gitignored, .env, .env.example" },
      },
      bind_to_cwd = false,
      follow_current_file = true,
      git_status = {
        window = {
          position = "float",
          mappings = {
            ["gA"] = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
          },
        },
      },
    },
  },
}
