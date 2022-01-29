FROM archlinux:latest

RUN pacman -Syu --noconfirm

COPY . /pde
WORKDIR /

RUN pacman -S --needed cat pde/buildfiles/pkglist.txt --noconfirm

ENV CONTEXT=portable-dev-env

RUN useradd postman

RUN chpasswd < pde/buildfiles/pass.txt

RUN usermod -d /home/postman -m postman

RUN ln -s /pde/postman /home/postman 

WORKDIR /home/postman


RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim.git /.local/share/nvim/site/pack/packer/start/packer.nvim 
# install packer.nvim

RUN git clone https://github.com/Pandademic/waffle-vim.git ~/.config/nvim/lua

USER postman

RUN cd ~

CMD zsh
