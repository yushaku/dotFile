## tmux command

- new tmux session: `tmux`
- create new session with name: `tmux new -s <session_name>`
- show all session: `tmux ls`
- attach session: `tmux attach -t <session_name>`
- remove all session: `tmux kill-server`
- remove session by name: `tmux kill-session -t <session_name>`

## tmux key binding

- prefix tmux: `Ctrl + b` or `Ctrl + space`

- detach tmux: `<prefix> + d` = `tmux detach`
- create new tmux window: `<prefix> + c`
- snap pane next: `<prefix> + >`
- snap pane previous: `<prefix> + <`
- list section: `<prefix> + s`
- rename section: `<prefix> + .`

- list all tmux window: `<prefix> + w`
- navigate window tmux: `<prefix> + [number]`

- list buffer: `<prefix> + b`
- list paste: `<prefix> + p`
- list buffer: `<prefix> + shift + p`

- resize pane left + 5: `<prefix> + h`
- resize pane down + 5: `<prefix> + j`
- resize pane up + 5: `<prefix> + k`
- resize pane right + 5: `<prefix> + l`

- toggle maximal pane: `<prefix> + m`

## tmux shot-cut

- apply tmux.conf: `Ctrl + Alt + r`

- split vertical: `Ctrl + Alt + ->`
- split horizontal: `Ctrl + Alt + <-`

- move up session: `Alt + arrow-up`
- move down session: `Alt + arrow-down`
- move left session: `Alt + <-`
- move right session: `Alt + ->`
