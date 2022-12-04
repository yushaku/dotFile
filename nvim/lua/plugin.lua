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
    use {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        cond = firenvim_not_active,
        config = function()
            require('plugins.dashboard')
        end
    }

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
            require("bufferline").setup {}
            vim.opt.termguicolors = true
        end

    }

    -----------------------------------
    -- Treesitter: Better Highlights --
    -----------------------------------
    -- use({{
    --     'nvim-treesitter/nvim-treesitter',
    --     event = 'CursorHold',
    --     run = ':TSUpdate',
    --     config = function()
    --         require('plugins.treesitter')
    --     end
    -- }, {
    --     'nvim-treesitter/playground',
    --     after = 'nvim-treesitter'
    -- }, {
    --     'nvim-treesitter/nvim-treesitter-textobjects',
    --     after = 'nvim-treesitter'
    -- }, {
    --     'nvim-treesitter/nvim-treesitter-refactor',
    --     after = 'nvim-treesitter'
    -- }, {
    --     'windwp/nvim-ts-autotag',
    --     after = 'nvim-treesitter'
    -- }, {
    --     'JoosepAlviste/nvim-ts-context-commentstring',
    --     after = 'nvim-treesitter'
    -- }})

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

    -- use {
    --     'phaazon/hop.nvim',
    --     branch = 'v2',
    --     config = function()
    --         require('plugins.hop')
    --     end
    -- }

    ---------------------------------
    -- LANGUAGE SERVER  --
    ---------------------------------

    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/mason.nvim" -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
    use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end

    config = {
        autoremove = true -- Remove disabled or unused plugins without prompting the user
    }

end)
