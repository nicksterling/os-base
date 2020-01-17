FROM alpine:latest

RUN apk add --no-cache build-base gcc wget vim curl sudo git zsh

WORKDIR /root

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

COPY skel /
