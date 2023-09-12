#           _
#   _______| |__  _ __ ___
#  |_  / __| '_ \| '__/ __|
# _ / /\__ \ | | | | | (__
#(_)___|___/_| |_|_|  \___|
#
# Basic zsh config.
# Author: MythicalNewt

## Enable colors 
autoload -U colors && colors

# History related
HISTFILE=~/.cache/zsh/history.txt
HISTSIZE=10000
SAVEHIST=10000

## VI mode related 
bindkey -v
export KEYTIMEOUT=1

## OPTs to enable
setopt HASH_LIST_ALL
setopt CORRECT
# Zsh variable to determine what to ignore,
# in this case everything starting with _ or . 
CORRECT_IGNORE="[_|.]*"

# ## Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

## Basic tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

## Search with word and arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

## Aliases
alias ls="lsd -A"
alias ll="lsd -Al"
alias ..="cd .."
alias ...="cd ../.."
alias icat="kitty +kitten icat"
alias sudo="doas"
alias sudoedit="doasedit"
alias dotfiles="cd ~/git/MythicalNewt/Mythical-Dots"

## ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


## Pacman and Yay
alias pacsyu="doas pacman -Syyu"                                 # update only standard pkgs
alias yaysua="yay -Sua --noconfirm"                              # update only AUR pkgs (yay)
alias yaysyu="yay -Syu --combinedupgrade --save --noconfirm"    # update standard pkgs and AUR pkgs (yay)
alias unlock="doas rm /var/lib/pacman/db.lck"                    # remove pacman lock

## Get fastest mirrors
alias mirror="doas reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="doas reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="doas reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="doas reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

## Colorize grep output (good for log files)
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

## Update bootloader
alias grub-update="doas ~/grub.sh"

## Mount hdd
alias ddrive="doas mount -o relatime,rw,X-fstrim.notrim /dev/sda1 /mnt/data"

## Nvim to nv
alias nv="nvim"

## Git script
alias neopush="~/.config/zsh/neopush.sh"

## Environment variables
export LANG=en_US.UTF-8
export HISTCONTROL=ignoreboth
export BROWSER=firefox
export EDITOR=nvim
export VISUAL=nvim
export PATH=$PATH:/usr/local/bin
export QT_QPA_PLATFORM="wayland;xcb"
export XZ_DEFAULTS="-T 0 --memlimit=10000MiB"
export FZF_DEFAULT_OPTS="-i --preview 'bat --color=always {}'"
export FZF_DEFAULT_COMMAND="fd --type f" # yay -S fd
export VDPAU_DRIVER="radeonsi"
export MOZ_ENABLE_WAYLAND=1

## Zsh syntax highlighting stuff
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=blue,underline'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=blue,underline'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green,bold-italic'

## zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh # $ yay -S zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#55606d,bg=bold,underline"

## Starship shell prompt
eval "$(starship init zsh)"

## zsh-syntax-highlighting 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null # $ yay -S zsh-syntax-highlighting

