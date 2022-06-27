[[ -f ~/.znap/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap/zsh-snap
source ~/.znap/zsh-snap/znap.zsh

[[ -x "/opt/homebrew/bin/brew" ]] && znap eval brew "/opt/homebrew/bin/brew shellenv" && export FPATH="${HOMEBREW_PREFIX}/share/zsh/site-functions:${FPATH}"

[[ -f ~/.asdf/asdf.sh ]] ||
    git clone --branch v0.9.0 -- \
        https://github.com/asdf-vm/asdf.git ~/.asdf
source $HOME/.asdf/asdf.sh

if [[ -z "$ZSH_CACHE_DIR" ]]; then
    if [[ -n "${XDG_CACHE_HOME}" ]]; then
        ZSH_CACHE_DIR="${XDG_CACHE_HOME}/.zsh"
    else
        ZSH_CACHE_DIR="${HOME}/.cache/.zsh"
    fi
fi

[[ -d "${ZSH_CACHE_DIR}" ]] || mkdir -p "${ZSH_CACHE_DIR}"
