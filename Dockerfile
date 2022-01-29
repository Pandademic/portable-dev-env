FROM archlinux:latest

RUN pacman -Syu --noconfirm

RUN pacman -S neovim git ruby curl zsh make --noconfirm

RUN /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

RUN brew tap homebrew/cask

ENV CONTEXT=portable-dev-env

COPY . /portable-dev-env
WORKDIR /portable-dev-env

CMD zsh
