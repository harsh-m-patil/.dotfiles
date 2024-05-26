#!/usr/bin/env bash

tool=$(gum choose "language" "command")

if [ "${tool}" == "language" ]; then
  lang=$(gum input --placeholder "Enter language")
  query=$(gum input --placeholder "Enter query")
  if [ -n "$TMUX" ]; then
    tmux neww bash -c "curl -s cht.sh/$lang/$query | less"
  else
    curl cht.sh/$lang/$query | less
  fi
else
  command=$(gum input --placeholder "Enter Command") 
  query=$(gum input --placeholder "Enter query")
  if [ -n "$TMUX" ]; then
    tmux neww bash -c "curl -s cht.sh/$command/$query | less"
  else
    curl cht.sh/$command/$query | less
  fi
fi
