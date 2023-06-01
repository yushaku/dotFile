-- This file is automatically loaded by lazyvim.plugins.config

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map({ "n", "t", "i" }, "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Go to left window" })
map({ "n", "t", "i" }, "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Go to lower window" })
map({ "n", "t", "i" }, "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Go to upper window" })
map({ "n", "t", "i" }, "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Go to right window" })

map({ "n", "t", "i" }, "<C-Up>", "<cmd>TmuxNavigateUp<cr>", { desc = "go to upper window" })
map({ "n", "t", "i" }, "<C-Down>", "<cmd>TmuxNavigateDown<cr>", { desc = "go to down window" })
map({ "n", "t", "i" }, "<C-Left>", "<cmd>TmuxNavigateLeft<cr>", { desc = "go to left window" })
map({ "n", "t", "i" }, "<C-Right>", "<cmd>TmuxNavigateRight<cr>", { desc = "go to right window" })

-- Resize window using <ctrl + shift> arrow keys
map("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "<S-Left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<S-Right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map("n", "<C-a>", "gg<S-v>G", { desc = "select all current file" })

-- go to normal mode
map("t", "jk", "<C-\\><C-n>", { desc = "easy goto Normal mode in terminal" })
map("t", "<esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("i", "jk", "<esc>", { desc = "easy goto Normal mode" })
map("i", "JK", "<esc>", { desc = "easy goto Normal mode" })
map("i", "kj", "<esc>", { desc = "easy goto Normal mode" })

map("n", "gw", "*N")
map("x", "gw", "*N")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map({ "i", "v", "n", "s" }, "<C-z>", "<esc>u", { desc = "Save file" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

map({ "v", "n" }, "<C-u>", "{")
map({ "v", "n" }, "<C-d>", "}")

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>qw", "<cmd>wqa<cr>", { desc = "Save and Quit all" })

-- floating terminal
map("n", "<leader>tk", function()
  Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = "Terminal (root dir)" })
map("n", "<leader>tl", "<cmd>vsplit term://zsh<cr>", { desc = "open terminal at right side" })
map("n", "<leader>tj", "<cmd>split term://zsh<cr>", { desc = "open terminal at bottom" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>_", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- search and replace
map(
  "n",
  "<leader>ss",
  "<CMD> lua require('spectre').open_visual({select_word=true})<CR>",
  { desc = "Search current word (spectre)" }
)
map("v", "ss", "<esc><cmd>lua require('spectre').open_visual()<CR>", { desc = "Search current word (spectre)" })
map(
  "n",
  "<leader>sf",
  "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
  { desc = "Search on current file (spectre)" }
)
