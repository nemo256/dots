#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable Bash completion...
[ -f /etc/bash_completion ] && /etc/bash_completion

# PATH variable
export PATH="$HOME/bin:/$HOME/bin/status:/usr/local/bin:/sbin:$HOME/.config/composer/vendor/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:/opt/android-sdk/tools:$PATH"

# Default Text Editor
export EDITOR=nvim

# History file settings
export HISTSIZE=
export HISTFILESIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTCONTROL=ignoreboth

# Readline macros
bind 'set completion-ignore-case on'

# My Bash Theme...
PS1=' \e[0m\[\e[0;1;38;5;55m\]\[  \] \[\e[0;1;38;5;19m\][\[\e[0;1;90m\]\w\[\e[0;1;38;5;19m\]]\[\e[0;1;38;5;19m\]>\[\e[0;1;38;5;19m\]>\[\e[0;1;38;5;19m\]>\[\e[0m\] '

# Aliases
alias ls='exa --long --group-directories-first --icons'
alias la='exa --long --group-directories-first --icons --git --all'
alias tree='alder'
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias sr='sudo ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias v='nvim'
alias sv='sudo nvim'
alias e='neomutt; mbsync -a'
alias q='exit'
alias h='htop'
alias c='clear'
alias cw='feh --bg-fill --randomize $HOME/wals/*'
alias m='mapscii'
alias p='sxiv -fbrq'
alias pdf='zathura'
alias vi='nvim'
alias vim='nvim'

# Configuration aliases
alias xrc='nvim ~/.xinitrc'
alias brc='nvim ~/.bashrc'
alias zrc='nvim ~/.zshrc'
alias vrc='nvim ~/.config/nvim/init.vim'
alias rrc='nvim ~/.config/ranger/rc.conf'
alias nrc='nvim ~/.newsboat/config'
alias urc='nvim ~/.newsboat/urls'
alias arc='nvim ~/.config/alacritty/alacritty.yml'
alias irc='nvim ~/.irssi/config'
alias mrc='nvim ~/.mutt/muttrc'

# Package manager
alias ins='sudo pacman -S --noconfirm --needed'
alias rem='sudo pacman -Rs --noconfirm'
alias arem='sudo pacman -Sc --noconfirm'
alias upd='sudo pacman -Syu'
alias show='pacman -Ss'

# File / Folder operations
alias rm='rm -fvr'
alias cp='cp -fvr'
alias mv='mv -fv'
alias mvb='mv * ~/bin'
alias mvd='mv * ~/dl'
alias mvD='mv * ~/dox'
alias mvm='mv * ~/music'
alias mvp='mv * ~/pix'
alias mvv='mv * ~/vids'
alias mvf='mv * /mnt'
alias cpb='cp * ~/bin'
alias cpd='cp * ~/dl'
alias cpD='cp * ~/dox'
alias cpm='cp * ~/music'
alias cpp='cp * ~/pix'
alias cpv='cp * ~/vids'
alias cpf='cp * /mnt'
alias cdi='cd /media/iPhone'
alias cdf='cd /mnt'
alias cdb='cd ~/bin'
alias cdc='cd ~/.config'
alias cdd='cd ~/dl'
alias cdD='cd ~/dox'
alias cdm='cd ~/music'
alias cdp='cd ~/pix'
alias cds='cd ~/pix/scrots'
alias cdv='cd ~/vids'
alias cdw='cd ~/work'
alias cdW='cd ~/wals'
alias ..='cd ..'
alias mntf='sudo mount /dev/sdb /mnt'
alias mnti='sudo ifuse /media/iPhone'
alias umntf='sudo umount /mnt'
alias umnti='sudo umount /media/iPhone'
alias yt='cdv; yt-dlp -f best -iw --mark-watched'
alias ytm='cdm; yt-dlp -f bestaudio -iw --mark-watched'
alias t='transmission-remote'
alias tls='transmission-remote -l'
alias hack='cmatrix | lolcat'
alias lswifi='nmcli d wifi list --rescan yes'
alias wifi='nmcli d wifi connect '

# Git operations
alias clone='git clone'
alias gaa='git add -vA'
alias gc='git commit -vm'
alias gst='git status -uno'
alias sgaa='sudo git add -A'
alias sgc='sudo git commit -vm'
alias gd='git diff'
alias gs='git show'
alias gp='git pull'
alias gpm='git push origin master'
alias grh='git reset --hard HEAD'

# Greppers
alias cgrep='messer --command="contacts" | grep -i'
alias hgrep='history | grep -i'

# Nerdy aliases...
alias py='python'
alias activate='source venv/bin/activate'
alias space='ncdu --color dark -r'
alias myip='curl http://ipecho.net/plain; echo'
alias mylip='ifconfig -a | sed -n "/wlan0/,/^$/p" | grep inet | sed "1 q" | awk "{print \$2}"'
alias mymac='ifconfig -a | sed -n "/wlan0/,/^$/p" | grep ether | awk "{print \$2}"'
alias parrot='curl parrot.live'
alias train='sl -acdeG -20'
alias start='startx -- -nocursor'

# Fetching information aliases...
# alias volumelevel="echo 'Volume is:   $(amixer get Master | grep Mono: | sed 's/[][]//g' | awk '{print $4}' | sed 's/[^0-9]*//g')%'"
alias wifissid="echo 'Connected to:   $(iwgetid -r)'"

# FZF configuration options
export FZF_DEFAULT_OPTS='--layout=reverse --border --height=100%'
export FZF_DEFAULT_COMMAND='ag --ignore .git -g ""'
export FZF_CTRL_T_COMMAND='ag --ignore .git -g ""'
source .key-bindings.bash

# Ranger devicons options
export RANGER_DEVICONS_SEPARATOR='  '

# Java Home
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk

# Chromium
export CHROME_EXECUTABLE=/usr/bin/chromium

# Android
export ANDROID_HOME=/opt/android-sdk

# Android Emulator
export ANDROID_EMULATOR_HOME=/opt/android-sdk/tools

fetchy
