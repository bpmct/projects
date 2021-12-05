FROM codercom/enterprise-base:ubuntu

USER root

# Install some packages
RUN apt-get update && \
    apt-get install -y nano tmux tmate openssh-server

# Set NVM_DIR outside of the home directory so it doesn't persist across rebuilds
ENV NVM_DIR=/usr/bin/nvm
RUN mkdir -p $NVM_DIR
RUN chown coder:coder $NVM_DIR

COPY coder /coder

# Fix locales error in code-server
RUN locale-gen "en_US.UTF-8" && \
    dpkg-reconfigure locales

# Install Go
RUN curl -L "https://dl.google.com/go/go1.17.4.linux-amd64.tar.gz" | tar -C /usr/local -xzvf -
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin
ENV GOPATH /home/coder/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

# Packages required for multi-editor support
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    libxtst6 \
    libxrender1 \
    libfontconfig1 \
    libxi6 \
    libgtk-3-0

# Install GoLand
RUN mkdir -p /opt/goland
RUN curl -L "https://download.jetbrains.com/product?code=GO&latest&distribution=linux" | tar -C /opt/goland --strip-components 1 -xzvf -
RUN ln -s /opt/goland/bin/goland.sh /usr/bin/goland

USER coder

# Install latest code-server
ARG VERSION=3.12.0
ARG ARCH=amd64
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    # Install any Node versions we need
    && nvm install 12 \
    && nvm install 15 \
    && nvm alias default 15 \
    && nvm use default \
    # Install yarn
    && npm install --global yarn expo-cli


ENV PATH="/home/coder/.yarn/bin:${PATH}"
