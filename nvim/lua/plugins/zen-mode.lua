local status, zenMode = pcall(require, "zen-mode")
if not status then
	return
end

vim.keymap.set("n", "zz", "<cmd>ZenMode<CR><CR>", { silent = true })

zenMode.setup({
	window = {
		backdrop = 0.8,
		options = {
			number = true,
			signcolumn = "no",
			foldcolumn = "0",
			cursorline = true,
			cursorcolumn = false,
		},
	},
	plugins = {
		tmux = {
			enabled = false,
		},
		gitsigns = { enabled = true },
	},
})
