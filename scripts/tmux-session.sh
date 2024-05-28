#!/usr/bin/env bash

selected=$(tmux ls | fzf-tmux -p -h 50% -w 60% --reverse | cut -d":" -f1)
directorys=$(fd . '/home/harsh/projects' --type d --min-depth 2 --maxdepth 2 | fzf)
sessions=$(tmux ls)

if [[ -z $selected ]]; then
    exit 0
fi

if tmux has-session -t=$selected; then
    echo $selected
else
    echo "Not in selected"
fi

tmux switch-client -t $selected
