FROM alpine:latest
COPY . pde
WORKDIR /
RUN \
    echo "@main http://dl-cdn.alpinelinux.org/alpine/v3.15/main" >> /etc/apk/repositories && \
    echo "@community http://dl-cdn.alpinelinux.org/alpine/v3.15/community" >> /etc/apk/repositories && \
    echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk update
COPY skel etc/skel
RUN apk add -U --no-cache git git-perl sudo
RUN apk add -U --no-cache zsh tmux openssh-client bash ncurses coreutils
RUN adduser -s /bin/zsh lorax -D
ENV HOME /home/lorax
WORKDIR /
COPY sys-setup.sh /home/lorax
USER lorax
