return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "gr", false }
      keys[#keys + 1] = { "gy", false }
      keys[#keys + 1] = { "gD", false }
      keys[#keys + 1] = { "<leader>cd", false }
    end,
    opts = {
      servers = {
        tailwindcss = { filetypes_exclude = { "markdown", "javascript", "typescript", "solidity" } },
        eslint = { settings = { workingDirectory = { mode = "auto" } } },
        tsserver = {
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
            {
              "<S-M-i>",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.addMissingImports.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Add missing import",
            },
            {
              "<S-M-o>",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.removeUnused.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Remove unused imports",
            },
            {
              "<leader>cu",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.fixAll.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "fixes a couple of specific issues",
            },
          },
          settings = {
            typescript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            javascript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            completions = { completeFunctionCalls = true },
          },
        },
      },
    },
  },
  {
    "glepnir/lspsaga.nvim",
    enabled = true,
    event = "LspAttach",
    opts = {
      ui = {
        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
      },
    },
    config = function()
      require("lspsaga").setup({
        outline = {
          auto_preview = false,
          keys = { toggle_or_jump = "h", quit = { "q", "<ESC>" }, jump = { "<CR>", "o" } },
        },
        symbol_in_winbar = { enable = false },
        finder = { keys = { toggle_or_open = { "<CR>", "o" }, quit = { "q", "<ESC>" } } },
        lightbulb = { enable = false, icon = "" },
        code_action = { enable = true, command_enable = true },
        Callhierarchy = {
          enable = true,
          command_enable = true,
          keys = { toggle_or_open = { "<CR>", "o" }, quit = { "q", "<ESC>" } },
        },
      })
      local keymap = vim.keymap.set
      keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
      keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
      keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
      keymap("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>")
      keymap("n", "gr", "<Cmd>Lspsaga finder<CR>")
      keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "show diagnostic in current line" })
      keymap("n", "<leader>ut", "<cmd>Lspsaga winbar_toggle<CR>", { desc = "toggle winbar" })

      keymap("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Outgoing calls this function" })
      keymap("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Incoming calls this function" })

      -- keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
      -- keymap({ "n", "t", "v" }, "<A-q>", "<cmd>Lspsaga term_toggle<CR>")
    end,
  },
}
