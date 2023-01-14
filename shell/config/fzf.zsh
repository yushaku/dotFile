export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_COMMAND="fdfind --type file --color=always"
export FZF_DEFAULT_OPTS="--preview-window 'right:20%' --preview 'batcat --color=always --style=header,grid --line-range :300 {}'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if ! command -v rg &> /dev/null
then
    echo "rg could not be found"
    sudo apt install ripgrep
    echo 1
    exit
fi


alias f="find * | fzf --prompt 'All> ' \
             --header 'CTRL-D: Directories / CTRL-F: Files' \
             --bind 'ctrl-d:change-prompt(Directories> )+reload(find * -type d)' \
             --bind 'ctrl-f:change-prompt(Files> )+reload(find * -type f)'"

