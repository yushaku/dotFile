return {
  -- pop up an block to display message
  { "rcarriga/nvim-notify", enabled = false },
  { "SmiteshP/nvim-navic",  enabled = false },
  {
    "folke/trouble.nvim",
    enabled = false,
    opts = { action_keys = { close = { "q", "<esc>" }, open_split = { "s" } } },
  },
  { "ggandor/flit.nvim",        enabled = false },
  { "ggandor/leap.nvim",        enabled = false },
  { "folke/neoconf.nvim",       enabled = false },
  { "persistence.nvim",         enabled = false },
  { "goolord/alpha-nvim",       enabled = false },
  { "dstein64/vim-startuptime", enabled = false },
  {
    "folke/flash.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = { jump = { autojump = true }, label = { uppercase = false, reuse = "none" } },
  },
}
