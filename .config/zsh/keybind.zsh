# ================================
# Key binding
# ================================

# Use emacs keymap (default, predictable)
bindkey -e

# --------- Cursor movement ---------

# Up / Down substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Ctrl + Left / Right (most terminals)
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Alternative sequences (macOS / some terminals)
bindkey '^[[5D' backward-word
bindkey '^[[5C' forward-word

# --------- Quality of life ---------

# Home / End
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# --------- Word deletion ---------
x-bash-backward-kill-word(){
    WORDCHARS='' zle backward-kill-word
}
zle -N x-bash-backward-kill-word
bindkey '^W' x-bash-backward-kill-word

# --------- Edit command ---------
zle -N edit-command-line
bindkey '^x' edit-command-line

