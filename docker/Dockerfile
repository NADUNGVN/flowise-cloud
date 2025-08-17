# Stage 1: Build stage
FROM node:20-alpine AS build
USER root
ENV PUPPETEER_SKIP_DOWNLOAD=true
RUN npm install -g flowise

# Stage 2: Runtime stage
FROM node:20-alpine
RUN apk add --no-cache chromium git python3 py3-pip make g++ build-base cairo-dev pango-dev curl
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Copy Flowise
COPY --from=build /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=build /usr/local/bin /usr/local/bin

# Copy and configure entrypoint
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
