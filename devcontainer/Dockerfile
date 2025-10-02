FROM ubuntu:jammy

RUN apt update && apt install -y \
    git curl zsh sudo build-essential

RUN useradd -m -s /bin/bash dev && \
    echo 'dev ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    passwd -d dev

USER dev
WORKDIR /home/dev

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && \
    brew install \
        nvim fd \
        go \
        npm

RUN git clone https://github.com/ffff00-korj/dotfiles.git && \
    cp dotfiles/zsh/zshrc ~/.zshrc && \
    mkdir -p ~/.config/nvim && \
    cp -r dotfiles/nvim ~/.config && \
    rm -rf dotfiles

RUN mkdir -p ~/.local/bin && \ 
    ln -sf /home/linuxbrew/.linuxbrew/bin/nvim v && \
    mv v ~/.local/bin

RUN mkdir -p /home/dev/workspaces

CMD ["zsh"]
