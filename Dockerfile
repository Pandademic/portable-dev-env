FROM archlinux:latest

RUN pacman -Syu --noconfirm

RUN pacman -S neovim ruby curl zsh make sudo git wget --noconfirm

ENV CONTEXT=portable-dev-env

COPY . /portable-dev-env
WORKDIR /portable-dev-env

RUN useradd --create-home postman

RUN chpasswd <pass.txt

RUN su postman

RUN hostnamectl set-hostname lps

CMD zsh
