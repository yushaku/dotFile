return {
  {
    "MagicDuck/grug-far.nvim",
    enabled = true,
    opts = {
      headerMaxWidth = 120,
      disableBufferLineNumbers = true,
      transient = true,
      keymaps = {
        close = { n = "q" },
      },
    },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.grug_far({
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
      {
        "<leader>sf",
        function()
          require("grug-far").grug_far({
            prefills = { flags = vim.fn.expand("%") },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace on this file",
      },
      {
        "<leader>ss",
        function()
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          require("grug-far").grug_far({
            prefills = {
              search = vim.fn.expand("<cword>"),
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace this word",
      },
    },
  },
  -- {
  --   "nvim-pack/nvim-spectre",
  --   enabled = false,
  --   keys = {
  --     {
  --       "<leader>sr",
  --       "<cmd>lua require('spectre').toggle()<CR>",
  --       desc = "Spectre toggle",
  --     },
  --     {
  --       "<leader>ss",
  --       "<esc><cmd>lua require('spectre').open_visual()<CR>",
  --       desc = "Spectre search selected word",
  --       mode = { "v" },
  --     },
  --     {
  --       "<leader>ss",
  --       "<CMD>lua require('spectre').open_visual({select_word=true})<CR>",
  --       desc = "Spectre search current word",
  --     },
  --     {
  --       "<leader>sf",
  --       "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
  --       desc = "Spectre search on current file",
  --     },
  --   },
  -- },
}
