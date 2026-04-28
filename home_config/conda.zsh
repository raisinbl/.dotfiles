# Modular conda initialization for zsh
# Tries multiple strategies to find conda and enable shell integration.
# Safe to source from ~/.zshrc (e.g. source "$DOTFILES/home_config/conda.zsh").

# Try initializing using a given conda executable
_conda_try_exec() {
  local conda_exec="$1"
  [ -x "$conda_exec" ] || return 1
  local setup
  setup="$("$conda_exec" 'shell.zsh' 'hook' 2>/dev/null)" || return 1
  [ -n "$setup" ] && { eval "$setup"; return 0; }
  return 1
}

# Prefer already-known CONDA_EXE
if [ -n "$CONDA_EXE" ] && [ -x "$CONDA_EXE" ]; then
  _conda_try_exec "$CONDA_EXE" && unset -f _conda_try_exec && return 0
fi

# If "conda" is on PATH, use it
if command -v conda >/dev/null 2>&1; then
  _conda_try_exec "$(command -v conda)" && unset -f _conda_try_exec && return 0
fi

# Common install roots to probe
possible_roots=(
  "$HOME/miniconda3"
  "$HOME/opt/miniconda3"
  "$HOME/anaconda3"
  "$HOME/miniforge3"
  "$HOME/opt/miniforge3"
  "/opt/miniconda3"
  "/opt/anaconda3"
  "/usr/local/Caskroom/miniforge"
  "/opt/homebrew/Caskroom/miniforge"
)

for root in "${possible_roots[@]}"; do
  if _conda_try_exec "$root/bin/conda"; then
    unset -f _conda_try_exec
    return 0
  fi
  if [ -f "$root/etc/profile.d/conda.sh" ]; then
    . "$root/etc/profile.d/conda.sh"
    unset -f _conda_try_exec
    return 0
  fi
done

# Last fallback: system profile.d
if [ -f "/etc/profile.d/conda.sh" ]; then
  . "/etc/profile.d/conda.sh"
  unset -f _conda_try_exec
  return 0
fi

# Nothing found; clean up
unset -f _conda_try_exec
return 1
