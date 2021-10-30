FROM codercom/enterprise-base:ubuntu

USER root

# Install some packages
RUN sudo apt-get install -y nano tmux tmate

# Set NVM_DIR outside of the home directory so it doesn't persist across rebuilds
ENV NVM_DIR=/usr/bin/nvm
RUN mkdir -p $NVM_DIR
RUN chown coder:coder $NVM_DIR

COPY coder /coder

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
    # Install global packages on the default version of node
    && npm install --global yarn expo-cli

ENV PATH="/home/coder/.yarn/bin:${PATH}"
