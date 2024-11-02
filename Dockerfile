# Dockerfile
FROM lscr.io/linuxserver/code-server:latest

# Add any customization or additional instructions here
# Example: install new packages

# Update and install required packages, install zsh and plugins, and create symbolic links for the specified user
RUN apt update && \
    apt-get update && \
    apt-get install -yqq wget && \
    # Default powerline10k theme
    sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.1/zsh-in-docker.sh)" -- \
    -p node \
    -p npm \
    -p extract \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions && \
    apt-get install -yqq zsh-syntax-highlighting && \
    echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc && \
    rm -rf /var/lib/apt/lists/*
