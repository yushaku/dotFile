export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_TRIGGER='?'

export FZF_DEFAULT_OPTS="
  --preview-window 'right:60%'
  --bind 'ctrl-/:change-preview-window(down|right|hidden|)'
  --bind 'ctrl-u:preview-page-down'
  --bind 'ctrl-d:preview-page-up'
  --height 60%"

export FZF_CTRL_T_OPTS=" --preview 'batcat --color=always --style=header,grid --line-range :300 {}'"

export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --header 'Press CTRL-Y to copy command into clipboard'"

export FZF_ALT_C_OPTS="--preview 'exa --tree -L 2 --icons {}'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


