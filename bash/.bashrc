# ~/.bashrc

#   _               _
#  | |__   __ _ ___| |__  _ __ ___
#  | '_ \ / _` / __| '_ \| '__/ __|
# _| |_) | (_| \__ \ | | | | | (__
#(_)_.__/ \__,_|___/_| |_|_|  \___|
#
# Simple bashrc based off DTs config
# Author: Shreyas
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Aliases ##
alias ls='lsd -a'
alias ll='lsd -al'


### CHANGE TITLE OF TERMINALS
#case ${TERM} in
#  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
#        ;;
#  screen*)
#    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
#    ;;
#esac

### ARCHIVE EXTRACTION
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


# pacman and yay
alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

## Prints random ascii art on startup ##
#colorscript random

## vim related ignore ##
export MICRO_TRUECOLOR=1
export VISUAL=vim

## exports
export LANG=en_US.UTF-8
export HISTCONTROL=ignoreboth
export BROWSER=brave
export EDITOR=vim
export PATH
export TERMINAL=alacritty

## starship shell prompt call ##
eval "$(starship init bash)"
