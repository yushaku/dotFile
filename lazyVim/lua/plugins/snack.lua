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
  },
}
