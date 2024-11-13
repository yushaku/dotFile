return {
  { "christoomey/vim-tmux-navigator", enabled = true },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = { scope = { enabled = true } },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "as",
        delete = "ds",
        replace = "cs",
        find = "",
        find_left = "",
        highlight = "",
        update_n_lines = "",
      },
    },
  },
  { "mg979/vim-visual-multi", enabled = true },
  {
    "xiyaowong/transparent.nvim",
    enabled = true,
    keys = { { "<f1>", "<CMD>TransparentToggle<CR>", desc = "toggle Transparent bg" } },
  },
  {
    "folke/noice.nvim",
    enabled = true,
    opts = {
      lsp = { progress = { enabled = true } },
      messages = { enabled = false },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>b1", "<CMD>BufferLineGoToBuffer 1<CR>", desc = "go to first buffer" },
      { "<leader>b2", "<CMD>BufferLineGoToBuffer 2<CR>", desc = "go to second buffer" },
      { "<leader>b3", "<CMD>BufferLineGoToBuffer 3<CR>", desc = "go to third buffer" },
      { "<leader>b4", "<CMD>BufferLineGoToBuffer 4<CR>", desc = "go to fourth buffer" },
      { "<leader>bl", "<CMD>BufferLineCloseRight<CR>", desc = "close all buffer to the right" },
      { "<leader>bh", "<CMD>BufferLineCloseLeft<CR>", desc = "close all buffer to the left" },
    },
  },
  {
    "folke/zen-mode.nvim",
    enabled = true,
    keys = { { "<leader>z", "<CMD>ZenMode<CR>", desc = "Toggle zen mode" } },
    opts = {
      window = {
        width = 120,
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
        options = { enabled = true, laststatus = 0 }, -- turn off the statusline in zen mode (on = 3)
        gitsigns = { enabled = false },
        bufferline = { enabled = false },
        tmux = { enabled = true },
        transparent = { enabled = true },
      },
    },
  },
}
