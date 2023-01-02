# vim - how to use

## required:

- nvim -v 0.8
- git: `sudo apt install git`
- make
- cargo
- npm + node
- python + pip
- wl-clipboard: `sudo apt install wl-clipboard`

## **NORMAL MODE**

### navigate buffer

- `Ctrl + right`: move next buffer
- `Ctrl + left`: move prev buffer
- `Ctrl + shift + o`: close all buffer but this one

### navigate panel

- `Alt + left` or `Alt + h`: move left panel
- `Alt + right` or `Alt + l`: move right panel
- `Alt + down` or `Alt + j`: move down panel
- `Alt + top` or `Alt + k`: move top panel

### resize panel

- `ctrol + shift + right` :resize + 2
- `ctrol + shift + left` :resize - 2
- `ctrol + shift + up` :resize - 2
- `ctrol + shift + down` :resize - 2

### old habits key

- `Ctrl + a`: select all
- `Ctrl + s`: save
- `Ctrl + h`: remove highlight

### split winddow **_s_**

- `ss`: split vertically
- `sh`: split horizontally
- `sx`: close current window

### replate old key of vim

- `ww` or `$`: end of line
- `qq` or `0`: start of line

## **IN VISUAL MODE**

### move line

- `alt + k`: move line up
- `alt + j`: move line down
- '>': move line to right one tab
- '<': move line to left one tab

## **PLUG-IN IN VIM - KEYMAP**

### NVIM_TREE: key-mapping

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

### FZF - fuzzy finder - **_f_**

- `Ctrl + p`: open search file in parent folder
- `ff`:open search file in parent folder
- `fh`: :help at the speed of light
- `fb`: :Fuzzy find active buffers
- `fr`: :Search for string
- `fg`: :Fuzzy find changed files in git

### CMP - a completion engine plugin

When pop-up completion show option list

- `ctrl + k`: pre-view item
- `ctrl + j`: next-view item
- `ctrl + b`: scroll doc down
- `ctrl + f`: scroll doc up
- `ctrl + e`: close suggestion
- `ctrl + space`: show completion suggestion
- `Enter`: confirm suggestion

### git - **_g_**

- `gg`: show git diff in current file
- `gh`: show file diff history
- `gt`: show tree diff history
- `gx`: close git diff history
- `gr`: refeash git diff

### hop - hype jump - **_t_**

- `tt`: show jump map down current line
- `tk`: show jump map up current line
- `tw`: show jump map base on 2 charaters
- `tp`: show jump map base on pattenr
- `tl`: show jump map base on line

### color picker - cmd:ccc

- `<leader>cp`: open color picker

  - `o`: choose other type color
  - `h` - `l`: for decrease 1 and increase 1
  - `s` - `d`: for decrease 5 and increase 5
  - `m` - `,`: for decrease 10 and increase 10

- `<leader>ct`: toggle color highlight

### surounder { [ ( " ' ' " ) ] }

- `cs<old_pair><new_pair>`: replate surounder
- `ds<old_pair>`: delete surounder
