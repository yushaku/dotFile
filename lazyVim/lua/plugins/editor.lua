return {
  { "christoomey/vim-tmux-navigator", enabled = true },
  { "echasnovski/mini.indentscope", enabled = true },
  {
    "simrat39/symbols-outline.nvim",
    enabled = true,
    cmd = "SymbolsOutline",
    opts = {
      position = "right",
      keymaps = {
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = { "o", "f" },
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "H",
        unfold_all = "L",
        fold_reset = "R",
      },
    },
    keys = { { "<leader>uo", "<CMD>:SymbolsOutline<CR>", { desc = "toggle outlne" } } },
  },
  {
    "uga-rosa/ccc.nvim",
    enabled = true,
    keys = {
      { "<leader>cc", "<CMD>CccHighlighterToggle<CR>", desc = "toggle display color preview css" },
      { "<leader>cp", "<CMD>CccPick<CR>", desc = "color picker css" },
      { "<leader>cC", "<CMD>CccConvert<CR>", desc = "convert to other color's type" },
    },
  },
  {
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
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "List trouble in current file" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "List trouble in workspace" },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>b1", "<CMD>BufferLineGoToBuffer 1<CR>", desc = "go to first buffer" },
      { "<leader>b2", "<CMD>BufferLineGoToBuffer 2<CR>", desc = "go to second buffer" },
      { "<leader>b3", "<CMD>BufferLineGoToBuffer 3<CR>", desc = "go to second buffer" },
      { "<leader>b4", "<CMD>BufferLineGoToBuffer 4<CR>", desc = "go to second buffer" },
      { "<leader>bs", "<CMD>BufferLineSortByTabs<CR>", desc = "sort buffer by tabs" },
      { "<leader>bl", "<CMD>BufferLineCloseRight<CR>", desc = "close all buffer to the right" },
      { "<leader>bh", "<CMD>BufferLineCloseLeft<CR>", desc = "close all buffer to the left" },
    },
  },
  {
    "echasnovski/mini.animate",
    enable = true,
    event = "VeryLazy",
    opts = function()
      local animate = require("mini.animate")
      return {
        cursor = {
          enable = true,
          timing = animate.gen_timing.linear({ duration = 200, unit = "total" }),
        },
        resize = { enable = false },
        scroll = { enable = true },
        open = { enable = false },
        close = { enable = false },
      }
    end,
    config = function(_, opts)
      require("mini.animate").setup(opts)
    end,
  },
}
