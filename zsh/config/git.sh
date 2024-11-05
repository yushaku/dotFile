##>> git shotcut -------------------------
alias g="git"
alias gcl='git clone --recurse-submodules'

##>> ------------------ ADD -------------------------
alias gss="git status"
alias gaa="git add --all"
ga() {
	local files=($(git diff --name-only))
	local staged_files=($(git diff --name-only --cached))

	local unstaged_files=($(comm -13 <(printf '%s\n' "${staged_files[@]}" | sort) <(printf '%s\n' "${files[@]}" | sort) | _fzf_git --multi --header '📡 Pick files to add to staging'))

	if [[ ${#unstaged_files[@]} -gt 0 ]]; then
		git add "${unstaged_files[@]}"
		echo "Added ${unstaged_files[*]} to staging."
	fi
}
alias gcmm="gitmoji -c"
gcm() {
	if [[ -z "$1" ]]; then
		git commit --amend --no-edit
	else
		git commit -m "$1"
	fi
}

ggp() {
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
grs() {
	if [[ -z "$1" ]]; then
		_fzf_git_hashes | xargs git reset
	else
		git reset "$1"
	fi
}

gudc(){
    local reset_mode="--soft"  # Default reset mode
    if [[ "$1" == "--hard" || "$1" == "--soft" ]]; then
        reset_mode="$1"
        shift  # Shift the arguments to the left so that $2 becomes $1
    fi

    if [[ -n "$1" && "$1" =~ ^[0-9]+$ ]]; then
        git reset "$reset_mode" HEAD~"${1:-1}"
    else
        git reset "$reset_mode" HEAD
    fi
}

grsf() {
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
gcb() {
	local branch
	if [[ -z "$1" ]]; then
		branch=$(_fzf_git_branches)
	else
		branch="$1"
	fi

  if [[ $branch = '' ]]; then
 		return;
  fi

	# Check if the branch exists remotely or locally
	if git rev-parse --verify --quiet "$branch" >/dev/null; then
		# If branch exists, check it out
		git checkout --quiet "$branch"
	elif [[ $branch =~ ^origin/ ]]; then
		# If it's a remote branch, check out and track
		local local_branch=${branch#origin/}
		git checkout --track "$branch" || git checkout -b "$local_branch"
	else
		# If the branch doesn't exist, create it
		git checkout --quiet -b "$branch"
	fi}

gbo() {
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

gsta() {
	if [[ -z "$1" ]]; then
		git stash -au
	else
		git stash -au --message "$1"
	fi
}
alias gst='git stash'
alias gstl='_fzf_git_stashes'
gstp() {
  tag=$(_fzf_git_stashes)
  if [[ $tag = '' ]]; then
    return
  fi

	git stash pop $tag
}
gstd() {
  tag=$(_fzf_git_stashes)
  if [[ $tag = '' ]]; then
    return
  fi

	git stash drop $tag
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

glg() {
	git log --graph --oneline --exclude=refs/stash --decorate --exclude=refs/stash --all -n "${1:-10}"
}

gll() {
	git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph -n "${1:-10}" --color=always "$@"
}

##>> ----------------------------------------------------------<<##
##>> ------------------ PRIVATE FUNCTION ----------------------<<##
# inherit from https://github.com/junegunn/fzf-git.sh

function _git_current_branch() {
	currentBranch=$(git rev-parse --abbrev-ref HEAD)
	echo "$currentBranch"
}

# Redefine this function to change the options
function _fzf_git_check() {
  git rev-parse HEAD > /dev/null 2>&1 && return
  [[ -n $TMUX ]] && tmux display-message "Not in a git repository"
  return 1
}

function _fzf_git() {
  fzf --layout=reverse --multi --height=50% --min-height=20 --border \
    --border-label-pos=2 \
    --color='header:italic:underline,label:blue' \
    --preview-window='right,50%,border-left' \
    --bind='ctrl-/:change-preview-window(down,50%,border-top|hidden|)' "$@"
}

__fzf_git=${BASH_SOURCE[0]:-${(%):-%x}}
__fzf_git=$(readlink -f "$__fzf_git" 2> /dev/null || /usr/bin/ruby --disable-gems -e 'puts File.expand_path(ARGV.first)' "$__fzf_git" 2> /dev/null)

if [[ -z $_fzf_git_cat ]]; then
  export _fzf_git_cat="cat"
  _fzf_git_bat_options="--style='${BAT_STYLE:-full}' --color=always --pager=never"
  if command -v batcat > /dev/null; then
    _fzf_git_cat="batcat $_fzf_git_bat_options"
  elif command -v bat > /dev/null; then
    _fzf_git_cat="bat $_fzf_git_bat_options"
  fi
fi

function _fzf_git_files() {
  _fzf_git_check || return
  local root query
  root=$(git rev-parse --show-toplevel)
  [[ $root != "$PWD" ]] && query='!../ '

  (git -c color.status=always status --short --no-branch
   git ls-files "$root" | grep -vxFf <(git status -s | grep '^[^?]' | cut -c4-; echo :) | sed 's/^/   /') |
  _fzf_git -m --ansi --nth 2..,.. \
    --border-label '📁 Files' \
    --header $'CTRL-O (open in browser) ╱ ALT-E (open in editor)\n\n' \
    --bind "ctrl-o:execute-silent:bash $__fzf_git file {-1}" \
    --bind "alt-e:execute:${EDITOR:-vim} {-1} > /dev/tty" \
    --query "$query" \
    --preview "git diff --no-ext-diff --color=always -- {-1} | sed 1,4d; $_fzf_git_cat {-1}" "$@" |
  cut -c4- | sed 's/.* -> //'
}

function _fzf_git_branches() {
  _fzf_git_check || return
  bash "$__fzf_git" branches | _fzf_git --ansi \
    --border-label '🌲 Branches' \
    --tiebreak begin \
    --preview-window right,border-top,40% \
    --color hl:underline,hl+:underline \
    --no-hscroll \
    --bind 'ctrl-/:change-preview-window(down,70%|hidden|)' \
    --bind "ctrl-o:execute-silent:bash $__fzf_git branch {}" \
    --bind "alt-a:change-border-label(🌳 All branches)+reload:bash \"$__fzf_git\" all-branches" \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) --' "$@" |
  sed 's/^..//' | cut -d' ' -f1
}

function _fzf_git_tags() {
  _fzf_git_check || return
  git tag --sort -version:refname |
  _fzf_git --preview-window right,70% \
    --border-label '📛 Tags' \
    --header $'CTRL-O (open in browser)\n\n' \
    --bind "ctrl-o:execute-silent:bash $__fzf_git tag {}" \
    --preview 'git show --color=always {}' "$@"
}

function _fzf_git_hashes() {
  _fzf_git_check || return
  hashes | _fzf_git --ansi --no-sort --bind 'ctrl-s:toggle-sort' \
    --border-label '🍡 Hashes' \
    --bind "ctrl-o:execute-silent:bash $__fzf_git commit {}" \
    --bind 'ctrl-d:execute:grep -o "[a-f0-9]\{7,\}" <<< {} | head -n 1 | xargs git diff > /dev/tty' \
    --bind "alt-a:change-border-label(🍇 All hashes)+reload:bash \"$__fzf_git\" all-hashes" \
    --color hl:underline,hl+:underline \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | head -n 1 | xargs git show --color=always' "$@" |
  awk 'match($0, /[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9]*/) { print substr($0, RSTART, RLENGTH) }'
}

function _fzf_git_remotes() {
  _fzf_git_check || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  _fzf_git --tac \
    --border-label '📡 Remotes' \
    --header $'CTRL-O (open in browser)\n\n' \
    --bind "ctrl-o:execute-silent:bash $__fzf_git remote {1}" \
    --preview-window right,70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" {1}/"$(git rev-parse --abbrev-ref HEAD)" --' "$@" |
  cut -d$'\t' -f1
}

function _fzf_git_stashes() {
  _fzf_git_check || return
  git stash list | _fzf_git \
    --border-label '🥡 Stashes' \
    --header $'CTRL-X (drop stash)\n\n' \
    --bind 'ctrl-x:reload(git stash drop -q {1}; git stash list)' \
    -d: --preview 'git show --color=always {1}' "$@" |
  cut -d: -f1
}

function _fzf_git_lreflogs() {
  _fzf_git_check || return
  git reflog --color=always --format="%C(blue)%gD %C(yellow)%h%C(auto)%d %gs" | _fzf_git --ansi \
    --border-label '📒 Reflogs' \
    --preview 'git show --color=always {1}' "$@" |
  awk '{print $1}'
}

function _fzf_git_each_ref() {
  _fzf_git_check || return
  refs | _fzf_git --ansi \
    --nth 2,2.. \
    --tiebreak begin \
    --border-label '☘️  Each ref' \
    --preview-window down,border-top,40% \
    --color hl:underline,hl+:underline \
    --no-hscroll \
    --bind 'ctrl-/:change-preview-window(down,70%|hidden|)' \
    --bind "ctrl-o:execute-silent:bash $__fzf_git {1} {2}" \
    --bind "alt-e:execute:${EDITOR:-vim} <(git show {2}) > /dev/tty" \
    --bind "alt-a:change-border-label(🍀 Every ref)+reload:bash \"$__fzf_git\" all-refs" \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" {2} --' "$@" |
  awk '{print $2}'
}

function _fzf_git_worktrees() {
  _fzf_git_check || return
  git worktree list | _fzf_git \
    --border-label '🌴 Worktrees' \
    --header $'CTRL-X (remove worktree)\n\n' \
    --bind 'ctrl-x:reload(git worktree remove {1} > /dev/null; git worktree list)' \
    --preview '
      git -c color.status=always -C {1} status --short --branch
      echo
      git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" {2} --
    ' "$@" |
  awk '{print $1}'
}

function branches() {
  git branch "$@" \
    --sort=-HEAD \
    --color=always \
    --sort=-committerdate \
    --format=$'%(HEAD) %(color:yellow)%(refname:short) %(color:green)(%(committerdate:relative))\t%(color:blue)%(subject)%(color:reset)'  |
  column -ts$'\t'
}

function  refs() {
  git for-each-ref --sort=-creatordate --sort=-HEAD --color=always --format=$'%(refname) %(color:green)(%(creatordate:relative))\t%(color:blue)%(subject)%(color:reset)' |
    eval "$1" |
    sed 's#^refs/remotes/#\x1b[95mremote-branch\t\x1b[33m#; s#^refs/heads/#\x1b[92mbranch\t\x1b[33m#; s#^refs/tags/#\x1b[96mtag\t\x1b[33m#; s#refs/stash#\x1b[91mstash\t\x1b[33mrefs/stash#' |
    column -ts$'\t'
}

function hashes() {
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always "$@"
}

if [[ $# -eq 1 ]]; then
  case "$1" in
    branches)
      echo $'CTRL-O (open in browser) ╱ ALT-A (show all branches)\n'
      branches
      ;;

    all-branches)
      echo $'CTRL-O (open in browser)\n'
      branches -a
      ;;

    hashes)
      echo $'CTRL-O (open in browser) ╱ CTRL-D (diff)\nCTRL-S (toggle sort) ╱ ALT-A (show all hashes)\n'
      hashes
      ;;

    all-hashes)
      echo $'CTRL-O (open in browser) ╱ CTRL-D (diff)\nCTRL-S (toggle sort)\n'
      hashes --all
      ;;

    refs)
      echo $'CTRL-O (open in browser) ╱ ALT-E (examine in editor) ╱ ALT-A (show all refs)\n'
      refs 'grep -v ^refs/remotes'
      ;;

    all-refs)
      echo $'CTRL-O (open in browser) ╱ ALT-E (examine in editor)\n'
      refs 'cat'
      ;;

    nobeep) ;;
    *) exit 1 ;;
  esac
elif [[ $# -gt 1 ]]; then
  set -e

  branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ $branch = HEAD ]]; then
    branch=$(git describe --exact-match --tags 2> /dev/null || git rev-parse --short HEAD)
  fi

  # Only supports GitHub for now
  case "$1" in
    commit)
      hash=$(grep -o "[a-f0-9]\{7,\}" <<< "$2")
      path=/commit/$hash
      ;;
    branch|remote-branch)
      branch=$(sed 's/^[* ]*//' <<< "$2" | cut -d' ' -f1)
      remote=$(git config branch."${branch}".remote || echo 'origin')
      branch=${branch#$remote/}
      path=/tree/$branch
      ;;
    remote)
      remote=$2
      path=/tree/$branch
      ;;
    file) path=/blob/$branch/$(git rev-parse --show-prefix)$2 ;;
    tag)  path=/releases/tag/$2 ;;
    *)    exit 1 ;;
  esac

  remote=${remote:-$(git config branch."${branch}".remote || echo 'origin')}
  remote_url=$(git remote get-url "$remote" 2> /dev/null || echo "$remote")

  if [[ $remote_url =~ ^git@ ]]; then
    url=${remote_url%.git}
    url=${url#git@}
    url=https://${url/://}
  elif [[ $remote_url =~ ^http ]]; then
    url=${remote_url%.git}
  fi

  case "$(uname -s)" in
    Darwin) open "$url$path"     ;;
    *)      xdg-open "$url$path" ;;
  esac
  exit 0
fi
