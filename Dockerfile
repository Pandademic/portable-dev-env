FROM alpine:latest
COPY addcomrepo.sh addcomrepo.sh
RUN chmod +x addcomrepo.sh
RUN addcomrepo.sh
RUN apk add -U --no-cache \
    neovim git git-perl \
    zsh tmux openssh-client bash ncurses \
    curl less man bat fd fzf docker lolcat \
    cowsay fortune delta wget
RUN useradd -ms /bin/zsh lorax
WORKDIR /home/lorax
ENV HOME /home/lorax
