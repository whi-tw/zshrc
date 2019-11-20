#
# Utility Functions
#

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
	fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
	fd --type d --hidden --follow --exclude ".git" . "$1"
}

#
# fzf fasd Integrations
# Extracted from https://github.com/junegunn/fzf/wiki/examples
#

# Interactive cd
cdd() {
	if [[ "$#" != 0 ]]; then
		builtin cd "$@"
		return
	fi
	while true; do
		local lsd=$(echo ".." && gls -p | grep '/$' | sed 's;/$;;')
		local dir="$(printf '%s\n' "${lsd[@]}" |
			fzf --reverse --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                gls -p --color=always "${__cd_path}";
        ')"
		[[ ${#dir} != 0 ]] || return 0
		builtin cd "$dir" &>/dev/null
	done
}
