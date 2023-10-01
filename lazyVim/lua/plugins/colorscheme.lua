return {
  {
    "LazyVim/LazyVim",
    -- catppuccin-frappe | catppuccin-mocha | catppuccin-macchiato
    -- tokyonight-storm
    opts = { colorscheme = "tokyonight-storm" },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = false,
      terminal_colors = true,
      style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      styles = {
        floats = "transparent",
        sidebars = "transparent",
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true, italic = true },
      },
      dim_inactive = false, -- dims inactive windows
      lualine_bold = true,
      on_highlights = function(hl, c)
        hl.DiagnosticUnnecessary = {
          fg = c.comment,
        }
      end,
    },
  },
  {
    "catppuccin/nvim",
    enabled = false,
    name = "frappe",
    priority = 1000,
    opts = {
      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        mini = true,
        hop = true,
        neotest = true,
        noice = true,
        indent_blankline = { enabled = true, colored_indent_levels = true },
        neotree = true,
        lsp_saga = true,
        semantic_tokens = true,
        telescope = true,
        which_key = true,
      },
      dim_inactive = {
        enabled = true,          -- dims the background color of inactive window
        shade = "dark",
        percentage = 10,         -- percentage of the shade to apply to the inactive window
      },
      styles = {                 -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        functions = { "bold" },
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
    },
  },
}
