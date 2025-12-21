source "$HOME/.config/zsh/zshenv"

# fnm
FNM_PATH="/home/rinbow/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
