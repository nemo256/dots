# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/sbin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/nemo/.oh-my-zsh"
export TMPDIR="/tmp"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

ZSH_DISABLE_COMPFIX=true

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	dotenv
	zsh-syntax-highlighting
	zsh-autosuggestions
	colored-man-pages
	colorize
	copyfile
	copydir
	extract
)

source $ZSH/oh-my-zsh.sh

# User configuration
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# NNN file manager:
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# NNN plugins
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'

# Aliases!
alias ls='exa --long --group-directories-first --icons'
alias la='exa --long --group-directories-first --icons --git --all'
alias ins='sudo apt install -yy'
alias rem='sudo apt remove -yy'
alias arem='sudo apt autoremove -yy'
alias tree='alder'
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias sr='sudo ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias sv='sudo nvim'
alias v='nvim'
alias e='neomutt; mbsync -a'
alias q='exit'
alias h='htop'
alias c='clear'
alias m='mapscii'
alias p='sxiv -fbrtq ./'
alias pdf='zathura'

# Configuration aliases:
alias vi='nvim'
alias vim='nvim'
alias zrc='nvim ~/.zshrc'
alias brc='nvim ~/.bashrc'
alias vrc='nvim ~/.config/nvim/init.vim'
alias rrc='nvim ~/.config/ranger/rc.conf'
alias arc='nvim ~/.config/alacritty/alacritty.yml'
alias irc='nvim ~/.irssi/config'
alias mrc='nvim ~/.mutt/muttrc'

alias hack='cmatrix | lolcat'
alias show='apt show'
alias upd='sudo apt update'
alias upg='sudo apt upgrade -yy'
alias rm='rm -fvr'
alias cp='cp -fvr'
alias mv='mv -fv'
alias myip='curl http://ipecho.net/plain; echo'
alias mylip='ifconfig -a | sed -n "/wlp3s0/,/^$/p" | grep inet | sed "1 q"
| awk "{print \$2}"'
alias mymac='ifconfig -a | sed -n "/wlp3s0/,/^$/p" | grep ether | awk "{print \$2}"'
alias parrot='curl parrot.live'
alias mvb='mv * ~/bin'
alias mvd='mv * ~/Downloads'
alias mvD='mv * ~/Documents'
alias mvm='mv * ~/Music'
alias mvp='mv * ~/Pictures'
alias mvv='mv * ~/Videos'
alias cpb='cp * ~/bin'
alias cpd='cp * ~/Downloads'
alias cpD='cp * ~/Documents'
alias cpm='cp * ~/Music'
alias cpp='cp * ~/Pictures'
alias cpv='cp * ~/Videos'
alias cda='cd /run/user/1000/gvfs; cd `ls`' # ``| sed "1 s/\s/\\\ /g; 1 s/$/\//"
alias cdi='cd /media/iPhone'
alias cdf='cd /media/usb'
alias cdb='cd ~/bin'
alias cdc='cd ~/.config'
alias cdD='cd ~/Documents'
alias cdd='cd ~/Downloads'
alias cdm='cd ~/Music'
alias cdp='cd ~/Pictures'
alias cdv='cd ~/Videos'
alias cdt='cd ~/Templates'
alias cdw='cd ~/Work'
alias mntf='sudo mount /dev/sdb1 /media/usb'
alias mnti='sudo ifuse /media/iPhone'
alias umntf='sudo umount /media/usb'
alias umnti='sudo umount /media/iPhone'
alias yt='cdv; youtube-dl -f best -iw --mark-watched'
alias ytm='cdm; youtube-dl -f bestaudio -iw --mark-watched'
alias t='transmission-remote'
alias tls='transmission-remote -l'
alias clone='git clone'
alias cgrep='messer --command="contacts" | grep -i'
#alias jmerise='java -jar $HOME/Documents/OMSI/Apps/JMeriseEtudiant/JMerise.jar'
#alias jflux='java -jar $HOME/Documents/OMSI/Apps/JFlux.jar'
#alias jmct='java -jar $HOME/Documents/OMSI/Apps/JMCT/JMCT.jar'
#alias jmot='java -jar $HOME/Documents/OMSI/Apps/JMOT/JMOT.jar'
alias sgaa='sudo git add --all'
alias sgc='sudo git commit -v'
alias gpm='git push origin master'
alias lswifi='nmcli d wifi'
alias wifi='nmcli d wifi connect '

cat ~/bin/fetchstart
#wolf | lolcat; colours
#cat ~/.cwolf

# User Specific Settings
export EDITOR=nvim

if [[ -r /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

export FZF_DEFAULT_OPTS='--layout=reverse --border --height=100%'
export FZF_DEFAULT_COMMAND='ag --ignore .git -g ""'
export FZF_CTRL_T_COMMAND='ag --ignore .git -g ""'
# For including dotfiles (hidden files)
#export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
#export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/p10k/.p10k.zsh.
[[ ! -f ~/.dotfiles/p10k/.p10k.zsh ]] || source ~/.dotfiles/p10k/.p10k.zsh
