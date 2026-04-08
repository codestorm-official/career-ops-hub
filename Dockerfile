# 🐳 Dockerfile: CareerOps Cloud (Ubuntu Latest)
FROM ubuntu:latest

# Setup Environment
ENV PORT=7681
ENV DEBIAN_FRONTEND=noninteractive

# 1. Install Base Dependencies & Node.js (v20 LTS)
# 1. Install Base Dependencies & Node.js (v20 LTS)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    gnupg \
    wget \
    curl \
    git \
    nano \
    python3 \
    python3-full \
    tini \
    neofetch \
    build-essential \
    && mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
    && apt-get update && apt-get install -y nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 2. Install Claude Code CLI (Native Installer)
RUN npm install -g @anthropic-ai/claude-code

# 3. Setup Workspace & Clone Career-Ops
WORKDIR /app_source
RUN git clone https://github.com/santifer/career-ops.git . && npm install

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
WORKDIR /root/workspace
RUN echo "cd /root/workspace" >> /root/.bashrc && \
    echo "neofetch || true" >> /root/.bashrc

EXPOSE 7681

ENTRYPOINT ["/usr/bin/tini", "--"]

# Launch ttyd with Basic Auth and Writable Terminal
CMD ["/bin/bash", "-c", "if [ ! -f /root/workspace/package.json ]; then echo 'Deploying CareerOps files...'; cp -a /app_source/. /root/workspace/; fi && cd /root/workspace && /usr/local/bin/ttyd --writable --interface 0.0.0.0 -p ${PORT:-7681} -c ${USERNAME:-admin}:${PASSWORD:-admin} /bin/bash -l"]