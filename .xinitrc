#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec openbox-session
xrdb -merge ~/.Xresources
ibus-daemon -x -r -d&
#exec openbox-session
#syndaemon -t -i 2&
xgamma -gamma 0.9 -s 0&
clipit&
xflux -l 30.7 -g 104.1 -k 4100&
exec awesome

