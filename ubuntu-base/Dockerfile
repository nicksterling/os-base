FROM ubuntu:18.04

RUN apt-get update && apt-get install -y vim curl sudo git build-essential zsh
RUN useradd -m pivot && usermod -aG sudo pivot 
RUN echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER pivot

RUN sudo chown pivot /home/pivot
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

COPY skel /
