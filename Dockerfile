FROM archlinux:latest

RUN pacman -Syu --noconfirm

RUN yay -S neovim ruby curl zsh make sudo git wget chpasswd --noconfirm

ENV CONTEXT=portable-dev-env

COPY . /portable-dev-env
WORKDIR /portable-dev-env

RUN chpasswd <pass.txt

RUN hostnamectl set-hostname lps

RUN useradd --create-home atha

RUN su atha

CMD zsh
