#
# zinit Programs
#

zinit ice from"gh-r" as"program" pick"delta-*/delta"
zinit light dandavison/delta

zinit ice wait'1' lucid from"gh-r" as"program" mv"direnv* -> direnv" \
	if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]' \
	atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
	pick"direnv" src"zhook.zsh" nocompile'!'
zinit light direnv/direnv

zinit ice from"github" as"program" \
	if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]' \
	atclone'./bin/goenv init - > zhook.zsh' atpull'%atclone' \
	pick"bin/goenv" src"zhook.zsh" nocompile'!'
zinit light syndbg/goenv

zinit ice from"github" as"program" mv"completion/yadm.zsh_completion -> _yadm" \
	pick"yadm" nocompile'!'
zinit light TheLocehiliosan/yadm

zinit ice from'gh-r' as'program' mv'*/bin/hub -> hub' \
	atclone'mv */etc/hub.zsh_completion _hub && chown "${USER}":"$(id -gn ${USER})" _hub && chmod 644 _hub' \
	atpull'%atclone' pick'hub' if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]' nocompile'!'
zinit light github/hub

zinit ice from'github' as'program' pick"bin/git-fuzzy"
zinit light bigH/git-fuzzy

zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

zinit ice as"program" from"gh-r" mv"exa-* -> exa" pick"exa"
zinit light ogham/exa

zinit ice from"github" as"program" pick"fasd" \
	atclone'./fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install > fasd.zsh' \
	atpull"%atclone" src'fasd.zsh' nocompile'!'
zinit light clvv/fasd

alias o='a -e xdg-open'
alias c='a -e code'
alias j='zz'
