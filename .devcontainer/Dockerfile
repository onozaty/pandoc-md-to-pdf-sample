FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    git \
    && rm -rf /var/lib/apt/lists/*

# Pandoc (latest from GitHub Releases) and PDF generation (xelatex)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    unzip \
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-lang-japanese \
    texlive-lang-chinese \
    fonts-noto-cjk \
    lmodern \
    && rm -rf /var/lib/apt/lists/* \
    && PANDOC_VERSION=3.10 \
    && curl -fsSL "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb" -o /tmp/pandoc.deb \
    && dpkg -i /tmp/pandoc.deb \
    && rm /tmp/pandoc.deb

# Node.js 24 (LTS) for Mermaid CLI (mmdc requires Node >= 22)
RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

# Chrome dependencies for Mermaid CLI (via Puppeteer)
# See https://pptr.dev/troubleshooting#chrome-doesnt-launch-on-linux
RUN apt-get update && apt-get install -y --no-install-recommends \
    libnspr4 \
    libnss3 \
    libatk1.0-0t64 \
    libatk-bridge2.0-0t64 \
    libdrm2 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libasound2t64 \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g @mermaid-js/mermaid-cli

# Install Chrome headless shell matching the version expected by mermaid-cli's puppeteer
ENV PUPPETEER_CACHE_DIR=/home/ubuntu/.cache/puppeteer
RUN CHROME_VERSION=$(node -e "console.log(require('/usr/lib/node_modules/@mermaid-js/mermaid-cli/node_modules/puppeteer').executablePath())" | grep -oP '\d+\.\d+\.\d+\.\d+') \
    && mkdir -p "$PUPPETEER_CACHE_DIR/chrome-headless-shell/linux-${CHROME_VERSION}" \
    && curl -fsSL "https://storage.googleapis.com/chrome-for-testing-public/${CHROME_VERSION}/linux64/chrome-headless-shell-linux64.zip" \
       -o /tmp/chrome-headless-shell.zip \
    && unzip -q /tmp/chrome-headless-shell.zip \
       -d "$PUPPETEER_CACHE_DIR/chrome-headless-shell/linux-${CHROME_VERSION}/" \
    && rm /tmp/chrome-headless-shell.zip \
    && chown -R ubuntu:ubuntu /home/ubuntu/.cache

RUN echo "ubuntu ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu \
    && chmod 0440 /etc/sudoers.d/ubuntu

RUN mkdir -p /home/ubuntu/.claude /home/ubuntu/.config/gh && chown -R ubuntu:ubuntu /home/ubuntu/.claude /home/ubuntu/.config/gh
