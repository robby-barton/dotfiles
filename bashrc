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
	[[ -n "$(git status 2>/dev/null | grep -F 'working tree clean')" ]] || STATUS="!"
	printf '─[%s]' "${BRANCH:-unknown}${STATUS}"
}

export HISTCONTROL=ignoreboth:erasedups
export EDITOR=vim
alias macnfs="sudo service nfs restart"
alias search="grep -Rn"
alias devl-nas="sudo mount -t nfs -o ro devl-nas:/share/blade /mnt/devl-nas"
alias iTivity='nohup /usr/lib/iTivity/iManager/iManager &>/dev/null &'
alias iTivityConnect='ssh -p 22023 -o StrictHostKeyChecking=no -o "UserKnownHostsFile /dev/null" root@localhost'
alias postman='nohup postman &>/dev/null &'
alias gen-cscope='find . -name *.c -o -name *.h > cscope.files'
