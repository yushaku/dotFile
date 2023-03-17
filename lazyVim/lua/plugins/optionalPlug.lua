return {
  -- naviagter with nvim and tmux better
  { "christoomey/vim-tmux-navigator", enabled = true },
  { "nvim-tree/nvim-web-devicons", lazy = true, enabled = true },

  -- pop up an block to display message
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "SmiteshP/nvim-navic", enabled = false },

  { "echasnovski/mini.indentscope", enabled = false },
  -- better focus remove all unused out of my side
  {
    "folke/zen-mode.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {
      window = {
        options = {
          signcolumn = "no",
          number = true,
          relativenumber = true,
          cursorline = true,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        gitsigns = { enabled = false },
        tmux = { enabled = true },
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = true,
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = true,
      show_current_context = true,
    },
  },
}
