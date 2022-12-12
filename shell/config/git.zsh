##>> git shotcut -------------------------
alias g="git"
alias ga="git add"
alias gaa="git add --all"

alias gcm="git commit -m"
alias gcmn="git commit --amend --no-edit"

alias gp="git push"
alias gpf="git push -f"
alias gpo="git push --set-upstream origin"

alias gcl='git clone --recurse-submodules'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias groh='git reset origin/$(git_current_branch) --hard'

##>> git custome function ---------------

function ggp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push origin "${b:=$1}"
  fi
}
compdef _git ggp=git-checkout

# Pretty log messages
function _git_log_prettily() {
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
compdef _git _git_log_prettily=git-log

function lazygit() {
  if ( $# -eq 0 ); then
    git add --all
    git commit --ament --no-edit
    git push -f
  else 
    git add --all
    git commit -m "$1"
    git push
  fi
}
