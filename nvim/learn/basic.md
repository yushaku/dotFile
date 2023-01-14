# learn vim from scratch

## How to quit Vim

- `:q`: quit
- `:q!`: force quit
- `:qa`: quit all
- `:wq`: save and quit
- `:wqa`: save and quit all
- `:x`: save if necessary and quit

- `:bd`: file buffer delete
- `.`: repect prev action

## NORMAL MODE

### replace command in vim

- `:r{char}`: go to replace mode and press any character to replace old word

### change command in vim

- `c{motion}`
  - `ch`: delete previous character and start insert mode
  - `cw`: delete from cursor to end of word and start insert mode
  - `ck`: delete a line above and start insert mode
  - `c$` or `C`: delete from cursor to end of line and start insert mode

### Substitute command in VIM

- `[count]s`: Substitute is like `c` but instead of use motion, `s` use number of word would change and start insert mode

### basic

- `esc`: -> NORMAL
- `jk`: INSERT -> NORMAL
- `o`: add new line under cursor line -> INSERT
- `I`: go to start of line -> INSERT
- `A`: go to end of line -> INSERT
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
- `dt + <character>`: delete to that <character>

- `c`: same as `d` but it gonna go to INSERT mode

#### move around in Vim

- `{ and }`: move up-down next blank line
- `gg`: cursor to top
- `shift-g`: cursor to bottom
- `0`: go to start of the line
- `$`: go to end of the line
- `shift-a`: go to end of line -> INSERT mode
- `h-j-k-l`: left-down-up-right
- `H`: move to hight of window
- `M`: move to midle of window
- `L`: move to low of window
- `:<number>`: move to <number> line
- `w`: move to begin of next word
- `e`: move to end of next word
- `b`: move to begin of prev word
- `f<character>`: find character in current line and go to first match
- `t<character>`: find character in current line and go to front word of first match

  - `;`: go to next match
  - `,`: go to previous match

- `*`: search word under cursor
- `/<string>`: search <string>

  - `n`: next search match
  - `shift-n`: prev search match

- `:%s/<pattern_string>/<replate_string>`: search and replate word

## VISUAL MODE

- `v%`: select all things include pair
- `va<pair>`: select all things include pair
- `vi<pair>`: select all things in pair
