-- import nvim-autopairs safely
local status_ok, gitdiff = pcall(require, "diffview.nvim")
if not status_ok then
	return
end

gitdiff.setup()

local status_ok, signify = pcall(require, "vim-signigy")
if not status_ok then
	return
end

signify.setup({
	updatetime = 100,
})
