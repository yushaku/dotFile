# how to use search in vim

## use / or ? in command

In **NORMAL MODE**, press `/` or `?` and enter search_word

- press n to go next
- press N to go backward

Turn off highlinghting : `:noh`

## use `#` or `*`

Hover to <search_word> and press #

- press n to go backward
- press N to go next

`*` is like `#` but it search backward

# how to search and replate in vim

## replate in first line

- replate first match in first line `:s/search_word/replate_word`
- replate all in first line `:s/search_word/replate_word/g`

## replate in total file

- replate first match each line in total file `:%s/search_word/replate_word`
- replate all `:%s/search_word/replate_word/g`

## replate in from line to other line

- replate first match from line 2 to line 14 `:2,14s/search_word/replate_word`
- replate with case-insensitive: `:4,7s/search_word/substitue_word/i`
- replae with case-sensitive: `:4,7s/search_word/substitue_word/I`

## replate with your confirm

- with `i` is case-insensitive
- with `g` is global
- with `c` is confirm

- `:4,7s/search_word/substitue_word/gIc`
  - y: yes
  - n: no
  - a: all
  - q: quit without making any change
  - l: make is is last and quit
  - Ctrl + shift + e: mode down the screem
  - Ctrl + shift + y: mode up the screem
