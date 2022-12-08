# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

# Set name of the theme to load
eval "$(oh-my-posh init zsh)"
eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/yushaku.omp.json)"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5fff87,Italic"
HYPHEN_INSENSITIVE="true"
# ENABLE_CORRECTION="true"
HIST_STAMPS="dd/mm/yyyy"
DISABLE_UNTRACKED_FILES_DIRTY="true"
# zstyle ':omz:update' frequency 13
# CASE_SENSITIVE="true"
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"

# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(
  git
  fzf
  nvm
  z
  docker-compose
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# aliases ===========================================================>
alias wcc="warp-cli connect"
alias wcd="warp-cli disconnect"

alias gcmn="git commit --amend --no-edit --no-verify"
alias e="exit"
alias tmuxconfig="code ~/.tmux.conf"
alias zshconfig="code ~/.zshrc"
alias nvimconfig="nvim ~/.config/init.vim"
alias cl="clear"
alias bat="batcat"

# list command alias =======================================

alias ll="exa -l --icons"
alias lt="exa --tree -I='node_modules|dist|deploy' -L"
alias fd="fdfind"

# npm start -----------
alias n="npm"

alias y="yarn"
alias yrm="yarn remove"
alias ya="yarn add"
alias yad="yarn add -D"
alias yb="yarn build"
# npm end -----------

# pnpm start -----------------------------------------------------------------
alias p="pnpm"
alias pi="pnpm install"
alias pa="pnpm add"
alias pad="pnpm add -D"
alias prm="pnpm remove"
alias pb="pnpm build"

export PNPM_HOME="/home/yushaku/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end -----------------------------------

# FZF start -------------------------------------------------------------
export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_COMMAND="fdfind --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
#FZF end ----------------------------

if [ -f .nvmrc ]; then
  nvm use
fi
