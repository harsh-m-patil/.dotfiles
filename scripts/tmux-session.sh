#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(fd .  ~/.dotfiles/ ~/projects --min-depth 1 --maxdepth 1 --type d --hidden --exclude .git | fzf-tmux -p -h 80% -w 80% --preview="eza {} -L 1 --tree --icons --color=always --git-ignore")
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux -u new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux -u new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
