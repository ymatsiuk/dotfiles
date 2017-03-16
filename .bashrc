#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

HISTSIZE=10000
HISTFILESIZE=${HISTSIZE}
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

. ~/.alias

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
JAVA_FONTS=/usr/share/fonts/TTF
KUBE_EDITOR="vim"

PS1="\n\$(if [[ \$? == 0 ]]; then echo \"\[\033[0;34m\]\"; else echo \"\[\033[0;31m\]\"; fi)\342\226\210\342\226\210 \e[1m[ \t ] [ \u@\h:\w ] \n\[\033[0m\]\342\226\210\342\226\210 "
