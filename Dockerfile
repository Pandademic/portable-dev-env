FROM alpine:latest
COPY . .
WORKDIR /
RUN \
    echo "@main http://dl-cdn.alpinelinux.org/alpine/v3.15/main" >> /etc/apk/repositories && \
    echo "@community http://dl-cdn.alpinelinux.org/alpine/v3.15/community" >> /etc/apk/repositories && \
    echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk update
RUN apk add -U --no-cache neovim git git-perl 
RUN apk add -U --no-cache zsh tmux openssh-client bash ncurses 
RUN apk add -U --no-cache curl less docker shadow
RUN apk add -U --no-cache fortune wget doas chpasswd
RUN apk add -U --no-cache fzf fd bat --repository=http://dl-cdn.alpinelinux.org/alpine/v3.15/community
RUN adduser -s /bin/zsh -k skel  -D lorax wheel
RUN echo "tree" | passwd lorax --stdin
WORKDIR /home/lorax
ENV HOME /home/lorax
