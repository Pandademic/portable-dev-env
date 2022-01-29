FROM archlinux:latest

RUN pacman -Syu --noconfirm

RUN pacman -S neovim ruby curl zsh make sudo git wget -noconfirm

ENV CONTEXT=portable-dev-env

COPY . /portable-dev-env
WORKDIR /portable-dev-env

RUN chpasswd <pass.txt

RUN hostnamectl set-hostname lps

RUN useradd --create-home postman

RUN su postman

CMD zsh
