# Stage 1: Build source
FROM node:20-alpine AS build

USER root
ENV PUPPETEER_SKIP_DOWNLOAD=true

WORKDIR /usr/src

RUN apk add --no-cache git
RUN git clone https://github.com/FlowiseAI/Flowise.git .

RUN npm install -g pnpm
RUN pnpm install
RUN pnpm build

# Stage 2: Runtime
FROM node:20-alpine

RUN apk add --no-cache chromium python3 py3-pip make g++ build-base cairo-dev pango-dev curl

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

WORKDIR /app

COPY --from=build /usr/src /app

COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
