# vim - how to use

## basic command

- `:q`: quit
- `:wq`: write and quit
- `:bd`: file buffer delete
- `:?`: search key

## NORMAL MODE

- `esc`: -> NORMAL
- `jk`: INSERT -> NORMAL
- `o`: add new line under cursor line -> INSERT
- `s`: remove -> INSERT
- `u`: undo
- `shift-u`: Undo undo
- `cc`: cut all current line -> INSERT
- `x`: cut current character
- `p`: paste
- `gg`: cursor to top
- `h-j-k-l`: left-down-up-right

## navigation

- `Alt + j`: move next buffer
- `Alt + k`: move prev buffer

- `Alt + l`: move next panel
- `Alt + h`: move prev panel

## custom key-map

- `ctrl + ->` :resize + 2
- `ctrl + <-` :resize - 2
- `ctrl + arrow-up` :resize - 2
- `ctrl + arrow-down` :resize - 2

# PLugin in vim - how to use

## NERD_TREE: key-mapping

- `Ctrl + b`: toggle nerdTree
- `a` :add file
- `A` :add Dir
- `d` :delete
- `r` :rename
- `c` :copy
- `m` :move
- `y` :copy_to_clipboard
- `x` :cut_to_clipboard
- `p` :paste_from_clipboard
- `S`: split vertical and open file in that panel
- `s`: split horizontal and open file in that panel
- `<`: "prev_source",
- `>`: "next_source"

## FZF - fuzzy finder

- `Ctrl + p`: open search file in parent folder
- `f`: leader key
- `fh`: :help at the speed of light
- `fb`: :Fuzzy find active buffers
- `fr`: :Search for string
- `fg`: :Fuzzy find changed files in git
