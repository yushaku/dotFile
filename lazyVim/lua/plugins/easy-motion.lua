return {
  "phaazon/hop.nvim",
  enabled = true,
  opts = { keys = "etovxqpdygfblzhckisuran" },
  keys = {
    { "<leader>k", "<CMD>HopLineStartBC<CR>", desc = "jump line up" },
    { "<leader>j", "<CMD>HopLineStartAC<CR>", desc = "jump line down" },
    { "<leader>l", "<CMD>:HopWordCurrentLineAC<CR>", desc = "jump down in current line " },
    { "<leader>h", "<CMD>:HopWordCurrentLineBC<CR>", desc = "jump up in current line down" },

    { "<leader><leader>b", "<CMD>:HopWordBC<CR>", desc = "jump backward every where" },
    { "<leader><leader>e", "<CMD>:HopWordAC<CR>", desc = "jump forward every where" },

    { "<leader><leader>w", "<CMD>:HopPatternBC<CR>", desc = "jump to pattern backword every where" },
    { "<leader><leader>W", "<CMD>:HopPatternAC<CR>", desc = "jump to pattern forward every where" },

    { "f", "<CMD>:HopChar1AC<CR>", desc = "jump to char forward every where" },
    { "F", "<CMD>:HopChar1BC<CR>", desc = "jump to char backword every where" },

    { "ss", "<CMD>:HopChar2<CR>", desc = "jump to 2 char every where" },
  },
}
