local actions = require("telescope.actions")
local lactions = require("telescope.actions.layout")
local finders = require("telescope.builtin")
local trouble = require("trouble.providers.telescope")

require("telescope").setup({
	defaults = {
		prompt_prefix = " ❯ ",
		initial_mode = "insert",
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
		mappings = {
			i = {
				["<ESC>"] = actions.close,
				["<c-t>"] = trouble.open_with_trouble,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
				["<C-s>"] = actions.send_selected_to_qflist,
				["<C-q>"] = actions.send_to_qflist,
				["<C-h>"] = lactions.toggle_preview,
			},
			n = {
				["<c-t>"] = trouble.open_with_trouble,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- "smart_case" | "ignore_case" | "respect_case"
		},
	},
})

local Telescope = setmetatable({}, {
	__index = function(_, k)
		if vim.bo.filetype == "NvimTree" then
			vim.cmd.wincmd("l")
		end
		return finders[k]
	end,
})

-- Ctrl-p = fuzzy finder
vim.keymap.set("n", "<C-p>", function()
	local ok = pcall(Telescope.git_files, {
		show_untracked = true,
	})
	if not ok then
		Telescope.find_files()
	end
end)

vim.keymap.set({ "n", "v", "i" }, "<C-f>", function()
	Telescope.current_buffer_fuzzy_find()
end)

vim.g.mapleader = "f"
vim.keymap.set("n", "<leader>h", Telescope.help_tags)
vim.keymap.set("n", "<leader>b", Telescope.buffers)
vim.keymap.set("n", "<leader>r", Telescope.live_grep)
vim.keymap.set("n", "<leader>g", Telescope.git_status)

vim.keymap.set("n", "<leader>k", finders.keymaps)
vim.keymap.set("n", "<leader>gb", finders.git_branches)
vim.keymap.set("n", "<leader>st", finders.git_stash)
vim.keymap.set("n", "<leader>cm", finders.command_history)
vim.keymap.set("n", "<leader>w", finders.spell_suggest)
vim.keymap.set("n", "<leader>s", finders.symbols)

vim.keymap.set("n", "<leader>f", function()
	local ok = pcall(Telescope.git_files, {
		show_untracked = true,
	})
	if not ok then
		Telescope.find_files()
	end
end)
