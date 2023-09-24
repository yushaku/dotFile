return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
      -- table.insert(opts.sources, nls.builtins.code_actions.ts_node_action)
      -- table.insert(opts.sources, nls.builtins.diagnostics.write_good)
      -- table.insert(opts.sources, nls.builtins.code_actions.cspell)
      table.insert(opts.sources, nls.builtins.code_actions.eslint)
      -- table.insert(opts.sources, nls.builtins.code_actions.gitsigns)
      -- table.insert(opts.sources, require("typescript.extensions.null-ls.code-actions"))
    end,
  },
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
      },
      setup = {
        eslint = function()
          require("lazyvim.util").on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,

        tsserver = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            if client.name == "tsserver" then
              vim.keymap.set(
                "n",
                "<leader>co",
                "<cmd>TypescriptOrganizeImports<CR>",
                { buffer = buffer, desc = "Organize Imports" }
              )
              vim.keymap.set(
                "n",
                "<S-M-o>",
                "<cmd>TypescriptRemoveUnused<CR>",
                { buffer = buffer, desc = "Remove unused" }
              )
              vim.keymap.set(
                "n",
                "<S-M-i>",
                "<cmd>TypescriptAddMissingImports<CR>",
                { buffer = buffer, desc = "Add missing import" }
              )
            end
          end)
          require("typescript").setup({ server = opts })
          return true
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
