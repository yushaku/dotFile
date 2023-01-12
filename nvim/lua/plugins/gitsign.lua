local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

---

vim.g.mapleader = "g"
local gs = package.loaded.gitsigns

vim.keymap.set("n", "<leader>aa", gs.stage_buffer)
vim.keymap.set("n", "<leader>ah", gs.stage_hunk)

vim.keymap.set("n", "<leader>rs", gs.undo_stage_hunk)
vim.keymap.set("n", "<leader>rh", gs.reset_hunk)
vim.keymap.set("n", "<leader>RS", gs.reset_buffer) -- reset all changed

vim.keymap.set("n", "<leader>nh", gs.next_hunk)
vim.keymap.set("n", "<leader>bh", gs.prev_hunk)

vim.keymap.set("n", "<leader>pv", gs.preview_hunk)
vim.keymap.set("n", "<leader>hb", function()
	gs.blame_line({ full = true })
end)
vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame)
vim.keymap.set("n", "<leader>td", gs.toggle_deleted)
vim.keymap.set({ "o", "x" }, "ih", ":Gitsigns select_hunk<CR>")

-------

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})
