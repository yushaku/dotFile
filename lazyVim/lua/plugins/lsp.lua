return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = {
        "<leader>ss",
        function()
          Snacks.picker.lsp_symbols({
            finder = "lsp_symbols",
            format = "lsp_symbol",
            tree = true,
            filter = {
              default = {
                "Class",
                "Constructor",
                -- "Enum",
                -- "Field",
                "Function",
                "Interface",
                "Method",
                -- "Module",
                -- "Namespace",
                -- "Package",
                -- "Property",
                -- "Struct",
                -- "Trait",
              },
              -- set to `true` to include all symbols
              markdown = true,
              help = true,
            },
          })
        end,
      }
    end,
    -- opts = {
    --   inlay_hints = { enabled = false },
    --   servers = {
    --     tailwindcss = { filetypes_exclude = { "markdown", "javascript", "typescript", "solidity" } },
    --     ts_ls = { enabled = false },
    --   },
    -- },
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
