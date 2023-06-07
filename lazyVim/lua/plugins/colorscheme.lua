return {
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
}
