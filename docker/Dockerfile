# Stage 1: Build stage
FROM node:20-alpine AS build

USER root

ENV PUPPETEER_SKIP_DOWNLOAD=true

WORKDIR /usr/src

# Clone Flowise từ GitHub
RUN apk add --no-cache git
RUN git clone https://github.com/FlowiseAI/Flowise.git .

# Cài pnpm và dependencies
RUN npm install -g pnpm
RUN pnpm install

# Build dự án
RUN pnpm build

# Stage 2: Runtime stage
FROM node:20-alpine

# Cài runtime dependencies
RUN apk add --no-cache chromium git python3 py3-pip make g++ build-base cairo-dev pango-dev curl

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Copy mã nguồn đã build từ stage 1
COPY --from=build /usr/src /app

# Copy custom entrypoint
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /app
ENTRYPOINT ["/entrypoint.sh"]
