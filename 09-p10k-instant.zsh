# Description: Configure and start the powerlevel10k instant prompt. Noisy things should go before this
() { [[ -r $1 ]] && source $1 } ${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USERNAME}.zsh
