#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

alias ls='ls --color=auto'
alias tmux='tmux a || tmux'
alias cat='bat'
alias rexpaint='wine ~/Downloads/REXPaint/REXPaint-v1.04/REXPaint.exe'
alias weather='curl wttr.in'
alias evince='nohup evince >/dev/null 2>&1'
alias wifi='sudo wifi-menu'
alias suspend='systemctl suspend'

#PS1='[\u@\h \W]\$ '
PS1=">_ "

