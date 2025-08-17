#!/bin/sh
mkdir -p /usr/src/logs
export FLOWISE_LOG_PATH=/usr/src/logs

# Flowise từ v3.x thường chạy bằng cách này:
exec npx flowise start
