return {
  -- pop up an block to display message
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "SmiteshP/nvim-navic", enabled = false },

  -- motion in vim
  { "ggandor/flit.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "folke/neoconf.nvim", enabled = false },
  { "nvim-treesitter-textobjects", enabled = true },
  { "persistence.nvim", enabled = false },
  { "b0o/schemastore.nvim", enabled = false },

  -- better focus remove all unused out of my side
  {
    "folke/zen-mode.nvim",
    enabled = false,
    event = "VeryLazy",
    keys = { { "<leader>z", "<CMD>ZenMode<CR>", desc = "toggle zen mode" } },
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
