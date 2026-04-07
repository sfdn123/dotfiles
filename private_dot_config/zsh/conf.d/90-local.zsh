# Machine-specific settings such as conda or Android SDK paths belong here.
hidden_dir="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/hidden"

if [ -d "$hidden_dir" ]; then
    for hidden_file in "$hidden_dir"/*.zsh(N); do
        if [ -r "$hidden_file" ] && [ -f "$hidden_file" ]; then
            source "$hidden_file"
        fi
    done
fi

unset hidden_dir hidden_file
