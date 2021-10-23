FROM codercom/enterprise-base:ubuntu

USER root

# Install some packages
RUN sudo apt-get install -y nano tmux tmate

USER coder

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