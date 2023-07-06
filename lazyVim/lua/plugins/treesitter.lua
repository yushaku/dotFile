return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "windwp/nvim-ts-autotag" },
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
      })
      return vim.tbl_deep_extend("force", opts, {
        autotag = {
          enable = true,
        },
      })
    end,
  },
  {
    "ckolkey/ts-node-action",
    enable = true,
    dependencies = { "nvim-treesitter" },
    keys = {
      { "<leader>ct", "<CMD>:NodeAction<CR>", desc = "Trigger node action" },
    },
  },
}
