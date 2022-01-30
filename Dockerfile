FROM alpine:latest
COPY apk_repos /etc/apk/repositories
RUN apk update
RUN apk add -U --no-cache neovim git git-perl 
RUN apk add -U --no-cache zsh tmux openssh-client bash ncurses 
RUN apk add -U --no-cache curl less man bat fd fzf docker lolcat 
RUN apk add -U --no-cache cowsay fortune delta wget
RUN useradd -ms /bin/zsh lorax
WORKDIR /home/lorax
ENV HOME /home/lorax
