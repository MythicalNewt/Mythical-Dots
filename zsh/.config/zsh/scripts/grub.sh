#!/bin/zsh

grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB && grub-mkconfig -o /boot/grub/grub.cfg

