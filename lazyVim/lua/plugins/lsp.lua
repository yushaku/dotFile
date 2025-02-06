return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        tailwindcss = { filetypes_exclude = { "markdown", "javascript", "typescript", "solidity" } },
        ts_ls = { enabled = false },
      },
    },
  },
  {
    "typed-rocks/ts-worksheet-neovim",
    enabled = true,
    opts = {
      severity = vim.diagnostic.severity.WARN,
    },
    config = function(_, opts)
      require("tsw").setup(opts)
    end,
    keys = {
      {
        "<leader>ro",
        "<CMD>:Tsw rt=bun show_variables=true show_order=true<CR>",
        desc = "[TS-worksheet] run on this file with order",
      },
      {
        "<leader>rr",
        "<CMD>:Tsw rt=bun show_variables=true show_order=false<CR>",
        desc = "[TS-worksheet] run on this file",
      },
    },
  },
}
