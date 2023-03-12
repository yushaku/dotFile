return {
  {
    "echasnovski/mini.animate",
    enable = false,
    event = "VeryLazy",
    opts = function()
      local animate = require("mini.animate")

      return {
        -- Cursor path
        cursor = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        resize = {
          enable = false,
        },
        scroll = {
          enable = false,
        },
        open = {
          enable = false,
        },
        close = {
          enable = false,
        },
      }
    end,
    config = function(_, opts)
      require("mini.animate").setup(opts)
    end,
  },
}
