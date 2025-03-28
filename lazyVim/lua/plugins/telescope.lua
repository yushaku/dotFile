return {
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      -- remove deault config of telescope
      { "<leader><space>", false },
      { "<leader>sh", false },
      { '<leader>s"', false },
      { "<leader>sH", false },
      { "<leader>sk", false },
      { "<leader>so", false },
      { "<leader>sM", false },
      { "<leader>sa", false },
      { "<leader>ss", false },
      { "<leader>sb", false },
      { "<leader>sl", false },
      { "<leader>sq", false },
      { "<leader>sj", false },
      { "<leader>sS", false },
      { "<leader>sC", false },
      { "<leader>sc", false },
      { "<leader>sR", false },
      { "<leader>sd", false },
      { "<leader>fg", false },
      { "<leader>sD", false },
      { "<leader>sg", false },
      { "<leader>sW", false },
      { "<leader>sw", false },
      { "<leader>sm", false },
      { "<leader>sG", false },
      { "<leader>fT", false },
      { "<leader>ft", false },
      { "<leader>ff", false },
      { "<leader>fb", false },
      { "<leader>fn", false },
      { "<leader>gc", false },
      { "<leader>gs", false },

      -- create my own config
      { "<C-p>", LazyVim.pick("files"), desc = "Find files in child project" },
      { "<C-A-P>", LazyVim.pick("files", { root = false }), desc = "Find files in parent project" },
    },
  },
}
