FROM alpine:latest
COPY . pde
WORKDIR /
RUN \
    echo "@main http://dl-cdn.alpinelinux.org/alpine/v3.15/main" >> /etc/apk/repositories && \
    echo "@community http://dl-cdn.alpinelinux.org/alpine/v3.15/community" >> /etc/apk/repositories && \
    echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk update
RUN rmdir etc/skel
COPY skel etc/skel
RUN apk add -U --no-cache git git-perl sudo
RUN apk add -U --no-cache zsh tmux openssh-client bash ncurses 
RUN apk add build-base cmake automake autoconf libtool pkgconf coreutils curl unzip gettext-tiny-dev
RUN adduser -s /bin/zsh lorax 
ENV HOME /home/lorax
WORKDIR /home/lorax
USER lorax
USER root
