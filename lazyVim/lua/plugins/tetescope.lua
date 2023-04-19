return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  keys = {
    { "<C-p>", "<CMD>Telescope find_files<CR>", desc = "Find Files (root dir)" },
    { "<leader>ft", "<CMD>TodoTelescope<cr>", desc = "Open todo list by telescope" },
    { "<leader>fr", "<CMD>Telescope resume<cr>", desc = "resume privious search result" },
  },
}
