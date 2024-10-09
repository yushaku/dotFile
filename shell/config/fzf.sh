export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_TRIGGER='-'

export FZF_DEFAULT_OPTS=" --preview-window 'right:55%' \
  --bind 'ctrl-/:change-preview-window(down|right|hidden|)' \
  --bind 'ctrl-u:preview-page-up' \
  --bind 'ctrl-d:preview-page-down' \
  --bind 'alt-j:down' \
  --bind 'alt-k:up' \
  --height 60%"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=dark
  --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
  --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
export FZF_CTRL_T_OPTS="--preview 'batcat --color=always --style=header,grid --line-range :300 {}'"

export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --header 'Press CTRL-Y to copy command into clipboard'
"

export FZF_ALT_C_OPTS="--preview 'exa --tree -L 2 --icons {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zstyle ':fzf-tab:complete:cp:*' fzf-preview 'batcat --color=always --italic-text=always $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1a --colour-scale --icons --group-directories-first --color=always $realpath'
