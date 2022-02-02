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
chmod +x installer.sh
./installer.sh
rm installer.sh
cp abs bin
echo "copying the bin directory to lorax"
cp bin/* ~/bin
cp /usr/bin/git bin
echo "done!"
echo "we should be good to go!"
