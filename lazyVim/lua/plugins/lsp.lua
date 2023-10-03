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
        tailwindcss = {
          filetypes_exclude = { "markdown", "javascript", "typescript", "solidity" },
        },
        eslint = {
          settings = { workingDirectory = { mode = "auto" } },
        },
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
              desc = "Add missing import",
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
      setup = {
        eslint = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
              if not require("lazyvim.plugins.lsp.format").enabled() then
                -- exit early if autoformat is not enabled
                return
              end
              local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
              if client then
                local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #diag > 0 then
                  vim.cmd("EslintFixAll")
                end
              end
            end,
          })
        end,

        tailwindcss = function(_, opts)
          local tw = require("lspconfig.server_configurations.tailwindcss")
          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, tw.default_config.filetypes)
        end,
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
      })
      local keymap = vim.keymap.set
      keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
      keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
      keymap("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>")
      keymap("n", "gf", "<Cmd>Lspsaga finder<CR>")
      keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>")

      -- keymap("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
      -- keymap("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
      -- keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
      keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
      keymap({ "n", "t", "v" }, "<A-q>", "<cmd>Lspsaga term_toggle<CR>")
    end,
  },
}
