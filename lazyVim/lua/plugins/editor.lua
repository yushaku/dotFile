return {
  { "mg979/vim-visual-multi", enabled = false },
  { "christoomey/vim-tmux-navigator", enabled = true },
  {
    "brenoprata10/nvim-highlight-colors",
    enabled = true,
    opts = {
      ---Render style
      ---@usage 'background'|'foreground'|'virtual'
      render = "virtual",

      ---Set virtual symbol (requires render to be set to 'virtual')
      virtual_symbol = "■",

      ---Set virtual symbol suffix (defaults to '')
      virtual_symbol_prefix = "",

      ---Set virtual symbol suffix (defaults to ' ')
      virtual_symbol_suffix = " ",

      ---Set virtual symbol position()
      ---@usage 'inline'|'eol'|'eow'
      ---inline mimics VS Code style
      ---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
      ---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
      virtual_symbol_position = "inline",

      ---Highlight hex colors, e.g. '#FFFFFF'
      enable_hex = true,

      ---Highlight short hex colors e.g. '#fff'
      enable_short_hex = true,

      ---Highlight rgb colors, e.g. 'rgb(0 0 0)'
      enable_rgb = true,

      ---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
      enable_hsl = true,

      ---Highlight CSS variables, e.g. 'var(--testing-color)'
      enable_var_usage = true,

      ---Highlight named colors, e.g. 'green'
      enable_named_colors = true,

      ---Highlight tailwind colors, e.g. 'bg-blue-500'
      enable_tailwind = true,

      ---Set custom colors
      ---Label must be properly escaped with '%' to adhere to `string.gmatch`
      --- :help string.gmatch
      custom_colors = {
        { label = "%-%-theme%-primary%-color", color = "#0f1219" },
        { label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
      },

      -- Exclude filetypes or buftypes from highlighting e.g. 'exclude_buftypes = {'text'}'
      exclude_filetypes = { "toml" },
      exclude_buftypes = {},
    },
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
  {
    "xiyaowong/transparent.nvim",
    enabled = false,
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
