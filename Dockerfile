# 🐳 Dockerfile: CareerOps Cloud (Ubuntu Latest)
FROM ubuntu:latest

# Setup Environment
ENV PORT=7681
ENV DEBIAN_FRONTEND=noninteractive

# 1. Install Base Dependencies & Node.js (v20 LTS)
RUN apt-get update && apt-get install -y \
    ca-certificates \
    wget \
    curl \
    git \
    python3 \
    python3-pip \
    tini \
    fastfetch \
    build-essential \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 2. Install Claude Code CLI (Native Installer)
RUN curl -fsSL https://claude.ai/install.sh | bash

# 3. Setup Workspace & Clone Career-Ops
WORKDIR /root/workspace
RUN git clone https://github.com/santifer/career-ops.git . \
    && npm install

# 4. Install Playwright for PDF Generation (Chromium)
RUN npx playwright install --with-deps chromium

# 5. Install ttyd with Arch Detection (Optimized)
RUN set -eux; \
    ARCH="$(uname -m)"; \
    case "$ARCH" in \
        x86_64|amd64)  ASSET="ttyd.x86_64" ;; \
        aarch64|arm64) ASSET="ttyd.aarch64" ;; \
        *) echo "Error: Unsupported architecture ($ARCH)"; exit 1 ;; \
    esac; \
    URL="https://github.com/tsl0922/ttyd/releases/latest/download/${ASSET}"; \
    wget -qO /usr/local/bin/ttyd "$URL" && chmod +x /usr/local/bin/ttyd

# 6. Final Configuration
# Ensure user lands in the workspace with system info
RUN echo "cd /root/workspace" >> /root/.bashrc && \
    echo "fastfetch || true" >> /root/.bashrc

EXPOSE 7681

# Using tini to handle signals and prevent zombie processes
ENTRYPOINT ["/usr/bin/tini", "--"]

# Launch ttyd with Basic Auth and Writable Terminal
CMD ["/bin/bash", "-c", "/usr/local/bin/ttyd --writable --interface 0.0.0.0 -p ${PORT:-7681} -c ${USERNAME:-admin}:${PASSWORD:-admin} /bin/bash -l"]