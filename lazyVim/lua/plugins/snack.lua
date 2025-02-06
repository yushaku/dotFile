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
      "<M-->",
      function()
        Snacks.terminal.toggle({ "zsh" }, { win = { width = 0.3, position = "bottom", count = 2 } })
      end,
    },
    {
      "<M-=>",
      function()
        Snacks.terminal.toggle("zsh", { win = { width = 0.3, position = "right", count = 3 } })
      end,
    },
  },
}
