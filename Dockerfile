FROM archlinux:latest

RUN pacman -Syu --noconfirm

RUN pacman -S --needed base-devel git

RUN git clone https://aur.archlinux.org/yay.git && cd yay

RUN makepkg -si

RUN yay -S neovim ruby curl zsh make sudo wget chpasswd --noconfirm

RUN curl -L https://github.com/arctic-hen7/bonnie/releases/download/0.3.2/bonnie-linux-amd64

RUN useradd --create-home atha

RUN wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh

ENV CONTEXT=portable-dev-env

COPY . /portable-dev-env
WORKDIR /portable-dev-env

RUN chpasswd <pass.txt

RUN hostnamectl set-hostname lps


CMD zsh
