FROM alpine:latest
RUN echo -e "http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/main \n http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/community \n http://dl-cdn.alpinelinux.org/alpine/edge/testing " > /etc/apk/repositories
RUN apk update
RUN apk add -U --no-cache \
    neovim git git-perl \
    zsh tmux openssh-client bash ncurses \
    curl less man bat fd fzf docker lolcat \
    cowsay fortune delta wget
RUN useradd -ms /bin/zsh lorax
WORKDIR /home/lorax
ENV HOME /home/lorax
