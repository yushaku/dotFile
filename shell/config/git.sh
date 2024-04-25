##>> git shotcut -------------------------
alias g="git"
alias gcl='git clone --recurse-submodules'

##>> ------------------ ADD -------------------------
alias gss="git status"
alias gaa="git add --all"
function ga() {
	local files=($(git diff --name-only))
	local staged_files=($(git diff --name-only --cached))

	local unstaged_files=($(comm -13 <(printf '%s\n' "${staged_files[@]}" | sort) <(printf '%s\n' "${files[@]}" | sort) | _fzf_git --multi --header '📡 Pick files to add to staging'))

	if [[ ${#unstaged_files[@]} -gt 0 ]]; then
		git add "${unstaged_files[@]}"
		echo "Added ${unstaged_files[*]} to staging."
	fi
}
alias gcmm="gitmoji -c"
function gcm() {
	if [[ -z "$1" ]]; then
		git commit --amend --no-edit
	else
		git commit -m "$1"
	fi
}

function ggp() {
	if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
		git push origin "${*}"
	else
		[[ "$#" == 0 ]] && local b="$(_git_current_branch)"
		git push origin "${b:=$1}"
	fi
}

##>> ------------------ RESET -------------------------

alias grmc="git rm -r --cached" # Remove files from the working tree and from the index
alias groh='git reset origin/$(_git_current_branch) --hard'
function grs() {
	if [[ -z "$1" ]]; then
		_fzf_git_hashes | xargs git reset
	else
		git reset "$1"
	fi
}

function grsf() {
	local selected_files=$(
		git status --porcelain |
			_fzf_git --multi --header '📡 Reset files' |
			awk '{print $2}'
	)

	if [ -n "$selected_files" ]; then
		echo "$selected_files" | xargs git checkout --
		echo "restore files: $selected_files"
	fi
}

##>> ------------------ PUSH -------------------------

alias gpp="git push"
alias gpf="git push -u --force-with-lease"
alias gpo='git push -u origin $(_git_current_branch)'
alias gpof='git push -u origin --force-with-lease $(_git_current_branch)'

##>> ------------------ BRANCH -------------------------

alias grmb='git branch -D'
alias grmbo='git push origin -d'
function gcb() {
	local branch
	if [[ -z "$1" ]]; then
		branch=$(_fzf_git_branches)
	else
		branch="$1"
	fi

	if [[ $branch =~ ^origin/ ]]; then
		local local_branch=${branch#origin/}
		git checkout -t "$branch" || git checkout -b "$local_branch"
	else
		git checkout -q -- "$branch" || {
			git checkout -q -b "$branch" &&
				git pull --set-upstream origin "$branch"
		}
	fi
}

function gbo() {
	if [[ -z "$1" ]]; then
		echo "please enter branch's name"
	else
		git branch --set-upstream-to=origin/"$1" "$1"
	fi
}

##>> ------------------ REBASE -------------------------

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'

##>> ------------------ CHERRY-PICK -------------------------

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

##>> ------------------ STASH -------------------------

function gsta() {
	if [[ -z "$1" ]]; then
		git stash -au
	else
		git stash -au --message "$1"
	fi
}
alias gst='git stash'
alias gstl='_fzf_git_stashes'
function gstp() {
	_fzf_git_stashes | xargs git stash pop
}
function gstd() {
	_fzf_git_stashes | xargs git stash drop
}

# https://itnext.io/multitask-like-a-pro-with-the-wip-commit-2f4d40ca0192
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "🗂 --wip-- [skip ci]"'
alias grmw='git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'

##>> ------------------ FETCH -------------------------
alias gpull="git pull -a"
alias gpur="git pull --rebase -v"

alias gft="git fetch"
alias gfa="git fetch --all"

alias gmr="git merge"

##>> ------------------ LOG -------------------------
alias glga="git reflog --pretty=short | batcat"

function glg() {
	git log --graph --oneline --exclude=refs/stash --decorate --exclude=refs/stash --all -n "${1:-10}"
}

function glgc() {
	git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph -n "${1:-10}" --color=always "$@"
}

##>> ----------------------------------------------------------<<##
##>> ------------------ PRIVATE FUNCTION ----------------------<<##

function _git_current_branch() {
	currentBranch=$(git rev-parse --abbrev-ref HEAD)
	echo "$currentBranch"
}
