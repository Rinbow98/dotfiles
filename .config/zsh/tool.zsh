# ================================
# Tool
# ================================

# usage:
#   tool_init <cmd> <init command...>
tool_init() {
  local cmd="$1"
  shift

  if command -v "$cmd" >/dev/null 2>&1; then
    eval "$@"
  else
    warn_missing "$cmd"
  fi
}

# Prompt
tool_init starship 'eval "$(starship init zsh)"'

# Smart cd
tool_init zoxide 'eval "$(zoxide init zsh)"'

# Node version manager
# tool_init fnm 'eval "$(fnm env --use-on-cd)"'

# System info (optional)
tool_init macchina 'alias sysinfo="macchina -t astatine"'
