local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({
				border = "rounded",
			})
		end,
	},
})

return packer.startup(function(use)
	------------------------------------------
	----       Package Manager        --------
	------------------------------------------
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("MunifTanjim/nui.nvim")

	-- OPTION: -- make nvim load lua module faster by cache
	use("lewis6991/impatient.nvim")

	------------------------------------------
	----       nvim dashboard         --------
	------------------------------------------
	-- OPTION: -- add dashboard on start up page
	use({
		"goolord/alpha-nvim",
		config = function()
			require("plugins.alpha")
		end,
	})

	-------------------------------------------
	---- Theme, Icons, Statusbar, Bufferbar ---
	-------------------------------------------
	-- OPTION: THEMES
	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
	use("morhetz/gruvbox")
	use({
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
			opt = true,
		},
		event = "BufEnter",
		config = function()
			require("plugins.lualine")
		end,
	})

	use({
		"akinsho/bufferline.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.bufferline")
		end,
	})

	-----------------------------------
	-- Treesitter: Better Highlights --
	-----------------------------------
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({
				with_sync = true,
			})
			ts_update()
		end,
		config = function()
			require("plugins.treesitter")
		end,
	})

	-- OPTION: -- normal comment, and todo commend in nvim
	use({
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "numToStr/Comment.nvim" },
		{
			"folke/todo-comments.nvim",
			config = function()
				require("plugins.comment")
			end,
		},
	})

	-- OPTION: -- autopair [{("' '")}] and <div></div>
	use({
		{
			"windwp/nvim-autopairs",
			config = function()
				require("plugins.autopair")
			end,
		},
		{
			"windwp/nvim-ts-autotag",
			after = "nvim-treesitter",
		},
	})

	---------------------------------
	-- Folder structure and Fuzzy Search --
	---------------------------------

	use({
		"nvim-neo-tree/neo-tree.nvim",
		event = "CursorHold",
		config = function()
			require("plugins.nvim-tree")
		end,
	})

	-- OPTION: --find and replate in file or project
	-- use({
	-- 	"nvim-pack/nvim-spectre",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("plugins.spectre")
	-- 	end,
	-- })

	use({
		{
			"nvim-telescope/telescope.nvim",
			event = "CursorHold",
			config = function()
				require("plugins.telescope")
			end,
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			after = "telescope.nvim",
			run = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
		{
			"nvim-telescope/telescope-symbols.nvim",
			after = "telescope.nvim",
		},
	})

	-- OPTION: -- better movement in file
	use({
		"phaazon/hop.nvim",
		event = "BufRead",
		config = function()
			require("hop").setup()
		end,
	})

	---------------------------------
	--            GIT              --
	---------------------------------
	use({
		"sindrets/diffview.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plugins.gitdiff")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.gitsign")
			require("scrollbar.handlers.gitsigns").setup()
		end,
	})

	---------------------------------
	-- LANGUAGE SERVER  --
	---------------------------------
	use({
		{ "williamboman/mason.nvim" }, -- in charge of managing lsp servers, linters & formatters
		{ "williamboman/mason-lspconfig.nvim" }, -- bridges gap b/w mason & lspconfig
		{ "glepnir/lspsaga.nvim" }, -- a highly performant UI for Manager language server
		{ "neovim/nvim-lspconfig" }, -- easily configure language servers

		-- LSP - formatting and linting
		{ "jose-elias-alvarez/null-ls.nvim" }, -- configure formatters & linters
		{ "jayp0521/mason-null-ls.nvim" }, -- bridges gap b/w mason & null-ls

		-- LSP - typescript
		{ "jose-elias-alvarez/typescript.nvim" }, -- additional functionality for typescript server
		{ "onsails/lspkind.nvim" }, -- vs-code like icons for autocompletion

		-- OPTION: -- Highlights lsp diagnostics
		{ "folke/lsp-colors.nvim" }, -- Automatically creates missing LSP diagnostics highlight groups for color schemes
		{
			"folke/trouble.nvim",
			config = function()
				require("plugins.trouble")
			end,
		},

		-- OPTION: -- winbar/status line
		--[[ { "SmiteshP/nvim-navic" }, ]]
		--[[ { ]]
		--[[ 	"utilyre/barbecue.nvim", ]]
		--[[ 	after = "nvim-web-devicons", ]]
		--[[ 	config = function() ]]
		--[[ 		require("plugins.barbecue") ]]
		--[[ 	end, ]]
		--[[ }, ]]
	})

	---------------------------------
	--     AUTO COMPLITION         --
	---------------------------------

	use({
		{
			"hrsh7th/nvim-cmp",
			config = function()
				require("plugins.cmp")
			end,
		},
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-nvim-lsp" }, -- for autocompletion

		-- SNIPPETS
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },
	})

	---------------------------------
	--   BETTER FOR CODE          --
	---------------------------------

	-- OPTION: -- better for experient
	use({
		{
			"folke/zen-mode.nvim", -- for focus in one tab better
			config = function()
				require("plugins.zen-mode")
			end,
		},
		{ "tpope/vim-repeat" },
		{ "declancm/cinnamon.nvim" }, -- Smooth scrolling
		{ "uga-rosa/ccc.nvim" }, -- color picker
		{ "tpope/vim-surround" }, -- add, delete, change surroundings (it's awesome)
		{ "xiyaowong/nvim-transparent" }, -- set transparent background
		{ "christoomey/vim-tmux-navigator" }, -- naviagter with nvim and tmux better
		{
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("plugins.indent")
			end,
		}, --This plugin adds indentation guides to all lines
	})

	-- OPTION:-- nvim scrollBar
	use({
		"petertriho/nvim-scrollbar",
		config = function()
			require("plugins.scrollBar")
		end,
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
