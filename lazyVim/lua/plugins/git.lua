return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "_" },
        topdelete = { text = "_" },
        changedelete = { text = "||" },
        untracked = { text = "┆" },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
        end

      -- stylua: ignore start
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")

      map('n', '<leader>ghd', gs.toggle_deleted, "toggle deleted")
      map("n", "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Add Hunk to Stagging")
      map("n", "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Remove Hunk to Stagging")

      map("n", "<leader>ga", gs.stage_buffer, "Add file to Stagging ")
      map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>gr", gs.reset_buffer, "Reset all changed in files")

      map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map({'o', 'x'}, 'ih', '<CMD>Gitsigns select_hunk<CR>')
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>gd", "<CMD>:DiffviewOpen<CR>", desc = "Open git diff" },
      { "<leader>gq", "<CMD>:DiffviewClose<CR>", desc = "Quit git diff" },
      { "<leader>ge", "<CMD>:DiffviewToggleFiles<CR>", desc = "open changed files" },
      { "<leader>gt", "<CMD>:DiffviewFileHistory<CR>", desc = "Diff history on current branch" },
      { "<leader>gf", "<CMD>:DiffviewFileHistory %<CR>", desc = "Diff current file" },
    },
  },
}
