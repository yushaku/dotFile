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

## use lazygit

Command `lazygit` to open its GUI

- `Stage Files`: s or S

  - Use s to stage selected files or hunks.
  - Use S to stage all files.

- `UnStage Files`: u or U

  - Use u to unstage selected files or hunks.
  - Use U to unstage all files.

- `Commit Changes`: c

  - Use c to open the commit message editor.
  - Enter your commit message and save to commit the changes.

- `Amend Last Commit`: a

- `Push Commits`: **p**

- `Pull Changes`: **P**

- `Switch Branch`: b

- `Create Branch`: B

- `Merge Branch`: m

- `Rebase Branch`: r

- `View Diffs`: d

- `Resolve Merge Conflicts`: R

- `Open Git Status`: g
