return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  opts = {
    pickers = {
      live_grep = {
        find_command = { "rg", "--hidden" },
      },
    },
  },
  keys = {
    -- remove deault config of telescope
    { "<leader><space>", false },
    { "<leader>sh", false },
    { "<leader>sH", false },
    { "<leader>sk", false },
    { "<leader>sT", false },
    { "<leader>so", false },
    { "<leader>sM", false },
    { "<leader>sa", false },
    { "<leader>ss", false },
    { "<leader>sS", false },
    { "<leader>sC", false },
    { "<leader>sR", false },
    { "<leader>sd", false },
    { "<leader>sD", false },
    { "<leader>sg", false },
    { "<leader>sG", false },
    { "<leader>fe", false },
    { "<leader>fE", false },
    { "<leader>ft", false },
    { "<leader>fT", false },

    -- create my own config
    { "<C-p>", "<CMD>Telescope find_files<CR>", desc = "Find Files (root dir)" },
    { "<leader>ft", "<CMD>TodoTelescope<cr>", desc = "Open todo list by telescope" },
    { "<leader>fr", "<CMD>Telescope resume<cr>", desc = "resume privious search result" },
  },
}
