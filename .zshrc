source ~/.zshfunc/instant-zsh.zsh
instant-zsh-pre $'%{\e[1;38;5;42m%}%n@%m%{\e[0m%}:%{\e[1;94m%}%~%{\e[0m%}\$ '

# allow for prompt to have variable substitutions
# setopt prompt_subst

# export colour support for commands such as ls
export CLICOLOR=1

# change ls colours
export LSCOLORS='ExGxFxdaCxDaDahbadacec'

# fix hostname to proper value
# HOSTNAME=$(scutil --get LocalHostName)

# enable autocompletion
autoload -Uz compinit

_update_zcomp "$zcachedir"
unfunction _update_zcomp

# enable case-insensitive matching
zstyle ':completion:*' matcher-list '' '+m:{a-zA-Z}={A-Za-z}' '+r:|[._-]=* r:|=*' '+l:|=* r:|=*'

# enable edit command line support
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# export prompt
PROMPT=$'%{\e[1;38;5;42m%}%n@%m%{\e[0m%}:%{\e[1;94m%}%~%{\e[0m%}\$ '

# command aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias python=python3

instant-zsh-post
