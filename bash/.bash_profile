#    _               _                           __ _ _
#   | |__   __ _ ___| |__       _ __  _ __ ___  / _(_) | ___
#   | '_ \ / _` / __| '_ \     | '_ \| '__/ _ \| |_| | |/ _ \
#  _| |_) | (_| \__ \ | | |    | |_) | | | (_) |  _| | |  __/
# (_)_.__/ \__,_|___/_| |_|____| .__/|_|  \___/|_| |_|_|\___|
#                        |_____|_|
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="vim"
export TERMINAL="alacritty"
export BROWSER="brave"

[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1
