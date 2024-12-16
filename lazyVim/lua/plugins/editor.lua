return {
  { "christoomey/vim-tmux-navigator", enabled = true },
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
}
