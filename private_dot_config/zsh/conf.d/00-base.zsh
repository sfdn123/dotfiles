typeset -ga _dotfiles_missing_tools=()

function _dotfiles_mark_missing() {
    local tool_name="$1"
    local existing_tool

    for existing_tool in "${_dotfiles_missing_tools[@]}"; do
        if [ "$existing_tool" = "$tool_name" ]; then
            return 0
        fi
    done

    _dotfiles_missing_tools+=("$tool_name")
}

function _dotfiles_report_missing() {
    [[ -o interactive ]] || return 0
    (( ${#_dotfiles_missing_tools[@]} == 0 )) && return 0

    print -u2 -P "%F{yellow}[dotfiles]%f missing tools: ${(j:, :)_dotfiles_missing_tools}"
}
