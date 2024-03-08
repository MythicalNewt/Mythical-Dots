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
  fast-syntax-highlighting
)

## Search with word and arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

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

## Aliases
alias ls="lsd -A"
alias ll="lsd -Al"
alias cd="z"
alias ..="z .."
alias ...="z ../.."
alias icat="kitty +kitten icat"
alias nv="nvim"
alias dotfiles="cd ~/git/Mythical-Dots"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias zdup="sudo zypper ref ; sudo zypper dup"
alias zin="sudo zypper in"
alias zrm="sudo zypper rm --clean-deps"
alias zsearch="zypper se"
alias zref="sudo zypper ref"
alias zclean="sudo zypper cc ; sudo zypper purge-kernels"
alias grubupd="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"

## Scripts
alias neopush="~/.config/zsh/scripts/neopush.sh"

## Environment variables
export LANG=en_US.UTF-8
export PATH="$PATH:/sbin:/usr/sbin:usr/local/sbin"
export HISTCONTROL=ignoreboth
export BROWSER=librewolf
export EDITOR=nvim
export VISUAL=nvim
export QT_QPA_PLATFORM="wayland"
export XZ_DEFAULTS="-T 0 --memlimit=10000MiB"
export FZF_DEFAULT_OPTS="-i --preview 'bat --color=always {}'"
export FZF_DEFAULT_COMMAND="fd --type f" # yay -S fd
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM="xcb"

#  ## Jump around the filesystem
#  [[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh # yay -S z

## zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh # $ yay -S zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#55606d,bg=bold,underline"
  
## Starship shell prompt
eval "$(starship init zsh)"

## Zoxide call 
eval "$(zoxide init zsh)"

## zsh-completions
fpath=(/usr/share/zsh/plugins/zsh-completions/src $fpath)

## zsh-syntax-highlighting 
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null # $ yay -S zsh-syntax-highlighting

## zsh-fast-syntax-highlighting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

