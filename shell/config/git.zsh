##>> git shotcut -------------------------
alias g="git"
alias ga="git add"
alias gaa="git add --all"

alias gpp="git push"
alias gpf="git push --set-upstream -f"
alias gpo='git push --set-upstream origin $(git_current_branch)'
alias gpof='git push --set-upstream origin $(git_current_branch) -f'

alias gcl='git clone --recurse-submodules'

alias gcbb='git checkout -b'
alias gcb="git branch --sort=-committerdate | fzf --header 'Checkout Recent Branch' --preview 'git diff --color=always {1}' --pointer='' | xargs git checkout"

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
alias grmc="git rm -r --cached"

alias glga="git reflog --pretty=short"

#>> git custome function ---------------

function gdiff() {
  git diff $@ --name-only |\
  fzf --preview-window 'down' \
  --preview 'git diff $@ -- {-1} | delta' \
  --bind 'ctrl-/:change-preview-window(right|hidden|)'
}


function g-reset(){
  selected_files=$(git status --porcelain |\
    fzf -m --preview-window 'down' --preview 'git diff --color=always $@ -- {-1}' |\
    awk '{print $2}')

  if [ -n "$selected_files" ]; then
    echo "$selected_files" | xargs git checkout --
  fi
}

function g-log(){
  git log --graph --oneline --decorate --all -n ${1:-10}
}

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

function gcm (){
  if [[ -z "$1" ]]; then
    git commit --amend --no-edit
  else
    git commit -m "$1" 
  fi
}
