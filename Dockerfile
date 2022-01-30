FROM archlinux:latest

RUN pacman -Syu --noconfirm

COPY . /pde
WORKDIR /

ENV CONTEXT=portable-dev-env

RUN pacman -S --needed --noconfirm git base-devel sudo

RUN useradd postman

RUN usermod -aG wheel postman

RUN chpasswd < pde/buildfiles/pass.txt

RUN usermod -d /home/postman -m postman

WORKDIR ect

RUN touch sudoers

WORKDIR /

RUN echo "%wheel      ALL=(ALL) ALL" > ect/sudoers

RUN ln -s /pde/postman /home/postman 

WORKDIR /home

RUN chmod +777 postman 

RUN chown -R postman /postman

WORKDIR /postman 

USER postman

RUN git clone https://aur.archlinux.org/yay.git

RUN sudo chown -R postman /home/postman/yay

WORKDIR yay

#RUN sudo chown -R me /home/me/yay

RUN makepkg -si

WORKDIR /home/postman

USER root

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim.git /.local/share/nvim/site/pack/packer/start/packer.nvim 
# install packer.nvim

RUN git clone https://github.com/Pandademic/waffle-vim.git ~/.config/nvim/lua


RUN yay -S nvim ruby curl zsh make wget vim fzf bat fd gcc swift lua luajit

USER postman

RUN cd ~

CMD zsh
