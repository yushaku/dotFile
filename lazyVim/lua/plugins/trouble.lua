vim.g.trouble_lualine = true

return {
  "folke/trouble.nvim",
  enabled = true,
  opts = {
    -- win = {
    -- width = 0.3,
    -- position = "right",
    -- },
    focus = true,
    pinned = true,
    action_keys = {
      close = { "q", "<esc>" },
      open_split = { "s" },
    },
    modes = {
      keys = {
        l = "fold_open",
        h = "fold_close",
      },
      symbols = {
        desc = "document Outline",
        mode = "lsp_document_symbols",
        focus = true,
        format = "{kind_icon} {symbol.name}",
        filter = {
          any = {
            ft = { "help", "markdown" },
            kind = {
              "Class",
              "Constructor",
              "Enum",
              "Field",
              "Interface",
              "Function",
              "Method",
              -- "Module",
              -- "Namespace",
              -- "Package",
              -- "Property",
              "Struct",
              "Trait",
            },
          },
        },
      },
    },
  },
  keys = {
    { "<leader>xL", false },
    { "<leader>xQ", false },
    { "<leader>xS", false },
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "[Trouble] Show All Diagnostics",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "[Trouble] Diagnostics on current Buffer",
    },
    {
      "<leader>xb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "[Trouble] Diagnostics of current Buffer",
    },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "[Trouble] Toggle comment tags " },
    {
      "<leader>xT",
      "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
      desc = "[Trouble] comment Todo/Fix/Fixme",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "[Trouble] Outline",
    },
    {
      "<leader>xl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "[Trouble] Location List",
    },
    {
      "<leader>xq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "[Trouble] Quickfix List",
    },
  },
}
