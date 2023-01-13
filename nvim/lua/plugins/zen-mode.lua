local status, zenMode = pcall(require, "zen-mode")
if not status then
	return
end

vim.keymap.set("n", "zz", "<cmd>ZenMode<CR>", { silent = true })
vim.keymap.set("n", "zt", "<cmd>TransparentToggle<CR>", { silent = true })

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

----
---
--

local ok, transparent = pcall(require, "transparent")
if not ok then
	return
end

transparent.setup({
	enable = true, -- boolean: enable transparent
})

----
---
--

local scroll_ok, cinnamon = pcall(require, "cinnamon")
if not scroll_ok then
	return
end

cinnamon.setup({
	default_keymaps = true, -- Create default keymaps.
	extra_keymaps = true,
	override_keymaps = false,

	always_scroll = false, -- Scroll the cursor even when the window hasn't scrolled.
	hide_cursor = false, -- Hide the cursor while scrolling. Requires enabling termguicolors!
	centered = true, -- Keep cursor centered in window when using window scrolling.
	max_length = 500,
	scroll_limit = -1,
})
