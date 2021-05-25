# ~/.zshrc
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export LS_COLORS='di=1;34:ln=1;36:so=1;31:pi=1;33:ex=1;32:bd=1;34;46:cd=1;34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43'
setopt histignorealldups
export EDITOR=vim

#  version control information
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '-[%F{magenta}%b%f%F{red}%u%f%F{yellow}%c%f]'
autoload -Uz vcs_info
precmd() { vcs_info }

# completion settings
zstyle ':completion:*' auto-description 'specify:%d'
zstyle ':completion:*' completer _expand _complete _ignored _match _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' format 'completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 4
zstyle ':completion:*' menu select=1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*:*:make:*' tag-order 'targets' # make only auto completes targets
autoload -Uz compinit && compinit -i
autoload -Uz bashcompinit && bashcompinit

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--color=dark --layout=reverse --margin=1,1"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# prompt
setopt prompt_subst
PROMPT='┌─[%(?.%F{blue}.%F{red})%~%f]${vcs_info_msg_0_}'$'\n''└─╼ '

# Base16 themeing for shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
	eval "$("$BASE16_SHELL/profile_helper.sh")"

# user specific
alias ez='vim ~/.zshrc'
alias ev='vim ~/.vimrc'
alias gr='git rev-parse > /dev/null 2>&1 && cd $(git rev-parse --show-toplevel) > /dev/null 2>&1'
if [ "$(uname -s)" = "Darwin" ]; then
	[ -x "$(command -v gls)" ] && alias ls='gls --group-directories-first --color=always'
fi

# work specific
if [ -f ~/.workrc ]; then
	. ~/.workrc
fi
