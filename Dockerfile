FROM ubuntu:22.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Updates packages and installs basic tools
RUN apt-get update && apt-get install -y \
    curl \
    git \
    vim \
    wget \
    zip \
    unzip \
    build-essential \
    software-properties-common \
    python3 \
    python3-pip \
    nodejs \
    npm \
    && apt-get clean

# Create a working directory
WORKDIR /workspace

# Copy input script (optional)
COPY scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]