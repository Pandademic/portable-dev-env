FROM alpine:latest
RUN apk add -U --no-cache \
    neovim git git-perl \
    zsh tmux openssh-client bash ncurses \
    curl less man bat fd fzf docker
RUN useradd -ms /bin/zsh me
WORKDIR /home/me
ENV HOME /home/me
