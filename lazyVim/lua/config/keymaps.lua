-- This file is automatically loaded by lazyvim.plugins.config
-- local Util = require("lazyvim.util")

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

-- n - normal mode
-- o - select mode
-- x - visual mode
-- v - visual mode and select mode
-- i - insert mode

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "gj", "o<esc>", { desc = "add new blank line below" })
map("n", "gk", "O<esc>", { desc = "add new blank line above" })
map({ "n", "v" }, "gh", "^", { desc = "go to begin of line" })
map({ "n", "v" }, "gl", "$", { desc = "go to end of line" })

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
map("n", "<C-M-j>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-M-k>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-M-l>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-M-h>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map("n", "i", function()
  if #vim.fn.getline(".") == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true })

map("n", "a", function()
  if #vim.fn.getline(".") == 0 then
    return [["_cc]]
  else
    return "a"
  end
end, { expr = true })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map("n", "<C-a>", "<esc>gg<S-v>G", { desc = "select all current file" })

-- go to normal mode
map("t", "jk", "<C-\\><C-n>", { desc = "easy goto Normal mode in terminal" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("i", "jk", "<esc>", { desc = "easy goto Normal mode" })
map("i", "JK", "<esc>", { desc = "easy goto Normal mode" })
map("i", "<C-e>", "<C-x><C-e>")
map("i", "<C-y>", "<C-x><C-y>")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map({ "n", "x" }, "gw", "*N")
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map({ "i", "v", "n", "s" }, "<C-z>", "<esc>u", { desc = "Save file" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "p", '"_dP', { desc = "paste without yank line" })

-- quit
map({ "n", "x", "o", "t" }, "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map({ "n", "x", "o", "t" }, "<leader>qw", "<cmd>wqa<cr>", { desc = "Save and Quit all" })

-- floating terminal
map("n", "<leader>tl", "<cmd>vsplit term://zsh<cr>", { desc = "open terminal at right side" })
map("n", "<leader>tj", "<cmd>split term://zsh<cr>", { desc = "open terminal at bottom" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>ws", ":wincmd =<CR>", { desc = "make all window have same width" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>_", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>wh", "<C-w>t<C-w>H", { desc = "change split window from vertical to horizontal" })
map("n", "<leader>wv", "<C-w>t<C-w>K", { desc = "change split window from horizontal to vertical " })

-- navigate window pane
map("n", "<M-1>", "1<C-w>w", { desc = "focus first pane" })
map("n", "<M-2>", "2<C-w>w", { desc = "focus second pane" })
map("n", "<M-3>", "3<C-w>w", { desc = "focus third pane" })
map("n", "<M-4>", "4<C-w>w", { desc = "focus fourth pane" })

vim.keymap.del("n", "<C-b>")

map("n", "<S-M-u>", "<cmd>TypescriptOrganizeImports<CR>", { desc = "Organize Imports" })
map("n", "<S-M-o>", "<cmd>TypescriptRemoveUnused<CR>", { desc = "Remove unused" })
map("n", "<S-M-i>", "<cmd>TypescriptAddMissingImports<CR>", { desc = "Add missing import" })
