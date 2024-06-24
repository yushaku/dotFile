vim.g.trouble_lualine = false

return {
  "folke/trouble.nvim",
  enabled = false,
  opts = {
    position = "right",
    size = { width = 0.3 },
    action_keys = { close = { "q", "<esc>" }, open_split = { "s" } },
    modes = {
      keys = { l = "fold_open", h = "fold_close" },
      symbols = {
        desc = "document symbols",
        mode = "lsp_document_symbols",
        focus = true,
        filter = {
          any = {
            ft = { "help", "markdown" },
            kind = {
              "Class",
              "Constructor",
              "Field",
              "Function",
              "Method",
            },
          },
        },
      },
    },
  },
}
