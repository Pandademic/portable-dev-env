FROM archlinux:latest

RUN pacman -Syu --noconfirm

RUN pacman -S neovim ruby curl zsh make sudo git wget --noconfirm

ENV CONTEXT=portable-dev-env

COPY . /portable-dev-env
WORKDIR /portable-dev-env

RUN useradd postman

RUN usermod -d /postman postman

RUN chpasswd <pass.txt

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim.git ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
# install packer.nvim

RUN git clone https://github.com/Pandademic/waffle-vim.git .config/nvim/lua


CMD zsh
