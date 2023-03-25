#
# ~/.bash_profile
#

# LC_ALL
export LC_ALL="en_US.UTF-8"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty)" = "/dev/tty1" ]]; then
  # startx -- -nocursor
  startx
fi
