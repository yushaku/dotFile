return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  opts = {
    ensure_installed = {
      "eslint-lsp",
      "shfmt",
      "prettier",
      "prettierd",
      "fixjson",
      "json-lsp",
      "stylua",
      "lua-language-server",
      "docker-compose-language-service",
      "typescript-language-server",
      "tailwindcss-language-server",
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
