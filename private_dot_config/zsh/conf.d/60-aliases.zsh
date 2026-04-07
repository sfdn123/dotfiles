if command -v bat >/dev/null 2>&1; then
    alias cat='bat -pP'
else
    _dotfiles_mark_missing "bat"
fi
