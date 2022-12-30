if exists('$TMUX')

" Colors in tmux

let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"

let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"

endif

set termguicolors

set background=dark

colorscheme base16-flat
