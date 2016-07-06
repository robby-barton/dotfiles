# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export CVSROOT=:ext:repository.unitrends.com:/home/controlled-source/cvsroot
PS1='┌─[\[\e[01;32m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[1;34m\]\w\[\e[0m\]]$(prompt_git)\n└─╼ '

prompt_git() {
	git branch &>/dev/null || return 1
	HEAD="$(git symbolic-ref HEAD 2>/dev/null)"
	BRANCH="${HEAD##*/}"
	[[ -n "$(git status 2>/dev/null | grep -F 'working directory clean')" ]] || STATUS="!"
	printf '─[%s]' "${BRANCH:-unknown}${STATUS}"
}

export EDITOR=vim
alias macnfs="sudo service nfs restart"
alias search="grep -Rn"
alias weka="java -jar ~/weka-3-8-0/weka.jar &"
