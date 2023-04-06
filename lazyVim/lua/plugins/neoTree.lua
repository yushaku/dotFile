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
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = true,
        hide_by_name = { ".git", "node_modules", ".docker", ".vscode" },
        hide_by_pattern = { "*.meta", ".git", "node_modules" },
        always_show = { ".gitignored, .env, .env.example" },
      },
      bind_to_cwd = false,
      follow_current_file = true,
    },
  },
}
