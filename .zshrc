# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit,if its not there
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load zsh-completions
autoload -U compinit && compinit

# bindkey '^f' autosuggest-accept
bindkey -e

source ~/.zsh_aliases

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
# Don't save commands that start with space
setopt histignorespace 
# If a new command is a duplicate, remove the older one
setopt histignorealldups                                        
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# save commands are added to the history immediately, otherwise only when shell exits.
setopt inc_append_history                                       
setopt CORRECT
setopt interactivecomments

# Completion styling
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

eval "$(starship init zsh)"
# Set up fzf key bindings and fuzzy completion
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# FZF Options

export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
--walker-skip .git,node_modules,target
--preview 'eza --tree --color=always {}'"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
--preview 'echo {}' --preview-window up:3:hidden:wrap
--bind 'ctrl-/:toggle-preview'
--bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy )+abort'
--color header:italic
--header 'Press CTRL-y to copy to clipboard'"

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'
export EDITOR='nvim'
export PATH="$HOME/go/bin:$PATH"
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8
