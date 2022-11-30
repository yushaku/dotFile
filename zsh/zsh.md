## use with fzf

- `CTRL-R`: search on recent history based on $HISTFILE,
- `CTRL-T`: search for a filename under $PWD,
- `ALT-C`: search for a directory name under $PWD, then cd into the selected entry

- trigger fzf to autocomplete: `** + tab`.

  > cat /etc/p\*\* + tab

- search and preview:

  ```bash
  fzf --preview='batcat --color="always" --style="numbers" {}' --bind shift-up:preview-page-up shift-down:preview-page-down
  ```
