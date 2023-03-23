return {
  -- naviagter with nvim and tmux better
  { "christoomey/vim-tmux-navigator", enabled = true },

  -- pop up an block to display message
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "SmiteshP/nvim-navic", enabled = false },

  -- motion in vim
  { "ggandor/flit.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },

  { "echasnovski/mini.indentscope", enabled = true },
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
    "NvChad/nvim-colorizer.lua",
    enabled = true,
    lazy = true,
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
