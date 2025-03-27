return {
  "folke/snacks.nvim",
  lazy = false,
  ---@type snacks.Config
  opts = {
    terminal = {
      win = {
        border = "rounded",
      },
    },
  },
  keys = {
    {
      "<M-q>",
      function()
        Snacks.terminal.toggle("zsh", { win = { width = 0.7, height = 0.7 } })
      end,
    },
    {
      "<M-=>",
      function()
        Snacks.terminal.toggle("zsh", {
          win = {
            width = 0.3,
            count = 3,
            position = "right",
            border = "rounded",
          },
        })
      end,
    },
  },
}
