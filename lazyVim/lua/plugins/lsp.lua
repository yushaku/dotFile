return {
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        ["<M-j>"] = { "select_next" },
        ["<M-k>"] = { "select_prev" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<leader>ss", false }
      keys[#keys + 1] = { "<leader>sS", false }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        tailwindcss = {
          filetypes_exclude = { "markdown", "javascript", "typescript", "solidity" },
        },
      },
    },
  },
  {
    "typed-rocks/ts-worksheet-neovim",
    enabled = false,
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
