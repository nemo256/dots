#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# Adding new bin to the PATH variable
export PATH=$HOME/bin:/$HOME/bin/status:/usr/local/bin:/sbin:$PATH

# Default Text Editor
export EDITOR=nvim

# Setting up macbook keyboard layout
setxkbmap us mac &
# Unclutter to enable autohiding for pointer
unclutter &
# Starting up transmission-daemon for torrent downloading
transmission-daemon &
# Setting up screen resolution for my display
xrandr --output eDP1 --mode 1440x900 --set TearFree on +vsync -hsync
# Setting up the background wallpaper
# feh --bg-fill --randomize $HOME/wals/*
feh --bg-fill $HOME/wals/11.jpg
# Starting up my compositor
picom &
# Starting up mpd
mpd &
# Defining key-repeat for keyboard to be much faster
xset r rate 220 40 &
# Setting up screen locker (slock)
# xset s 600 30 &
# xss-lock -n "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'" -- slock &
# Starting slstatus
slstatus &
# Disabling my pointer
xinput set-prop 11 "Device Enabled" 0
# Important to set my preferred DPI setting (Settings in Xressources)
xrdb -merge ~/.Xressources
# Setting up dunst for notfications
dunst &
# Launching tily
exec tily
