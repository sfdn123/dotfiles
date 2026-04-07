if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
else
    _dotfiles_mark_missing "zoxide"
fi
