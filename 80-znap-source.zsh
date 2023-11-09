ZSH_AUTOSUGGEST_STRATEGY=(history completion)
znap source zsh-users/zsh-autosuggestions
# znap source marlonrichert/zsh-autocomplete ## This is always a mistake. stop it.
znap source jreese/zsh-titles
znap source hlissner/zsh-autopair
znap source chrissicool/zsh-256color
znap source agkozak/zsh-z
znap source zsh-users/zsh-syntax-highlighting
znap source marlonrichert/zsh-hist

znap source ohmyzsh/ohmyzsh plugins/history-substring-search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# __command_is_present terraform && {
#     znap source ohmyzsh/ohmyzsh plugins/terraform/_terraform
# }
