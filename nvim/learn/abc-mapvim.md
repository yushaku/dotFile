# ABC - mapping

- `a`: go to INSERT_MODE and curror behind current word
- `b`: mode BACKWARD a word
- `b`: mode BACKWARD a word

- `c`: CHANGE - c{motion}

  - `ch`: delete previous character and start insert mode
  - `cw`: delete from cursor to end of word and start insert mode
  - `ck`: delete a line above and start insert mode
  - `c$` or `C`: delete from cursor to end of line and start insert mode

- `d`: delete

  - `d{number}<option>`: delete {number} <option>
  - `dw`: delete backward word
  - `de`: delete forward word
  - `d0`: delete all form current cursor to start of line
  - `d$`: delete all form current cursor to end of line
  - `dd`: delete current line and save it to clipoard

- `e`: move to end of word

- `f`: fzf

  - `ff`: open file search
  - `fh`: open history search
  - `fr`: open live grep search word
  - `fg`: open git status
  - `f<pair>`: jump to that pair

- `g`: git
- `h`: move left
- `i`: go to INSERT_MODE
- `J`: move down
- `k`: move up
- `l`: move right
- `m`:
- `n`:

- `o`: create new line under current line and go to INSERT_MODE

  - `O`: create new line upper current line and go to INSERT_MODE

- `p`: paste

- `q`

  - `qq`: go to start of line

- `r`: replate character

- `s`:

  - `ss`: split verticle
  - `sh`: split horizontal
  - `sx`: close current pane

- `t`: speed jumb

  - `tt`: open jumb map under current line
  - `tk`: open jumb map upper current line
  - `tp`: open jumb map by pattern
  - `tl`: open jumb map by line
  - `tw`: open jumb map by 2 character

- `u`: undo
- `v`: go to VISUAL_MODE

- `w`: move next start of word

  - `ww`: move to end of line

- `x`: cut current word and save it to clipoard
- `y`: yank - copy
- `z`:
  - `zz`: go to zen mode
