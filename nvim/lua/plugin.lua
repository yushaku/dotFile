local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
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
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  ------------------------------------------
  ----       Package Manager        --------
  ------------------------------------------
  use "wbthomason/packer.nvim"                  
  use "nvim-lua/popup.nvim"                    
  use "nvim-lua/plenary.nvim"                  

  -------------------------------------------
  ---- Theme, Icons, Statusbar, Bufferbar ---
  -------------------------------------------
  use ({
    'shaunsingh/moonlight.nvim',
    config = function()
        require('plugins.moonlight')
    end,
  })

  use({
    'kyazdani42/nvim-web-devicons',
    config = function()
        require('nvim-web-devicons').setup()
    end,
  })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    event = 'BufEnter',
    config = function()
        require('plugins.lualine')
    end,
  }

  -----------------------------------
  -- Treesitter: Better Highlights --
  -----------------------------------
  use({
    {
      'nvim-treesitter/nvim-treesitter',
      event = 'CursorHold',
      run = ':TSUpdate',
      config = function()
          require('plugins.treesitter')
      end,
    },
    { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
    { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
    { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
    { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
    { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
  })

  ---------------------------------
  -- Navigation and Fuzzy Search --
  ---------------------------------

  use({
      'nvim-tree/nvim-tree.lua',
      event = 'CursorHold',
      config = function()
          require('plugins.nvim-tree')
      end,
  })

  use({
      {
          'nvim-telescope/telescope.nvim',
          event = 'CursorHold',
          config = function()
              require('plugins.telescope')
          end,
      },
      {
          'nvim-telescope/telescope-fzf-native.nvim',
          after = 'telescope.nvim',
          run = 'make',
          config = function()
              require('telescope').load_extension('fzf')
          end,
      },
      {
          'nvim-telescope/telescope-symbols.nvim',
          after = 'telescope.nvim',
      },
  })

  use({
      'Navigator.nvim',
      event = 'CursorHold',
      config = function()
          require('plugins.navigator')
      end,
  })

  use({
      'phaazon/hop.nvim',
      event = 'BufRead',
      config = function()
          require('plugins.hop')
      end,
  })

  use({
      'karb94/neoscroll.nvim',
      event = 'WinScrolled',
      config = function()
          require('neoscroll').setup({ hide_cursor = false })
      end,
  })




  -- File browser
  -- use 'preservim/nerdTree'            
  -- use 'sheerun/vim-polyglot'                  -- Better Syntax Support
  -- use 'jiangmiao/auto-pairs'                  -- Auto pairs for '(' '[' '{'

  -- -- File search
  -- use 'junegunn/fzf'
  -- use 'junegunn/fzf.vim'

  -- -- theme style neovim
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

  config = {
    autoremove = true, -- Remove disabled or unused plugins without prompting the user
  }

end)