return {
  {
    "folke/flash.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = { jump = { autojump = true }, label = { uppercase = false, reuse = "none" } },
  },
  {
    "phaazon/hop.nvim",
    enabled = true,
    opts = { keys = "asdfghjklqwertyuiopzxcvbnm" },
    keys = {
      { "<leader>k", "<CMD>HopLineStartBC<CR>", desc = "jump line up", mode = { "n", "v" } },
      { "<leader>j", "<CMD>HopLineStartAC<CR>", desc = "jump line down", mode = { "n", "v" } },
      { "<leader>l", "<CMD>:HopWordCurrentLineAC<CR>", desc = "jump down in current line ", mode = { "n", "v" } },
      { "<leader>h", "<CMD>:HopWordCurrentLineBC<CR>", desc = "jump up in current line down", mode = { "n", "v" } },

      { "gb", "<CMD>:HopWordBC<CR>", desc = "jump backward every where" },
      { "ge", "<CMD>:HopWordAC<CR>", desc = "jump forward every where" },

      -- { "<leader><leader>w", "<CMD>:HopPatternBC<CR>", desc = "jump to pattern backword every where" },
      -- { "<leader><leader>W", "<CMD>:HopPatternAC<CR>", desc = "jump to pattern forward every where" },
      -- { "gb", "<CMD>:HopPatternBC<CR>", desc = "jump to pattern backword every where" },
      -- { "ge", "<CMD>:HopPatternAC<CR>", desc = "jump to pattern forward every where" },

      { "sf", "<CMD>:HopChar2<CR>", desc = "jump to 2 char every where" },
      { "ss", "<CMD>:HopWord<CR>", desc = "jump to word every where" },

      { "f", "<CMD>:HopChar1AC<CR>", desc = "jump to char forward every where", mode = { "n", "v" } },
      { "F", "<CMD>:HopChar1BC<CR>", desc = "jump to char backword every where", mode = { "n", "v" } },
      {
        "t",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_char1({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
        end,
        mode = { "n", "v" },
      },
      {
        "T",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_char1({ direction = directions.BEFORE_CURSOR, hint_offset = 1 })
        end,
        mode = { "n", "v" },
      },
    },
  },
}
