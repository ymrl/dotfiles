autoload colors; colors
autoload -U compinit; compinit
setopt auto_cd
bindkey -e

### prompt ###
PROMPT="%{${fg[green]}%}%n@%m%{${reset_color}%}$ "
PROMPT2="%{${fg[blue]}%}%_%{${reset_color}%}$ "
SPROMPT="%{${fg[green]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
	PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"

setopt prompt_subst
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
function _precmd_vcs_info(){
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _precmd_vcs_info
RPROMPT="%1(v|%F{green}%1v%f|) "
RPROMPT="$RPROMPT [%{${fg[blue]}%}%~%{${reset_color}%}]"


### completion ###
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

### historical search ###
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

### aliases ###
setopt complete_aliases
alias grep="grep --color"

# ls
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias l="ls"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias lla="ls -al"
alias lal="ls -al"
alias sl="ls"
alias cd..="cd .."
alias :e="vim"

### load .zshrc.mine ###
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
