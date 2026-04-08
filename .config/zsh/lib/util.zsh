# One-time warning system

typeset -gA _ZSH_WARNED

warn_missing() {
  local key="$1"

  # Already warned → skip
  [[ -n "${_ZSH_WARNED[$key]}" ]] && return

  _ZSH_WARNED[$key]=1
  print -P "%F{yellow}⚠ missing:%f $key"
}

# usage:
#   run_cmd <cmd> <init command...>
run_cmd() {
  local cmd="$1"
  shift

  if command -v "$cmd" >/dev/null 2>&1; then
    eval "$@"
  else
    warn_missing "$cmd"
  fi
}
