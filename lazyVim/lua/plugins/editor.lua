return {
  { "christoomey/vim-tmux-navigator", enabled = true },
  { "echasnovski/mini.indentscope", enabled = true },
  { "echasnovski/mini.surround", opts = { mappings = { add = "sa", delete = "sd", replace = "sc" } } },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function()
      local animate = require("mini.animate")
      return {
        cursor = { enable = true, timing = animate.gen_timing.linear({ duration = 200, unit = "total" }) },
        resize = { enable = false },
        open = { enable = false },
        close = { enable = false },
      }
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    enabled = true,
    cmd = "SymbolsOutline",
    event = "VeryLazy",
    keys = { { "<leader>uo", "<CMD>:SymbolsOutline<CR>", { desc = "toggle outlne" } } },
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
  },
  {
    "uga-rosa/ccc.nvim",
    enabled = true,
    event = "VeryLazy",
    keys = {
      { "<leader>cc", "<CMD>CccHighlighterToggle<CR>", desc = "toggle display color preview css" },
      { "<leader>cp", "<CMD>CccPick<CR>", desc = "color picker css" },
      { "<leader>cC", "<CMD>CccConvert<CR>", desc = "convert to other color's type" },
    },
  },
  {
    "xiyaowong/transparent.nvim",
    event = "VeryLazy",
    enabled = true,
    keys = { { "<f1>", "<CMD>TransparentToggle<CR>", desc = "toggle Transparent bg" } },
  },
  {
    "folke/noice.nvim",
    enabled = true,
    opts = {
      lsp = { progress = { enabled = false } },
      messages = { enabled = false },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
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
    "folke/zen-mode.nvim",
    enabled = true,
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
        transparent = { enabled = true },
      },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    enabled = true,
    event = "VeryLazy",
    keys = {
      {
        "ss",
        "<esc><cmd>lua require('spectre').open_visual()<CR>",
        { desc = "Search current word (spectre)", mode = "v" },
      },
      {
        "<leader>ss",
        "<CMD> lua require('spectre').open_visual({select_word=true})<CR>",
        { desc = "Search current word" },
      },
      {
        "<leader>sf",
        "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
        { desc = "Search on current file" },
      },
    },
  },
}
