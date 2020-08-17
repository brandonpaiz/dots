xrdb load /home/brandon/.themes/bspwm/Xresources
xset r rate 250 30 &
xsetroot -cursor_name left_ptr &
sxhkd -c /home/brandon/.themes/bspwm/sxhkdrc &
hsetroot -fill $WALLPAPER
compton --conf ~/.themes/bspwm/compton.conf &
xflux -z 90042 > /dev/null 2>&1 &
autocutsel -selection PRIMARY -fork &
dunst -config /home/brandon/dunstrc &
exec bspwm -c /home/brandon/.themes/bspwm/bspwmrc
