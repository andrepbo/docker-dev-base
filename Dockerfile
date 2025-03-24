FROM ubuntu:22.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Updates packages and installs basic tools
RUN apt-get update && apt-get install -y \
    curl \
    git \
    vim \
    wget \
    build-essential \
    software-properties-common \
    ca-certificates \
    gnupg \
    && apt-get clean

# Install Node.js (via NVM)
ENV NVM_DIR=/root/.nvm
ENV NODE_VERSION=20.11.1

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && . "$NVM_DIR/nvm.sh" \
    && nvm install $NODE_VERSION \
    && nvm use $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && npm install -g yarn

# Add nvm in bashrc
RUN echo "export NVM_DIR=\"$NVM_DIR\"" >> ~/.bashrc \
    && echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> ~/.bashrc

# Create a working directory
WORKDIR /workspace

# Copy input script (optional)
COPY scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]