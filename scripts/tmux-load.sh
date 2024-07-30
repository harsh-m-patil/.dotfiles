#!/bin/bash

# Check if inside a tmux session
if [ -n "$TMUX" ]; then
  exit 0
fi

# Check if tmux server is running
if tmux has-session -t=base 2> /dev/null; then
  # Attach to an existing tmux session
  tmux -u attach-session  
else
  # Start a new session
  tmux -u new-session -s base 
fi
