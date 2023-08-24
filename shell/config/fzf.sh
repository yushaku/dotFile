export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_TRIGGER='?'

export FZF_DEFAULT_OPTS=" --preview-window 'right:55%' \
  --bind 'ctrl-/:change-preview-window(down|right|hidden|)' \
  --bind 'ctrl-u:preview-page-up' \
  --bind 'ctrl-d:preview-page-down' \
  --bind 'ctrl-j:down' \
  --bind 'ctrl-k:up' \
  --height 60%"

export FZF_CTRL_T_OPTS=" --preview 'batcat --color=always --style=header,grid --line-range :300 {}'"

export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --header 'Press CTRL-Y to copy command into clipboard'"

export FZF_ALT_C_OPTS="--preview 'exa --tree -L 2 --icons {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##>>> fzf-tab configuration --------------------------
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'batcat --color=always --italic-text=always $realpath'
zstyle ':fzf-tab:complete:cp:*' fzf-preview 'batcat --color=always --italic-text=always $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1a --colour-scale --icons --group-directories-first --color=always $realpath'

# function check_terminal_size() {
# 	if [[ "$LINES $COLUMNS" != "$previous_lines $previous_columns" ]]; then
# 		set_default_opts
# 	fi
# 	previous_lines=$LINES
# 	previous_columns=$COLUMNS
# }
#https://www.google.com/webhp?hl=vi&ictx=2&sa=X&ved=0ahUKEwj6796kpL3-AhUHmlYBHRgQCO8QPQgJ
# function set_default_opts() {
# 	HEIGHTVAR=$(($LINES / 2))
# 	WIDTHVAR=$(($COLUMNS / 2))
# 	zstyle ':fzf-tab:*' fzf-pad $HEIGHTVAR
# 	export FZF_DEFAULT_OPTS="--color=fg:#707a8c,bg:-1,hl:#3e9831,fg+:#cbccc6,bg+:#434c5e,hl+:#af87ff \
#     --color=dark \
#     --color=info:#ea9d34,prompt:#af87ff,pointer:#cb6283,marker:#cb6283,spinner:#ff87d7 \
#     --sort \
#     --preview-window=right:$WIDTHVAR \
#     --bind 'ctrl-/:change-preview-window(down|hidden|)' \
#     --border rounded"
# }
# set_default_opts && trap check_terminal_size WINCH
