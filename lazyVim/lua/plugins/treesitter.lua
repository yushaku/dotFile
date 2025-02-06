return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre" },
    opts = function(_, opts)
      opts.textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["il"] = { query = "@loop.inner", desc = "Select inner loop" },
            ["al"] = { query = "@loop.outer", desc = "Select outer loop" },

            ["a="] = { query = "@assignment.outer", desc = "Select outer assignment" },
            ["i="] = { query = "@assignment.inner", desc = "Select inner assignment" },
            ["l="] = { query = "@assignment.lhs", desc = "Select left handside assignment" },
            ["r="] = { query = "@assignment.rhs", desc = "Select right handside assignment" },
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
            ["<leader>na"] = { query = "@parameter.inner", desc = "Swap parameter to next" },
            ["<leader>nf"] = { query = "@function.outer", desc = "Swap function to next" },
          },
          swap_previous = {
            ["<leader>pa"] = { query = "@parameter.inner", desc = "Swap parameter to previous" },
            ["<leader>pf"] = { query = "@function.outer", desc = "Swap function to previous" },
          },
        },
      }
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
    "nvim-treesitter/nvim-treesitter-context",
    enabled = true,
    keys = { { "<leader>z", "<CMD>TSContextToggle<CR>", desc = "Toggle TS-Context" } },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
