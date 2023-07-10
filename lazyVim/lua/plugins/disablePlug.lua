return {
  -- pop up an block to display message
  { "rcarriga/nvim-notify", enabled = false },
  { "SmiteshP/nvim-navic",  enabled = false },
  {
    "folke/trouble.nvim",
    enabled = false,
    opts = {
      position = "right", -- position of the list can be: bottom, top, left, right
      action_keys = { close = { "q", "<esc>" }, open_split = { "s" } },
    },
    keys = {
      { "<leader>xl", false },
      { "<leader>xL", false },
      { "<leader>xq", false },
      { "<leader>xQ", false },
      { "<leader>xX", false },
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "List trouble in current file" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "List trouble in workspace" },
    },
  },
  -- motion in vim
  { "ggandor/flit.nvim",           enabled = false },
  { "ggandor/leap.nvim",           enabled = false },
  { "folke/neoconf.nvim",          enabled = false },
  { "nvim-treesitter-textobjects", enabled = true },
  { "persistence.nvim",            enabled = false },
  { "b0o/schemastore.nvim",        enabled = false },
  { "tomlion/vim-solidity" },

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
