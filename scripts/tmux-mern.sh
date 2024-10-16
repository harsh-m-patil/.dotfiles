!/usr/bin/env bash

# Create the third window and run the database server
tmux new-window -t :4 -n "DBServer"
tmux send-keys -t :4 "mongod --dbpath='/home/harsh/.db/data'" Enter
tmux split-window -h 
tmux send-keys -t :4.2 "sleep 2 && mongosh" Enter
tmux send-keys -t :4.2 "cls" Enter

# Create the second window with two panes
tmux new-window -t :3 -n "DevServer"
tmux send-keys -t :3 "cd server" Enter
tmux send-keys -t :3 "npm run dev" Enter
tmux split-window -h 
tmux send-keys -t :3.2 "cd client" Enter
tmux send-keys -t :3 "npm run dev" Enter


tmux new-window -t :2 -n "FrontEnd"
tmux send-keys -t :2 "cd client" Enter
tmux send-keys -t :2 "nvim" Enter

tmux rename-window -t :1 "BackEnd"
tmux send-keys -t :1 "cd server" Enter
tmux send-keys -t :1 "nvim" Enter

