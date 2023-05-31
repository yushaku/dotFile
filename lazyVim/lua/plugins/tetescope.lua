return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  opts = {
    pickers = {
      live_grep = {
        find_command = { "rg", "--hidden" },
      },
      find_files = {
        file_ignore_patterns = { "*.git/*" }, -- Exclude git directories
        hidden = true, -- Include hidden files
        search_dirs = { "/path/to/your/search/directory" }, -- Specify the directory to search in
        file_type = { "env" }, -- Specify the file type to search for
      },
    },
  },
  keys = {
    { "<C-p>", "<CMD>Telescope find_files<CR>", desc = "Find Files (root dir)" },
    { "<leader>ft", "<CMD>TodoTelescope<cr>", desc = "Open todo list by telescope" },
    { "<leader>fr", "<CMD>Telescope resume<cr>", desc = "resume privious search result" },
  },
}
