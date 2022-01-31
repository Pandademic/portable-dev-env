FROM alpine:latest
COPY . pde
WORKDIR /
RUN \
    echo "@main http://dl-cdn.alpinelinux.org/alpine/v3.15/main" >> /etc/apk/repositories && \
    echo "@community http://dl-cdn.alpinelinux.org/alpine/v3.15/community" >> /etc/apk/repositories && \
    echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk update
RUN apk add -U --no-cache git git-perl sudo
RUN apk add -U --no-cache zsh tmux openssh-client bash ncurses 
RUN apk add -U --no-cache curl less docker shadow
RUN apk add -U --no-cache fortune wget doas 
RUN apk add -U --no-cache fzf fd bat neovim --repository=http://dl-cdn.alpinelinux.org/alpine/v3.15/community
RUN apk add build-base cmake automake autoconf libtool pkgconf coreutils curl unzip gettext-tiny-dev
RUN adduser -s /bin/zsh -k skel  -D lorax wheel
ENV HOME /home/lorax
WORKDIR /home/lorax
USER lorax
# build neovim from source
#RUN git clone https://github.com/neovim/neovim
#WORKDIR neovim
#RUN make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$HOME/bin/nvim install
#WORKDIR ~
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
WORKDIR .config/nvim
RUN git clone https://github.com/Pandademic/waffle-vim.git lua
USER root
