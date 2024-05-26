#!/usr/bin/env bash
selected=`cat ~/.tmux-cht-languages ~/.tmux-cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "curl -s cht.sh/$selected/$query | less"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
