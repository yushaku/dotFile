require("telescope").load_extension("noice")

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          i = {
            ["<M-j>"] = "move_selection_next",
            ["<M-k>"] = "move_selection_previous",
            ["<esc>"] = "close",
          },
        },
      },
    },
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
      { "<leader>ff", false },
      { "<leader>fb", false },
      { "<leader>fn", false },
      { "<leader>gc", false },
      { "<leader>gs", false },

      -- create my own config
      { "<C-p>", LazyVim.pick("files"), desc = "Find files in child project" },
      { "<C-A-P>", LazyVim.pick("files", { root = false }), desc = "Find files in parent project" },
      { "<leader>ft", "<CMD>TodoTelescope<cr>", desc = "Open todo list by telescope" },
      { "<leader>fm", "<CMD>Telescope marks<cr>", desc = "Open marks" },
      { "<leader>fr", "<CMD>Telescope resume<cr>", desc = "resume privious search result" },
    },
  },
}
