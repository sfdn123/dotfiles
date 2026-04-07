autoload -Uz compinit

if command -v sheldon >/dev/null 2>&1; then
    if sheldon_source="$(sheldon source)"; then
        eval "$sheldon_source"
    else
        _dotfiles_mark_missing "sheldon plugins"
    fi
else
    _dotfiles_mark_missing "sheldon"
fi

compinit

unset sheldon_source
