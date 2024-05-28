#!/usr/bin/env bash

tool=$(gum choose "language" "command")

if [ "${tool}" == "language" ]; then
    lang=$(gum input --placeholder "Enter language")
    query=$(gum input --placeholder "Enter query")
    if [ -n "$TMUX" ]; then
        if [[ -z $query ]]; then
            tmux neww bash -c "curl -s cht.sh/$lang | less"
        else
            tmux neww bash -c "curl -s cht.sh/$lang/$query | less"
        fi
    else 
        curl cht.sh/$lang/$query | less
    fi
else
    command=$(gum input --placeholder "Enter Command") 
    query=$(gum input --placeholder "Enter query")
    if [ -n "$TMUX" ]; then
        if [[ -z $query ]]; then
            tmux neww bash -c "curl -s cht.sh/$command | less"
        else
            tmux neww bash -c "curl -s cht.sh/$command~$query | less"
        fi
    else
        curl cht.sh/$command~$query | less
    fi
fi
