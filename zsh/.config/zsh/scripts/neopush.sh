# This script automatically backs up zshrc and neovim configs

#!/bin/zsh

cd ~/git/MythicalNewt/Mythical-Dots

git pull

cp -r ~/.config/nvim/lua ~/git/MythicalNewt/Mythical-Dots/.config/nvim
cp ~/.config/nvim/init.lua ~/git/MythicalNewt/Mythical-Dots/.config/nvim
cp ~/.config/zsh/.zshrc ~/git/MythicalNewt/Mythical-Dots/zsh/.config/zsh
cp ~/.config/zsh/scripts/neopush.sh ~/git/MythicalNewt/Mythical-Dots/zsh/.config/zsh/scripts
cp ~/.config/zsh/scripts/grub.sh ~/git/MythicalNewt/Mythical-Dots/zsh/.config/zsh/scripts

git commit -am "Automatic push."
git push
