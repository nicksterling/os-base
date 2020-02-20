FROM archlinux:latest as base-build

RUN pacman -Sy --noconfirm reflector 
RUN reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist 
RUN pacman -Syu --noconfirm
RUN pacman -S pacman-contrib --noconfirm 
RUN paccache --remove --keep 0

FROM scratch as base
COPY --from=base-build / /

FROM base as devel-build

RUN pacman -S --noconfirm vim sudo git base-devel zsh
RUN useradd -m pivot && usermod -aG wheel pivot 
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

COPY skel /

USER pivot 
RUN cd ~ && sudo chown pivot /home/pivot && \
    git clone https://aur.archlinux.org/yay && \
    cd yay && \
    makepkg -si --noconfirm 
    
RUN cd ~ && rm -rf yay
RUN yay -Sy --noconfirm oh-my-zsh-git zsh-theme-powerlevel10k-git powerline-fonts 
RUN yay -Syu --noconfirm
RUN paccache --remove --keep 0

FROM scratch as devel
COPY --from=devel-build / /
 