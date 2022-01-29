FROM archlinux:latest

RUN pacman -Syu --noconfirm

RUN pacman -S neovim ruby curl zsh make sudo git wget --noconfirm

ENV CONTEXT=portable-dev-env

COPY . /portable-dev-env
WORKDIR /portable-dev-env

RUN useradd --create-home postman

RUN chpasswd <pass.txt
RUN mkdir .config 

RUN cd .config

RUN mkdir nvim 

RUN cd nvim

RUN git clone https://github.com/Pandademic/waffle-vim.git lua

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim.git ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
# install packer.nvim
CMD zsh
