# One-time warning system

typeset -gA _ZSH_WARNED

warn_missing() {
  local key="$1"

  # Already warned → skip
  [[ -n "${_ZSH_WARNED[$key]}" ]] && return

  _ZSH_WARNED[$key]=1
  print -P "%F{yellow}⚠ missing:%f $key"
}


# Show system info

show_macchina() {
  command -v macchina >/dev/null 2>&1 || return
  macchina -t astatine
}
