#!/usr/bin/env bash

# Create the second window with two panes
tmux new-window -t :2 -n "DevServer"
tmux send-keys -t :2 "npm run dev" Enter
tmux split-window -h 
tmux send-keys -t :2.2 "ls" Enter

# Create the first window and open neovim
tmux rename-window -t :1 "Code"
tmux send-keys -t :1 "nvim -c ':Telescope find_files'" Enter
