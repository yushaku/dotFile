export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_COMMAND="fdfind --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if ! command -v rg &> /dev/null
then
    echo "rg could not be found"
    sudo apt install ripgrep
    echo 1
    exit
fi

