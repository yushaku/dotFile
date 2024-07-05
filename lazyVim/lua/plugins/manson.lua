return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- formatter and linter
      "shfmt", -- A shell (sh/bash/mksh).
      -- "stylua", -- for lua
      "prettierd", -- prettier server formatter
      "fixjson", -- A JSON file fixer/formatter for humans using JSON5.
      "eslint-lsp", -- Language Server Protocol implementation for ESLint

      -- Language Server Protocol
      -- "json-lsp",
      -- "lua-language-server",
      "docker-compose-language-service",
      "tailwindcss-language-server",
      -- "js-debug-adapter",
      -- "chrome-debug-adapter",

      -- blockchain and smart contracts
      "nomicfoundation-solidity-language-server",
      "solhint",
    },
  },
}
