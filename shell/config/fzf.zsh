export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_COMMAND="fdfind --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

_preview_search(){
  fzf --preview='batcat --color="always" --style="numbers" {}' --bind shift-up:preview-page-up shift-down:preview-page-down
}

_preview_tree () {
  fzf --preview='exa --tree -s -I='node_modules|dist|deploy' -L'
}

alias ff="_preview_search"
