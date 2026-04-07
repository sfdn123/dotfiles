autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

if [[ -n "${terminfo[kcuu1]:-}" ]]; then
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
else
    bindkey "^[[A" up-line-or-beginning-search
fi

if [[ -n "${terminfo[kcud1]:-}" ]]; then
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
else
    bindkey "^[[B" down-line-or-beginning-search
fi
