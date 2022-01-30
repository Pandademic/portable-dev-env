FROM alpine:latest
RUN echo -e "http://dl-cdn.alpinelinux.org/alpine/v3.15/main\n http://dl-cdn.alpinelinux.org/alpine/v3.15/community\n http://dl-cdn.alpinelinux.org/alpine/edge/testing" > /etc/apk/repositories
RUN apk update
RUN apk add -U --no-cache \
    neovim git git-perl \
    zsh tmux openssh-client bash ncurses \
    curl less man bat fd fzf docker lolcat \
    cowsay fortune delta wget
RUN useradd -ms /bin/zsh lorax
WORKDIR /home/lorax
ENV HOME /home/lorax
