# .bashrc

# source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# dynamic bash completion for make targets
listMakeTargets() {
	if [ "${#COMP_WORDS[@]}" != "2" ]; then
		return
	fi

	local suggestions=($(compgen -W "$([[ -r Makefile ]] && make -qpr | \
		grep -oE '^[a-zA-Z0-9_-][a-zA-Z0-9._-]+:' | \
		awk '{print substr($0, 1, length($0)-1)}' | \
		sort -u)" -- "${COMP_WORDS[1]}"))

	if [ "${#suggestions[@]}" == "1" ]; then
		local number=$(echo ${suggestions[0]/%\ */})
		COMPREPLY=("$number")
	else
		COMPREPLY=("${suggestions[@]}")
	fi
}
complete -F listMakeTargets make

# Base16 themeing for shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
	eval "$("$BASE16_SHELL/profile_helper.sh")"

# fzf completions
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# user specific aliases and functions
PS1='┌─[\[\e[1;34m\]\w\[\e[0m\]]$(prompt_git)\n└─╼ '

prompt_git() {
	git branch &>/dev/null || return 1
	HEAD="$(git symbolic-ref HEAD 2>/dev/null)"
	BRANCH="${HEAD##*/}"
	[[ -n "$(git status 2>/dev/null | grep -F 'working tree clean')" ]] || STATUS="!"
	printf '─[%s]' "${BRANCH:-unknown}${STATUS}"
}

export HISTCONTROL=ignoreboth:erasedups
export EDITOR=vim

alias eb='vim ~/.bashrc'
alias ev='vim ~/.vimrc'
alias git-root='git rev-parse > /dev/null 2>&1 && cd $(git rev-parse --show-toplevel) > /dev/null 2>&1'

# work specific
if [ -f ~/.workrc ]; then
	. ~/.workrc
fi

