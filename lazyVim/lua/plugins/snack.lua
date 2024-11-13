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
    dashboard = {
      sections = {
        { section = "header" },
        { section = "keys", gap = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 2 } },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
        { section = "startup" },
      },
    },
  },
  keys = {
    {
      "<M-q>",
      function()
        Snacks.terminal.toggle("zsh", {
          win = {
            width = 0.7,
            height = 0.7,
          },
        })
      end,
    },
    {
      "<M-->",
      function()
        Snacks.terminal.toggle({ "zsh" }, {
          win = {
            width = 0.3,
            position = "bottom",
            count = 2,
          },
        })
      end,
    },
    {
      "<M-=>",
      function()
        Snacks.terminal.toggle("bash", {
          win = {
            width = 0.3,
            position = "right",
          },
        })
      end,
    },
  },
}
