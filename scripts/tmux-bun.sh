#!/usr/bin/env bash

# Create the third window and run the database server
tmux new-window -t :3 -n "DBServer"
tmux send-keys -t :3 "mongod --dbpath='/home/harsh/.db/data'" Enter
tmux split-window -h 
tmux send-keys -t :3.2 "sleep 2 && mongosh" Enter

# Create the second window with two panes
tmux new-window -t :2 -n "DevServer"
tmux send-keys -t :2 "bun run dev" Enter
tmux split-window -h 
tmux send-keys -t :2.2 "ls" Enter

# Create the first window and open neovim
tmux rename-window -t :1 "Code"
tmux send-keys -t :1 "nvim -c ':Telescope find_files'" Enter
