#
# ~/.bash_profile
#

# LC_ALL
export LC_ALL="en_US.UTF-8"

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Launch mpd
[ ! -s ~/.config/mpd/pid ] && mpd

if [[ "$(tty)" = "/dev/tty1" ]]; then
  # startx -- -nocursor
  startx
fi
