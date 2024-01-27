# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi
