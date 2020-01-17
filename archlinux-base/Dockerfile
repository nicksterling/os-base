FROM archlinux:latest

RUN pacman -Sy --noconfirm reflector && \
    reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist && \ 
    pacman -Syu --noconfirm && \
    pacman -S --noconfirm vim sudo git base-devel zsh && \
    pacman -Scc --noconfirm && \
    useradd -m pivot && usermod -aG wheel pivot 
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

COPY skel /

USER pivot 

RUN cd ~ && sudo chown pivot /home/pivot && \
    git clone https://aur.archlinux.org/yay && \
    cd yay && \
    makepkg -si --noconfirm && \
    cd .. && \
    rm -rf yay && \
    yay -Sy --noconfirm oh-my-zsh-git zsh-theme-powerlevel10k-git powerline-fonts && \
    yay -Scc --noconfirm

