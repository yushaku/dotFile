return {
  { "christoomey/vim-tmux-navigator", enabled = true },
  { "echasnovski/mini.indentscope", enabled = true },
  { "echasnovski/mini.surround", opts = { mappings = { add = "sa", delete = "sd", replace = "sc" } } },
  {
    "echasnovski/mini.animate",
    enabled = false,
    opts = function()
      local animate = require("mini.animate")
      return {
        cursor = { enable = true, timing = animate.gen_timing.linear({ duration = 50, unit = "total" }) },
        resize = { enable = false },
        open = { enable = false },
        close = { enable = false },
      }
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    enabled = true,
    keys = { { "<leader>o", "<CMD>:SymbolsOutline<CR>", { desc = "toggle outlne" } } },
    opts = {
      position = "right",
      autofold_depth = 2,
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
      symbols = {
        File = { icon = "", hl = "@text.uri" },
        Module = { icon = "󰕳", hl = "@namespace" },
        Namespace = { icon = "", hl = "@namespace" },
        Package = { icon = "", hl = "@namespace" },
        Class = { icon = "𝓒", hl = "@type" },
        Method = { icon = "ƒ", hl = "@method" },
        Property = { icon = "", hl = "@method" },
        Field = { icon = "󰽐", hl = "@field" },
        Constructor = { icon = "", hl = "@constructor" },
        Enum = { icon = "ℰ", hl = "@type" },
        Interface = { icon = "", hl = "@type" },
        Function = { icon = "", hl = "@function" },
        Variable = { icon = "", hl = "@constant" },
        Constant = { icon = "", hl = "@constant" },
        String = { icon = "𝓐", hl = "@string" },
        Number = { icon = "#", hl = "@number" },
        Boolean = { icon = "⊨", hl = "@boolean" },
        Array = { icon = "", hl = "@constant" },
        Object = { icon = "⦿", hl = "@type" },
        Null = { icon = "󰟢", hl = "@type" },
        EnumMember = { icon = "", hl = "@field" },
        Struct = { icon = "𝓢", hl = "@type" },
        Event = { icon = "", hl = "@type" },
        Operator = { icon = "+", hl = "@operator" },
        TypeParameter = { icon = "𝙏", hl = "@parameter" },
        Component = { icon = "󰜜", hl = "@function" },
        Fragment = { icon = "󰊱", hl = "@constant" },
      },
    },
  },
  -- {
  --   "uga-rosa/ccc.nvim",
  --   enabled = false,
  --   event = "VeryLazy",
  --   keys = {
  --     -- { "<leader>cc", "<CMD>CccHighlighterToggle<CR>", desc = "toggle display color preview css" },
  --     { "<leader>cp", "<CMD>CccPick<CR>", desc = "color picker css" },
  --     { "<leader>cC", "<CMD>CccConvert<CR>", desc = "convert to other color's type" },
  --   },
  -- },
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
        lsp_doc_border = false, -- add a border to hover docs and signature help
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
      { "<leader>bs", "<CMD>BufferLineSortByTabs<CR>", desc = "sort buffer by tabs" },
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
  -- {
  --   "Pocco81/true-zen.nvim",
  --   enabled = false,
  --   event = "VeryLazy",
  --   keys = {
  --     { "<f2>", "<CMD>:TZAtaraxis<CR>", desc = "Toggle zen mode" },
  --     { "<leader>um", "<CMD>:TZFocus<CR>", desc = "Forcus current window" },
  --     { "<leader>uz", "'<,'>TZNarrow<CR>", desc = "Narrow current function", mode = { "v" } },
  --   },
  --   opts = {
  --     integrations = {
  --       tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
  --       twilight = false, -- enable twilight (ataraxis)
  --       lualine = true, -- hide nvim-lualine (ataraxis)
  --     },
  --   },
  --   config = function(_, opts)
  --     require("true-zen").setup(opts)
  --   end,
  -- },
  {
    "folke/trouble.nvim",
    enabled = true,
    opts = {
      position = "right",
      action_keys = { close = { "q", "<esc>" }, open_split = { "s" } },
    },
    keys = {
      {
        "<leader>xx",
        function()
          require("trouble").toggle()
        end,
        desc = "Trouble toggle",
      },
      {
        "<leader>xw",
        function()
          require("trouble").toggle("workspace_diagnostics")
        end,
        desc = "Trouble workspace diagnostics",
      },
      {
        "<leader>xd",
        function()
          require("trouble").toggle("document_diagnostics")
        end,
        desc = "Trouble document diagnostics",
      },
      {
        "<leader>xq",
        function()
          require("trouble").toggle("quickfix")
        end,
        desc = "Trouble toggle quickfix",
      },
      {
        "<leader>xl",
        function()
          require("trouble").toggle("loclist")
        end,
        desc = "Trouble toggle loclist",
      },
    },
  },
}
