FROM archlinux:latest

RUN pacman -Syu --noconfirm

RUN pacman -S neovim git ruby curl zsh make sudo wget --noconfirm

RUN useradd --create-home atha

RUN wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh

ENV CONTEXT=portable-dev-env

COPY . /portable-dev-env
WORKDIR /portable-dev-env

CMD zsh
