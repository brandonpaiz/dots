xrdb load /home/brandon/.themes/bspwm/Xresources
xsetroot -cursor_name left_ptr &
sxhkd -c /home/brandon/.themes/bspwm/sxhkdrc &
hsetroot -fill ~/Downloads/dark_leaf.jpeg
compton --conf ~/.themes/bspwm/compton.conf &
polybar -c ~/.polybar_config example &
xflux -z 90042 &
exec bspwm -c /home/brandon/.themes/bspwm/bspwmrc
