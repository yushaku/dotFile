-- :help options
local vimOption = vim.o

vimOption.mouse = "a" -- allow the mouse to be used in neovim

vimOption.fileencoding = "utf-8" -- the encoding written to a file
vimOption.encoding = "utf-8" -- the encoding written to a file
vimOption.scriptencoding = "utf-8" -- the encoding written to a file

vimOption.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vimOption.backup = false -- creates a backup file
vimOption.cmdheight = 2 -- more space in the neovim command line for displaying messages
vimOption.conceallevel = 0 -- so that `` is visible in markdown files
vimOption.hlsearch = true -- highlight all matches on previous search pattern
vimOption.ignorecase = true -- ignore case in search patterns
vimOption.pumheight = 10 -- pop up menu height
vimOption.showmode = false -- we don't need to see things like -- INSERT -- anymore
vimOption.showtabline = 2 -- always show tabs
vimOption.smartcase = true -- smart case
vimOption.smartindent = true -- make indenting smarter again
vimOption.splitbelow = true -- force all horizontal splits to go below current window
vimOption.splitright = true -- force all vertical splits to go to the right of current window
vimOption.swapfile = false -- creates a swapfile

vimOption.termguicolors = true -- set term gui colors (most terminals support this)
vimOption.background = "dark"
vimOption.cursorline = true -- highlight the current line
vimOption.winblend = 0
vimOption.wildoptions = "pum"
vimOption.pumblend = 5

vimOption.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vimOption.undofile = true -- enable persistent undo
vimOption.updatetime = 300 -- faster completion (4000ms default)
vimOption.writebackup = false -- if a file is being edited by another program it is not allowed to be edited
vimOption.expandtab = true -- convert tabs to spaces
vimOption.shiftwidth = 2 -- the number of spaces inserted for each indentation
vimOption.tabstop = 2 -- insert 2 spaces for a tab

vimOption.number = true -- set numbered lines
vimOption.relativenumber = false -- set relative numbered lines
vimOption.numberwidth = 2 -- set number column width to 2 {default 4}
vimOption.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vimOption.wrap = true -- display lines as one long line
vimOption.scrolloff = 8 -- is one of my fav
vimOption.sidescrolloff = 8
vimOption.guifont = "monospace:h17" -- the font used in graphical neovim applications

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]])
