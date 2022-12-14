##>> tmux shotcut --------------------
alias t="TERM=screen-256color-bce tmux"
alias tls="tmux ls"
alias ta="tmux attach -t"
alias tad='tmux attach -d -t'
alias tksv="tmux kill-server"
alias trm="tmux kill-session -t"

function _zsh_tmux_plugin_run() {
  if [[ -n "$@" ]]; then
    command tmux "$@"
    return $?
  fi

  local -a tmux_cmd
  tmux_cmd=(command tmux)
  [[ "$ZSH_TMUX_ITERM2" == "true" ]] && tmux_cmd+=(-CC)
  [[ "$ZSH_TMUX_UNICODE" == "true" ]] && tmux_cmd+=(-u)

  # Try to connect to an existing session.
  [[ "$ZSH_TMUX_AUTOCONNECT" == "true" ]] && $tmux_cmd attach

  # If failed, just run tmux, fixing the TERM variable if requested.
  if [[ $? -ne 0 ]]; then
    if [[ "$ZSH_TMUX_FIXTERM" == "true" ]]; then
      tmux_cmd+=(-f "$_ZSH_TMUX_FIXED_CONFIG")
    elif [[ -e "$ZSH_TMUX_CONFIG" ]]; then
      tmux_cmd+=(-f "$ZSH_TMUX_CONFIG")
    fi
    if [[ -n "$ZSH_TMUX_DEFAULT_SESSION_NAME" ]]; then
      $tmux_cmd new-session -s $ZSH_TMUX_DEFAULT_SESSION_NAME
    else
      $tmux_cmd new-session
    fi
  fi

  if [[ "$ZSH_TMUX_AUTOQUIT" == "true" ]]; then
    exit
  fi
}

compdef _tmux _zsh_tmux_plugin_run
alias tmux=_zsh_tmux_plugin_run
