return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "windwp/nvim-ts-autotag" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
    event = { "BufReadPre" },
    commit = "6847ce4f8c93a0c8fd5a3d4df08975ab185187eb",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "help",
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
        autotag = {
          enable = true,
        },
      })
    end,
  },
  {
    "mini.ai",
    opts = function()
      local ai = require("mini.ai")
      return {
        custom_textobjects = {
          c = ai.gen_spec.treesitter(
            { a = { "@class.outer", "@comment.outer" }, i = { "@class.inner", "@comment.inner" } }, {}
          ),
          l = ai.gen_spec.treesitter(
            { a = { "@loop.outer", "@conditional.outer" }, i = { "@loop.inner", "@conditional.inner" } }, {}
          ),
        },
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
  },
}
