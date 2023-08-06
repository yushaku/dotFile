##>> git shotcut -------------------------
alias g="git"
alias glz="lazygit"

alias gcl='git clone --recurse-submodules'
alias gao='git remote add origin'

alias ga="git add"
alias gaa="git add --all"

alias gpp="git push"
alias gpf="git push -u --force-with-lease"
alias gpo='git push -u origin $(_git_current_branch)'
alias gpof='git push -u origin --force-with-lease $(_git_current_branch)'

alias gcbb='git checkout -b'
alias gbd='git branch -D'
alias gbdo='git push origin -d'

function gcb() {
	if [[ -z "$1" ]]; then
		git branch --sort=-committerdate |
			fzf --header 'Checkout Recent Branch' \
				--preview 'git diff --color=always {1}' \
				--pointer='' |
			xargs git checkout
	else
		git checkout "$1"
	fi
}
function gbo() {
	if [[ -z "$1" ]]; then
		echo "please enter branch's name"
	else
		git branch --set-upstream-to=origin/"$1" "$1"
	fi
}

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias groh='git reset origin/$(_git_current_branch) --hard'
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

# Remove files from the working tree and from the index
alias grm="git rm"
alias grmc="git rm -r --cached"

#>> git custome function ---------------
function g-reset() {
	selected_files=$(git status --porcelain |
		fzf -m --preview-window 'down' --preview 'git diff --color=always $@ -- {-1}' |
		awk '{print $2}')

	if [ -n "$selected_files" ]; then
		echo "$selected_files" | xargs git checkout --
	fi
}

alias glga="git reflog --pretty=short | batcat"
function glg() {
	git log --graph --oneline --decorate --all -n "${1:-10}"
}

function _git_current_branch() {
	currentBranch=$(git rev-parse --abbrev-ref HEAD)
	echo "$currentBranch"
}

function ggp() {
	if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
		git push origin "${*}"
	else
		[[ "$#" == 0 ]] && local b="$(_git_current_branch)"
		git push origin "${b:=$1}"
	fi
}

function gcm() {
	if [[ -z "$1" ]]; then
		git commit --amend --no-edit
	else
		git commit -m "$1"
	fi
}
