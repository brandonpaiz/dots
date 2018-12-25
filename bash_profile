#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

EDITOR=vim; export EDITOR
WALLPAPER=$HOME/Downloads/dark_leaf.jpeg; export WALLPAPER
export PATH=$PATH:/home/brandon/scripts

# start x, but only if not logging in from tmux/screen/etc
[[ $TERM != "screen" ]] && startx /home/brandon/.themes/bspwm/xinitrc > /dev/null 2>&1
