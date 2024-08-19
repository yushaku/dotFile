return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "-" },
        topdelete = { text = "-" },
        changedelete = { text = "▎" },
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

      map('n', '<leader>ghd', gs.toggle_deleted, "[Gitsign] Toggle deleted")
      map("n", "<leader>gha", ":Gitsigns stage_hunk<CR>", "[Gitsign] Add Hunk to Stagging")
      map("n", "<leader>ghu", ":Gitsigns reset_hunk<CR>", "[Gitsign] Remove Hunk from Stagging")

      map("n", "<leader>ga", gs.stage_buffer, "[Gitsign] Add file to Stagging")
      map("n", "<leader>gu", gs.undo_stage_hunk, "[Gitsign] remove file from Stagging")
      map("n", "<leader>gr", gs.reset_buffer, "[Gitsign] Reset all changed")

      map("n", "<leader>gp", gs.preview_hunk, "[Gitsign] Preview Hunk")
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "[Gitsign] Blame Line")
      map({'o', 'x'}, 'ih', '<CMD>Gitsigns select_hunk<CR>')
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>gd", "<CMD>:DiffviewOpen<CR>", desc = "[DiffView] Open git diff" },
      { "<leader>gq", "<CMD>:DiffviewClose<CR>", desc = "[DiffView] Quit git diff" },
      { "<leader>gb", "<CMD>:DiffviewToggleFiles<CR>", desc = "[DiffView] open changed files" },
      { "<leader>gt", "<CMD>:DiffviewFileHistory<CR>", desc = "[DiffView] Diff history on current branch" },
      { "<leader>gf", "<CMD>:DiffviewFileHistory %<CR>", desc = "[DiffView] Diff current file" },
      { "<leader>gs", "<CMD>:DiffviewFileHistory -g --range=stash<CR>", desc = "[DiffView] List all stashes history" },
    },
    opts = {
      view = {
        merge_tool = { layout = "diff3_mixed" },
      },
      keymaps = {
        file_panel = {
          {
            "n",
            "cc",
            function()
              vim.ui.input({ prompt = "Commit message: " }, function(msg)
                if not msg then
                  return
                end
                local results = vim.system({ "git", "commit", "-m", msg }, { text = true }):wait()

                if results.code ~= 0 then
                  vim.notify(
                    "Commit failed with the message: \n" .. vim.trim(results.stdout .. "\n" .. results.stderr),
                    vim.log.levels.ERROR,
                    { title = "Commit" }
                  )
                else
                  vim.notify(results.stdout, vim.log.levels.INFO, { title = "Commit" })
                end
              end)
            end,
          },
        },
      },
    },
  },
}
