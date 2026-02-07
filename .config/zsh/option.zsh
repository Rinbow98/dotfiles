# ================================
# Zsh Option
# ================================

# --------- History behavior ---------

# History file
export HISTFILE="$HOME/.zsh_history"

# Max history line（session）
HISTSIZE=10000

# Max history line in file
SAVEHIST=10000

# Append history instead of overwriting
setopt APPEND_HISTORY

# Share history immediately between all sessions
setopt SHARE_HISTORY

# Append each command to history file incrementally
setopt INC_APPEND_HISTORY

# Remove duplicate commands from history
setopt HIST_IGNORE_ALL_DUPS

# Ignore commands that start with space
setopt HIST_IGNORE_SPACE

# Optional: timestamp in history
setopt EXTENDED_HISTORY

# --------- Directory navigation ---------

# Allow `cd` without typing `cd`
# Example: `..` instead of `cd ..`
setopt AUTO_CD

# Push directories to stack automatically on cd
# Enables `dirs`, `pushd`, `popd`
setopt AUTO_PUSHD

# Do not store duplicate directories in stack
setopt PUSHD_IGNORE_DUPS

# Allow `cd -<TAB>` to complete directory stack
setopt PUSHD_MINUS

# --------- Completion behavior ---------

# Show completion menu when multiple matches exist
setopt AUTO_MENU

# Perform completion even inside a word
# Example: path completion in middle of string
setopt COMPLETE_IN_WORD

# Treat hyphenated words as separate units
# Example: git-checkout → git / checkout
setopt NO_NOMATCH

# --------- Globbing & safety ---------

# Do not error on unmatched glob patterns
# Example: `rm *.tmp` won't crash if no match
setopt NO_NOMATCH

# Require explicit confirmation for `rm *`
# Prevents catastrophic deletes
setopt RM_STAR_WAIT

# --------- Job control ---------

# Warn before exiting shell with running jobs
setopt CHECK_JOBS

# Allow background jobs to continue after logout
setopt NO_HUP

# --------- Input / output ---------

# Allow comments in interactive shell
# Example: `ls # list files`
setopt INTERACTIVE_COMMENTS

# Disable terminal beep
# Improves sanity
setopt NO_BEEP

# Words seperate like bash
autoload -U select-word-style && select-word-style bash

# Edit command line
autoload -z edit-command-line

# --------- Misc usability ---------

# Expand aliases before completion
# Makes alias + completion work together
setopt COMPLETE_ALIASES

# --------- Autoload ---------

# Auto completion
autoload -Uz compinit && compinit -C

