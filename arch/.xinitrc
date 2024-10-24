[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
~/.fehbg &
xset r rate 240 40
#picom &
exec dwm;
