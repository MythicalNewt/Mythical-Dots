# This script automatically backs up zshrc, neovim and miscellaneous configs

#!/bin/zsh

cd ~/git/Mythical-Dots

git pull

#cp -r ~/.config/nvim/lua ~/git/MythicalNewt/Mythical-Dots/.config/nvim/
#cp ~/.config/nvim/init.lua ~/git/MythicalNewt/Mythical-Dots/.config/nvim/
cp ~/.config/zsh/.zshrc ~/git/MythicalNewt/.config/zsh/
cp ~/.config/zsh/scripts/* ~/git/MythicalNewt/.config/zsh/scripts/
#cp ~/.config/autostart/* ~/git/MythicalNewt/Mythical-Dots/.config/autostart/
#cp ~/.config/environment.d/* ~/git/MythicalNewt/Mythical-Dots/.config/environment.d/

git commit -am "Automatic push."
git push
