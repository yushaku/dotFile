return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
      table.insert(opts.sources, require("typescript.extensions.null-ls.code-actions"))
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
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
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "shfmt", -- A shell formatter (sh/bash/mksh).
        "prettier",
        "prettierd",
        "fixjson", -- A JSON file fixer/formatter for humans using JSON5.
        "json-lsp",
        "stylua", -- An opinionated Lua code formatter.
        "lua-language-server",
        "eslint-lsp", -- Language Server Protocol implementation for ESLint
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
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "gd", false }
      keys[#keys + 1] = { "gr", false }
      keys[#keys + 1] = { "gy", false }
      keys[#keys + 1] = { "<leader>cd", false }
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    enabled = true,
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        outline = {
          win_position = "right",
          keys = {
            expand_or_jump = "<CR>",
            quit = "q",
          },
        },
      })
      local keymap = vim.keymap.set

      -- Code action
      keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

      -- Peek definition
      -- You can edit the file containing the definition in the floating window
      -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
      -- Use <C-t> to jump back
      keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

      -- Go to definition
      keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

      -- LSP finder - Find the symbol's definition
      -- If there is no definition, it will instead be hidden
      -- When you use an action in finder like "open vsplit",
      -- you can use <C-t> to jump back
      keymap("n", "gf", "<Cmd>Lspsaga lsp_finder<CR>")

      -- Peek type definition
      -- You can edit the file containing the type definition in the floating window
      -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
      -- It also supports tagstack
      -- Use <C-t> to jump back
      keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

      -- Go to type definition
      keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

      -- Show line diagnostics
      keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>")

      -- Toggle outline
      keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

      -- If you want to keep the hover window in the top right hand corner,
      keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

      -- Toggle floating terminal
      keymap({ "n", "t" }, "<A-q>", "<cmd>Lspsaga term_toggle<CR>")
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
}
