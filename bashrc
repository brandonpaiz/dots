#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias tmux='tmux a || tmux'
alias cat='bat'
alias rexpaint='wine ~/Downloads/REXPaint/REXPaint-v1.04/REXPaint.exe'
alias weather='curl wttr.in'
alias evince='nohup evince >/dev/null 2>&1'

#PS1='[\u@\h \W]\$ '
PS1=">_ "

