return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "契" },
        topdelete = { text = "契" },
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
      map("n", "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map("n", "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")

      map("n", "<leader>gha", gs.stage_buffer, "add file to Stage Buffer")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset current file on Buffer")

      map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    opts = {
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
    },
    keys = {
      { "<leader>gg", "<CMD>:DiffviewOpen<CR>", desc = "open git diff" },
      { "<leader>gc", "<CMD>:DiffviewClose<CR>", desc = "close git diff" },
      { "<leader>ge", "<CMD>:DiffviewToggleFiles<CR>", desc = "open changed files" },
      { "<leader>gt", "<CMD>:DiffviewFileHistory<CR>", desc = "open git diff history" },
    },
  },
}
