#!/bin/sh
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

dunst &

compton -b

xset dpms 0 0 600 
xsetroot -solid "#464646"

feh --bg-scale ${HOME}/.i3/${HOSTNAME}.jpg --no-fehbg

setxkbmap gb
xmodmap -e "keycode 24 = q Q at at at at"
xmodmap -e "keycode 22 = BackSpace Delete"

