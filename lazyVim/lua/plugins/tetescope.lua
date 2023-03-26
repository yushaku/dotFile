return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  keys = {
    { "<C-p>", "<CMD>:Telescope find_files<CR>", desc = "Find Files (root dir)" },
    { "<leader>co", "<CMD>:Telescope lsp_outgoing_calls<CR>", desc = "Lists LSP outgoing calls" },
    { "<leader>ci", "<CMD>:Telescope lsp_incoming_calls<CR>", desc = "Lists LSP incoming calls" },
  },
}
