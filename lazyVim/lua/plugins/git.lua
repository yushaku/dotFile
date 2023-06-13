return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = ">" },
        topdelete = { text = ">" },
        changedelete = { text = "▎" },
        untracked = { text = "┆" },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

      -- stylua: ignore start
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")
      map("n", "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Add Hunk to Stagging")
      map("n", "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Remove Hunk to Stagging")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")

      map("n", "<leader>ga", gs.stage_buffer, "Add file to Stagging ")
      map("n", "<leader>gr", gs.reset_buffer, "Remove file from Stagging")

      map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gd", "<CMD>:DiffviewOpen<CR>", desc = "open git diff" },
      { "<leader>gq", "<CMD>:DiffviewClose<CR>", desc = "quit git diff" },
      { "<leader>ge", "<CMD>:DiffviewToggleFiles<CR>", desc = "open changed files" },
      { "<leader>gt", "<CMD>:DiffviewFileHistory<CR>", desc = "open git diff history" },
    },
  },
}
