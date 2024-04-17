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
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

## VI mode related 
bindkey -v
export KEYTIMEOUT=1

## OPTs to enable
setopt HASH_LIST_ALL
setopt CORRECT
setopt globdots

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
alias ls="lsd -A" # zin lsd
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
alias neopush="~/.config/zsh/scripts/neopush.sh"

## Environment variables
export PATH="$PATH:/sbin:/usr/sbin:usr/local/sbin:$HOME/.cargo/bin"
export HISTCONTROL=ignoreboth
export BROWSER=brave-browser
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim
export XZ_DEFAULTS="-T 0 --memlimit=10000MiB"
export ZPLUGDIR="/usr/share/zsh/plugins"
export LS_COLORS="$(vivid generate $ZDOTDIR/decay.yml)" # cargo install vivid

#  ## Basic tab complete
#  autoload -U compinit
#  zstyle ':completion:*' menu select
#  zmodload zsh/complist
#  compinit

## zsh-completions
fpath=($ZPLUGDIR/zsh-completions/src $fpath)
zstyle ':completion::complete:*' use-cache on
autoload -Uz compinit ; compinit
  
## fzf-tab
source $ZPLUGDIR/fzf-tab/fzf-tab.plugin.zsh
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -1a $realpath'

## zsh-autosuggestions
source $ZPLUGDIR/zsh-autosuggestions/zsh-autosuggestions.zsh 
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#55606d,bg=bold,underline"
 
## zsh-fast-syntax-highlighting
source $ZPLUGDIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

## Atuin shell history explorer
eval "$(atuin init zsh)" # zin atuin

## Starship shell prompt
eval "$(starship init zsh)" # zin starship

## Zoxide call 
eval "$(zoxide init zsh)" # zin zoxide
