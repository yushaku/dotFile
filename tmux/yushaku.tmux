#!/usr/bin/env bash

# TokyoNight colors for Tmux

set -g status "on"
set -g status-bg "#24283B"
set-option -g status-position bottom # top | bottom
set-option -g mode-style 'bg=yellow,fg=black'

set -g status-left "#[fg=#7AA2F7,bg=#7AA2F7] #[fg=#282C34,bg=#7AA2F7, bold]Yushaku #[fg=#7AA2F7,bg=#353A52]#[bg=#282C34,fg=#282C34]"

setw -g window-status-format '#[fg=#282C34,bg=#93a1a1]#[fg=#eee8d5,bg=#93a1a1] #I #[fg=#93a1a1,bg=#353A52] #{b:pane_current_path} #[fg=#353A52,bg=#282C34,nobold]'

setw -g window-status-current-format '#[fg=#282C34,bg=#7AA2F7]#[fg=#eee8d5,bg=#7AA2F7] #I #[fg=#7AA2F7,bg=#353A52] #{b:pane_current_path} #[fg=#353A52,bg=#282C34,nobold]'

## set pane color border
set -g pane-border-style fg=#1F2335
set -g pane-active-border-style fg="#7AA2F7"

## set pane color border
set -g status-interval 5

# CPU color thresholds
set -g @cpu_low_fg_color "#[fg=#7AA2F7]"
set -g @cpu_medium_fg_color "#[fg=#e0af68]"
set -g @cpu_high_fg_color "#[fg=#f7768e]"

# RAM color thresholds
set -g @ram_low_fg_color "#[fg=#1a1b26]"
set -g @ram_medium_fg_color "#[fg=#e0af68]"
set -g @ram_high_fg_color "#[fg=#c53030]"

set -g status-right "\
#[fg=#353A52,bg=#282C34] #[bg=#353A52] #[bg=#353A52]#{cpu_fg_color}CPU:#{cpu_fg_color}#{cpu_percentage}#[bg=#353A52] \
#[fg=#7AA2F7,bg=#353A52] #[bg=#7AA2F7] #[bg=#7AA2F7]#{ram_fg_color}RAM:#{ram_fg_color}#{ram_percentage}#[bg=#7AA2F7] "
