return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  opts = {
    ensure_installed = {
      -- formatter and linter
      "shfmt", -- A shell (sh/bash/mksh).
      "stylua", -- for lua
      "prettierd", --js
      "fixjson", -- A JSON file fixer/formatter for humans using JSON5.
      "eslint-lsp", -- Language Server Protocol implementation for ESLint

      -- Language Server Protocol
      -- "json-lsp",
      "lua-language-server",
      "docker-compose-language-service",
      "typescript-language-server",
      "tailwindcss-language-server",
      -- "js-debug-adapter",
      -- "chrome-debug-adapter",

      -- blockchain and smart contracts
      -- "nomicfoundation-solidity-language-server",
      -- "solang",
      -- "solhint",
    },
  },
  ---@param opts MasonSettings | {ensure_installed: string[]}
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")
    for _, tool in ipairs(opts.ensure_installed) do
      local p = mr.get_package(tool)
      if not p:is_installed() then
        p:install()
      end
    end
  end,
}
