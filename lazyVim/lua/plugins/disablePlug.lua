return {
  -- pop up an block to display message
  { "rcarriga/nvim-notify", enabled = false },
  { "SmiteshP/nvim-navic", enabled = false },
  {
    "folke/trouble.nvim",
    enabled = false,
    opts = { action_keys = { close = { "q", "<esc>" }, open_split = { "s" } } },
  },
  { "ggandor/flit.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "folke/neoconf.nvim", enabled = false },
  { "persistence.nvim", enabled = false },
  { "b0o/schemastore.nvim", enabled = false },
  { "tomlion/vim-solidity", enabled = false },
}
