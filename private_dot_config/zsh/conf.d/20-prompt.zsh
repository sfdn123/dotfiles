if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
else
    _dotfiles_mark_missing "starship"
fi
