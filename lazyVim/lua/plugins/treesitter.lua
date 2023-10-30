return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
    event = { "BufReadPre" },
    commit = "6847ce4f8c93a0c8fd5a3d4df08975ab185187eb",
    opts = function(_, opts)
      opts.textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["il"] = "@loop.inner",
            ["al"] = "@loop.outer",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "goto next function" },
            ["]c"] = { query = "@class.outer", desc = "goto next class" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", desc = "goto next end of function" },
            ["]C"] = { query = "@class.outer", desc = "goto next end of class" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", desc = "goto previous function" },
            ["[c"] = { query = "@class.outer", desc = "goto previous class" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@function.outer", desc = "goto previous end of function" },
            ["[C"] = { query = "@class.outer", desc = "goto previous end of class" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["]a"] = "@parameter.inner",
          },
          swap_previous = {
            ["[a"] = "@parameter.inner",
          },
        },
      }
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "tsx",
        "typescript",
        "yaml",
        "solidity",
      })
      return vim.tbl_deep_extend("force", opts, {
        autotag = { enable = true },
      })
    end,
  },
  {
    "mini.ai",
    enabled = true,
    opts = function()
      local ai = require("mini.ai")
      return {
        custom_textobjects = {
          c = ai.gen_spec.treesitter(
            { a = { "@class.outer", "@comment.outer" }, i = { "@class.inner", "@comment.inner" } },
            {}
          ),
        },
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
  },
  {
    "Wansmer/treesj",
    enabled = true,
    keys = {
      {
        "<leader>m",
        function()
          require("treesj").toggle()
        end,
        desc = "Split if one-line and join if multiline",
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    enabled = true,
  },
}
