##>> git shotcut -------------------------
alias g="git"
alias ga="git add"
alias gaa="git add --all"

alias gpp="git push"
alias gpf="git push --set-upstream -f"
alias gpo='git push --set-upstream origin $(git_current_branch)'
alias gpof='git push --set-upstream origin $(git_current_branch) -f'

alias gcl='git clone --recurse-submodules'

alias gcb='git checkout'
alias gccb='git checkout -b'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias groh='git reset origin/$(git_current_branch) --hard'
alias grs="git reset"

alias gst='git stash'
alias gsta='git stash -u'
alias gstp='git stash pop'
alias gstd="git stash drop"

alias gss="git status"

alias gpull="git pull -a"
alias gpur="git pull --rebase -v"

alias gft="git fetch"
alias gfa="git fetch --all"
alias gmr="git merge"
alias grm="git rm"

alias glg="git log --graph --oneline --decorate --all -n 10"
alias glga="git reflog --pretty=short"
function gshow(){
  git show --name-only $1
}

##>> git custome function ---------------
function git_current_branch() {
  currentBranch=$(git rev-parse --abbrev-ref HEAD)
  echo $currentBranch
}

function ggp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push origin "${b:=$1}"
  fi
}
compdef _git ggp=git-checkout

function gcm (){
  if [[ -z "$1" ]]; then
    git commit --amend --no-edit
  else
    git commit -m "$1" 
  fi
}
# Pretty log messages
function _git_log_prettily() {
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
compdef _git _git_log_prettily=git-log

function glz() {
  if [[ ! -z "$1" ]]; then
    git add .
    git commit -m "$1"
    git push $(git_current_branch)
  else
    git add .
    git commit --amend --no-edit
    git push -f $(git_current_branch)
  fi
}
