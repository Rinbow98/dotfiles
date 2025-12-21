# ================================
# Zsh Plugin
# ================================

ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"

if [[ ! -f "$ZINIT_HOME/zinit.zsh" ]]; then
  warn_missing "zinit"
  return
fi

# Try to load plugin by zinit light ，warning if load failed
# Usage:
#   zinit_light <plugin-name>
zinit_light() {
  local plugin="$1"

  if ! zinit light "$plugin" 2>/dev/null; then
    warn_missing "$plugin"
  fi
}

source "$ZINIT_HOME/zinit.zsh"

zinit_light zsh-users/zsh-autosuggestions
zinit_light zsh-users/zsh-syntax-highlighting
zinit_light zsh-users/zsh-history-substring-search
zinit_light Aloxaf/fzf-tab

zinit cdreplay -q
