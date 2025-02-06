# workaround for 1password-cli squashing completion functions of plugins
function __my_op_plugin_run() {
    _op_plugin_run
    echo "$(date) - CURRENT=${CURRENT} words=${words[@]}" >>/tmp/op_run_insertion
    for ((i = 2; i < CURRENT; i++)); do
        if [[ ${words[i]} == -- ]]; then
            shift $i words
            ((CURRENT -= i))
            _normal
            return
        fi
    done

}

function __load_op_completion() {
    completion_function="$(op completion zsh)"
    sed -E 's/^( +)_op_plugin_run/\1__my_op_plugin_run/' <<<"${completion_function}"
}

eval "$(__load_op_completion)"
compdef _op op
