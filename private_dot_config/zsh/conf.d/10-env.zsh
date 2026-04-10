export LANG="${LANG:-en_US.UTF-8}"
export EDITOR="nvim"
export VISUAL="nvim"

export COLORTERM=truecolor
export PATH="$HOME/.local/bin:$PATH"
WORDCHARS=''

# Initialize Homebrew from common install locations when available.
for brew_bin in \
    "/opt/homebrew/bin/brew" \
    "/usr/local/bin/brew" \
    "/home/linuxbrew/.linuxbrew/bin/brew"
do
    if [ -x "$brew_bin" ]; then
        eval "$("$brew_bin" shellenv)"
        break
    fi
done

unset brew_bin
