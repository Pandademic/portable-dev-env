#!/bin/sh
echo "Setup your system , the stuff yu couldn't do in dockerfile"
echo "run as root from the / dir"
echo "getting community repo packages"
apk add -U --no-cache fzf fd bat neovim --repository=http://dl-cdn.alpinelinux.org/alpine/v3.15/community
echo "getting the extra packages"
apk add -U --no-cache curl less docker shadow 
apk add -U --no-cache fortune wget doas go
apk add build-base cmake automake autoconf libtool pkgconf unzip gettext-tiny-dev
echo "giving lorax sudo permsions"
adduser lorax wheel
echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
echo "cloning neovim stuff"
cd /home/lorax
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
.config/nvim
git clone https://github.com/Pandademic/waffle-vim.git lua
cd /
echo "Password changing time !"
echo "first ... root!"
passwd
echo "next .. Lorax"
passwd lorax
echo "installing abs"
curl -O https://www.abs-lang.org/installer.sh
chmod +x install.sh
./install.sh
rm install.sh
echo "Okay then .. we should be good"
