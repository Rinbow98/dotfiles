# ================================
# Aliases
# ================================

# --- Safety -------------------------------------------------

# Ask before overwriting / deleting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# --- Navigation --------------------------------------------

# Go back multiple directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# --- Listing ------------------------------------------------

# Use colorized ls if supported
alias ls='ls --color=auto'

# Common ls shortcuts
alias ll='ls -lh'
alias la='ls -lAh'

# --- Grep / search -----------------------------------------

# Colored grep output
alias grep='grep --color=auto'

# --- System -------------------------------------------------

# Disk usage (human readable)
alias df='df -h'
alias du='du -h'

# Free memory (Linux / macOS compatible)
alias free='free -h 2>/dev/null || vm_stat'

# --- Networking --------------------------------------------

# Show listening ports
alias ports='netstat -tulanp 2>/dev/null || lsof -i -P -n'

# --- Editors ------------------------------------------------

# Choose prefer editor
alias v='nvim'

# --- Misc ---------------------------------------------------

# Reload zsh config
alias reload='source ~/.zshrc'

