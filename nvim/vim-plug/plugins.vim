" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  " beeter useing experience
  Plug 'sheerun/vim-polyglot'                  " Better Syntax Support
  Plug 'jiangmiao/auto-pairs'                  " Auto pairs for '(' '[' '{'
  Plug 'ryanoasis/vim-devicons'                " Icon

  " File browser
  Plug 'preservim/nerdTree'            

  " File search
  Plug 'junegunn/fzf', 
    \ { 'do': { -> fzf#install() } }           " Fuzzy finder 
  Plug 'junegunn/fzf.vim'

  " theme style neovim
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'shaunsingh/moonlight.nvim'

call plug#end()

