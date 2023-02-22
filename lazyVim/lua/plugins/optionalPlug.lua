return {
  -- naviagter with nvim and tmux better
  { "christoomey/vim-tmux-navigator", enabled = true },

  -- pop up an block to display message
  { "rcarriga/nvim-notify", enabled = false },

  -- better focus remove all unused out of my side
  {
    "folke/zen-mode.nvim",
    enabled = true,
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
}
