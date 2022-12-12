local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                  install_path}
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "rounded"
            }
        end
    }
}

return packer.startup(function(use)
    ------------------------------------------
    ----       Package Manager        --------
    ------------------------------------------
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use 'MunifTanjim/nui.nvim'

    ------------------------------------------
    ----       nvim dashboard         --------
    ------------------------------------------

    -- use {
    --     "glepnir/dashboard-nvim",
    --     event = "VimEnter",
    --     cond = firenvim_not_active,
    --     config = function()
    --         require('plugins.dashboard')
    --     end
    -- }

    -------------------------------------------
    ---- Theme, Icons, Statusbar, Bufferbar ---
    -------------------------------------------
    use({
        'shaunsingh/moonlight.nvim',
        config = function()
            require('plugins.moonlight')
        end
    })

    use({
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup()
        end
    })

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true
        },
        event = 'BufEnter',
        config = function()
            require('plugins.lualine')
        end
    }

    use {
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("plugins.bufferline")
        end
    }

    -----------------------------------
    -- Treesitter: Better Highlights --
    -----------------------------------
    use({
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require("nvim-treesitter.install").update({
                with_sync = true
            })
            ts_update()
        end,
        config = function()
            require('plugins.treesitter')
        end
    })

    use({
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end
    })

    use({
        "windwp/nvim-autopairs",
        config = function()
            require('plugins.autopair')
        end
    })
    use({
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter"
    })

    ---------------------------------
    -- Folder structure and Fuzzy Search --
    ---------------------------------

    use({
        'nvim-neo-tree/neo-tree.nvim',
        event = 'CursorHold',
        config = function()
            require('plugins.nvim-tree')
        end
    })

    use({{
        'nvim-telescope/telescope.nvim',
        event = 'CursorHold',
        config = function()
            require('plugins.telescope')
        end
    }, {
        'nvim-telescope/telescope-fzf-native.nvim',
        after = 'telescope.nvim',
        run = 'make',
        config = function()
            require('telescope').load_extension('fzf')
        end
    }, {
        'nvim-telescope/telescope-symbols.nvim',
        after = 'telescope.nvim'
    }})

    ---------------------------------
    -- LANGUAGE SERVER  --
    ---------------------------------

    -- managing & installing lsp servers, linters & formatters
    use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
    use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

    -- configuring lsp servers
    use("neovim/nvim-lspconfig") -- easily configure language servers
    use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
    use({
        "glepnir/lspsaga.nvim",
        branch = "main"
    }) -- enhanced lsp uis
    use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

    -- formatting & linting
    use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
    use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.trouble")
        end
    }

    ---------------------------------
    --     AUTO COMPLITION         --
    ---------------------------------

    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require('plugins.cmp')
        end
    })
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    -- use "hrsh7th/cmp-cmdline" -- cmdline completions
    -- use "saadparwaiz1/cmp_luasnip" -- snippet completions

    -- snippets
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets

    ---------------------------------
    --    TOGGLE TERMIANL          --
    ---------------------------------
    use({
        "akinsho/toggleterm.nvim",
        config = function()
            require("plugins.toggleTerm")
        end
    })

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end

    config = {
        autoremove = true -- Remove disabled or unused plugins without prompting the user
    }

end)
