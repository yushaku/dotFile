return {
  {
    "MagicDuck/grug-far.nvim",
    enabled = true,
    cmd = "GrugFar",
    opts = {
      headerMaxWidth = 120,
      disableBufferLineNumbers = true,
      resultLocation = {
        -- (for instance `3<enter>` would goto the third result's location)
        showNumberLabel = true,
        numberLabelPosition = "right_align",
        numberLabelFormat = " [%d]",
      },
      transient = true,
      keymaps = {
        close = { n = "q" },
        refresh = { n = "r" }, -- refresh search result
        syncLocations = { n = "s" }, --replace all
        -- replace = { n = "r" }, -- replace all
        syncLine = { n = "l" }, -- replace line
        openLocation = { n = "h" }, -- view localtion not jump
        gotoLocation = { n = "<enter>" }, -- jump to location
        historyOpen = { n = "t" }, -- open search history
        applyNext = { n = "<leader>j" },
        applyPrev = { n = "<leader>k" },

        openNextLocation = { n = "<down>" },
        openPrevLocation = { n = "<up>" },
        historyAdd = { n = "<localleader>a" },
        swapEngine = { n = "<localleader>e" },
      },
    },
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "[GrugFar] Search and Replace",
      },
      {
        "<leader>sf",
        function()
          require("grug-far").open({
            prefills = {
              paths = vim.fn.expand("%"),
              search = vim.fn.expand("<cword>"),
            },
          })
        end,
        mode = { "n", "v" },
        desc = "[GrugFar] Search and Replace on this file",
      },
      {
        "<leader>ss",
        function()
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          require("grug-far").open({
            prefills = {
              search = vim.fn.expand("<cword>"),
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "[GrugFar] Search this word with same file type",
      },
      {
        "<leader>sa",
        function()
          require("grug-far").open({
            prefills = { search = vim.fn.expand("<cword>") },
          })
        end,
        mode = { "n", "v" },
        desc = "[GrugFar] Search this word globally",
      },
    },
  },
}
