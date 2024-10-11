## package use with

- better searching

  - `sudo apt install fd-find`
  - can ignore file base on .gitignore
  - support fzf search do not search fucking file

- better ls command

  - `sudo apt install exa`
  - with colors, icons, tree show and more

## use with fzf

- `CTRL-R`: search on recent history based on $HISTFILE,
- `CTRL-T`: search for a filename under $PWD,
- `ALT-C`: search for a directory name under $PWD, then cd into the selected entry

- trigger fzf to autocomplete: `** + tab`.

  > cat /etc/p\*\* + tab

- search and preview:

  ```bash
  fzf --preview='batcat --color="always" --style="numbers" {}' --bind shift-up:preview-up,shift-down:preview-down
  ```

## pandoc

convert file: https://pandoc.org/demos.html
