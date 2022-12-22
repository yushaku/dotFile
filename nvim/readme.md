# vim - how to use

## required:

- nvim -v 0.8

## basic command

- `:q`: quit
- `:wq`: write and quit
- `:bd`: file buffer delete
- `:?`: search key
- `.`: repect prev action

## NORMAL MODE

- `esc`: -> NORMAL
- `jk`: INSERT -> NORMAL
- `o`: add new line under cursor line -> INSERT
- `s`: remove -> INSERT
- `u`: undo
- `ctrl+r`: Undo undo

- `cc`: cut all current line -> save to buffer -> INSERT
- `x`: cut current character
- `y`: copy
- `p`: paste

- `d`: delete
- `dd`: delete current line
- `di + { or [ or ( or " or '`: delete in side of nearest braces
- `c`: same as `d` but it gonna go to INSERT mode

- `gg`: cursor to top
- `shift-g`: cursor to bottom
- `0`: go to start of the line
- `$`: go to end of the line
- `shift-a`: go to end of line -> INSERT mode
- `h-j-k-l`: left-down-up-right
- `w`: move to begin of next word
- `e`: move to end of next word
- `b`: move to begin of prev word

- `*`: search word under cursor
- `/<string>`: search <string>

  - `n`: next search match
  - `shift-n`: prev search match

- `:%s/<pattern_string>/<replate_string>`: search and replate word

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
