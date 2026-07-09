return {
  "folke/snacks.nvim",
  lazy = false,
  ---@type snacks.Config
  opts = {
    terminal = {
      auto_insert = false,
      auto_close = true,
      win = {
        border = "rounded",
      },
    },
    bigfile = { enabled = false },
    explorer = { enabled = true },
    picker = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    image = { enabled = true },
  },
  keys = {
    {
      "<M-q>",
      function()
        Snacks.terminal.toggle("zsh", {
          win = { width = 0.7, height = 0.7 },
        })
      end,
    },
    { "<leader>sl", false },
    { "<leader>si", false },
    { "<leader>sb", false },
    { "<leader>sh", false },
  },
}
