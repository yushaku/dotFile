return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["javascript"] = { { "prettierd", } },
        ["javascriptreact"] = { { "prettierd", } },
        ["typescript"] = { { "prettierd", } },
        ["typescriptreact"] = { { "prettierd", } },
        ["css"] = { { "prettierd", } },
        ["scss"] = { { "prettierd", } },
        ["html"] = { { "prettierd", } },
        ["json"] = { { "prettierd", } },
        ["jsonc"] = { { "prettierd", } },
        ["yaml"] = { { "prettierd", } },
        ["markdown"] = { { "prettierd", } },
        ["markdown.mdx"] = { { "prettierd", } },
        ["graphql"] = { { "prettierd", } },
        ["handlebars"] = { { "prettierd", } },
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
      -- table.insert(opts.sources, nls.builtins.code_actions.ts_node_action)
      -- table.insert(opts.sources, nls.builtins.diagnostics.write_good)
      -- table.insert(opts.sources, nls.builtins.code_actions.cspell)
      -- table.insert(opts.sources, nls.builtins.code_actions.eslint)
      -- table.insert(opts.sources, nls.builtins.code_actions.gitsigns)
      -- table.insert(opts.sources, require("typescript.extensions.null-ls.code-actions"))
    end,
  },
}
