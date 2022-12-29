# learn vim from scratch

## How to quit Vim

- `:q`: quit
- `:q!`: force quit
- `:qa`: quit all
- `:wq`: save and quit
- `:wqa`: save and quit all
- `:x`: save if necessary and quit

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
