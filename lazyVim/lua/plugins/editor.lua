return {
  { "chrisgrieser/nvim-spider", lazy = true, enabled = true }, -- better w, e and b motion
  { "christoomey/vim-tmux-navigator", enabled = true }, -- naviagter with nvim and tmux better
  { "echasnovski/mini.indentscope", enabled = true },
  {
    "simrat39/symbols-outline.nvim",
    enabled = true,
    cmd = "SymbolsOutline",
    opts = { position = "right" },
    keys = { { "<leader>uo", "<CMD>:SymbolsOutline<CR>", { desc = "toggle outlne" } } },
  },
  {
    "uga-rosa/ccc.nvim",
    enabled = true,
    keys = {
      { "<leader>cc", "<CMD>CccHighlighterToggle<CR>", desc = "toggle display color preview css" },
      { "<leader>cp", "<CMD>CccPick<CR>", desc = "color picker css" },
    },
  },
  { -- transparent background
    "xiyaowong/transparent.nvim",
    enabled = true,
    keys = { { "<leader>ut", "<CMD>TransparentToggle<CR>", desc = "toggle Transparent bg" } },
  },
  {
    "echasnovski/mini.surround",
    opts = { mappings = { add = "sa", delete = "sd", replace = "sc" } },
  },
  {
    "folke/trouble.nvim",
    opts = { action_keys = { close = { "q", "<esc>" }, open_split = { "s" } } },
    keys = {
      { "<leader>xl", false },
      { "<leader>xL", false },
      { "<leader>xq", false },
      { "<leader>xQ", false },
      { "<leader>xX", false },
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "List trouble in current file" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "List trouble in workspace" },
    },
  },
  {
    "echasnovski/mini.animate",
    enable = false,
    event = "VeryLazy",
    opts = function()
      local animate = require("mini.animate")
      return {
        cursor = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        resize = { enable = false },
        scroll = { enable = false },
        open = { enable = false },
        close = { enable = false },
      }
    end,
    config = function(_, opts)
      require("mini.animate").setup(opts)
    end,
  },
}
