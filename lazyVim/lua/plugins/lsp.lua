return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- formatter and linter
        "shfmt", -- A shell (sh/bash/mksh).
        "prettierd", -- prettier server formatter
        "fixjson", -- A JSON file fixer/formatter for humans using JSON5.
        "eslint-lsp", -- Language Server Protocol implementation for ESLint

        -- Language Server Protocol
        "docker-compose-language-service",
        "tailwindcss-language-server",

        -- blockchain and smart contracts
        -- "nomicfoundation-solidity-language-server",
      },
    },
  },
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
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "<leader>ss", false, desc = "remove find lsp symbol" },
            { "<leader>sS", false, desc = "remove find workspace symbol" },
          },
        },
      },
    },
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
