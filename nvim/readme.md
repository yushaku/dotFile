# vim - how to use

## required:

- nvim -v 0.8
- git: `sudo apt install git`
- make
- cargo
- npm + node
- python + pip
- wl-clipboard: `sudo apt install wl-clipboard`
- fzf and ripgrep: to search string, file and folder

## **NORMAL MODE**

### lsp - better code

- `<leader>f`: show definition of current function or references of it
- `<leader>e`: see definition and make edits in window
- `<leader>i`: go to implementation
- `<leader>d`: go to declaration
- `<leader>k`: show document for what under curor
- `<leader>oo`: toggle outline
- `<leader>rn`: smart rename
- `<leader>a`: open code action

> TypeScript lsp

- `<leader>rf`: rename file's name
- `<leader>oi`: organize imports
- `<leader>ru`: remove unused things

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
- `se`: make panes got same size

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

- `gpv`: git preview diff
- `ghb`: git view all commit in current line
- `gtd`: git toggle deleted huck

- `g]`: git go to next hunk
- `g[`: git go to previous hunk

- `gaa`: git add current file to staging
- `gah`: git add current hunk to staging

- `grs`: git remove current file out of staging
- `grh`: git remove current hunk out of staging
- `grsf`: git reset all changed in current file

### hop - hype jump - **_t_**

- `mm`: show jump map down current line
- `mn`: show jump map up current line
- `mw`: show jump map base on 2 charaters
- `mp`: show jump map base on pattenr
- `ml`: show jump map base on line

### color picker - cmd:ccc

- `<leader>cp`: open color picker

  - `o`: choose other type color
  - `h` - `l`: for decrease 1 and increase 1
  - `s` - `d`: for decrease 5 and increase 5
  - `m` - `,`: for decrease 10 and increase 10

- `<leader>ct`: toggle color highlight

### surounder { [ ( " ' ' " ) ] }

> NORMAL_MODE:

- `ys + <pair>`: new pair
  - `ysiw + <pair>`: create new pair **in word**
  - `ys2aw + <pair>`: create new pair **in 2 word**
  - `yss + <pair>`: create new pair **in entire line**
- `cs<old_pair><new_pair>`: replate surounder
  - `cst`: change tags in html
- `ds<old_pair>`: delete surounder
  - `dst`"delete surounder tags"

> VISUAL_MODE

- `<block_visual_select> + S + <pair>`: wrap slected word in pair

### TODO and trouble

- `tt`: open todo list
- `ts`: open todo list by telescope
- `tgn`: open go to next todo
- `tgp`: open go to previous todo

- `tm`: open trouble in workspace
- `tf`: quick fix trouble
- `tr`: find references of this trouble
- `tn`: go to next trouble
- `tp`: go to previous trouble
