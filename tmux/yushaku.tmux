#!/usr/bin/env bash

# TokyoNight colors for Tmux

set -g status "on"
set -g status-bg "#24283B"
set-option -g status-position bottom # top | bottom
set-option -g mode-style 'bg=yellow,fg=black'

set -g status-left "#[fg=#7AA2F7,bg=#7AA2F7] #[fg=#282C34,bg=#7AA2F7, bold]Yushaku #[fg=#7AA2F7,bg=#353A52]#[bg=#282C34,fg=#282C34]"

set -g status-right "#[fg=#353A52,bg=#282C34]#[fg=#353A52,bg=#353A52] #[fg=#7AA2F7,bg=#353A52]CPU:#{cpu_percentage}#[fg=#7AA2F7,bg=#353A52] #[fg=#7AA2F7,bg=#353A52]#[fg=#7AA2F7,bg=#7AA2F7] #[fg=#353A52,bg=#7AA2F7]RAM:#{ram_percentage}#[fg=#7AA2F7,bg=#7AA2F7] "

setw -g window-status-format '#[fg=#282C34,bg=#93a1a1]#[fg=#eee8d5,bg=#93a1a1] #I #[fg=#93a1a1,bg=#353A52] #{b:pane_current_path} #[fg=#353A52,bg=#282C34,nobold]'

setw -g window-status-current-format '#[fg=#282C34,bg=#7AA2F7]#[fg=#eee8d5,bg=#7AA2F7] #I #[fg=#7AA2F7,bg=#353A52] #{b:pane_current_path} #[fg=#353A52,bg=#282C34,nobold]'

## set pane color border
set -g pane-border-style fg=#1F2335
set -g pane-active-border-style fg="#7AA2F7"
