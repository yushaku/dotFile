return {
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function()
      return {
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
