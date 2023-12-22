return {
  -- pop up an block to display message
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/neodev.nvim", enabled = false },
  { "mini.comment", enabled = false },
  { "ggandor/flit.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "folke/neoconf.nvim", enabled = false },
  { "persistence.nvim", enabled = false },
  { "goolord/alpha-nvim", enabled = false },
  { "dstein64/vim-startuptime", enabled = false },
  {
    "folke/trouble.nvim",
    enabled = true,
    opts = {
      position = "right",
      action_keys = { close = { "q", "<esc>" }, open_split = { "s" } },
    },
    keys = {
      {
        "<leader>xx",
        function()
          require("trouble").toggle()
        end,
        desc = "Trouble toggle",
      },
      {
        "<leader>xw",
        function()
          require("trouble").toggle("workspace_diagnostics")
        end,
        desc = "Trouble workspace diagnostics",
      },
      {
        "<leader>xd",
        function()
          require("trouble").toggle("document_diagnostics")
        end,
        desc = "Trouble document diagnostics",
      },
      {
        "<leader>xq",
        function()
          require("trouble").toggle("quickfix")
        end,
        desc = "Trouble toggle quickfix",
      },
      {
        "<leader>xl",
        function()
          require("trouble").toggle("loclist")
        end,
        desc = "Trouble toggle loclist",
      },
    },
  },
}
