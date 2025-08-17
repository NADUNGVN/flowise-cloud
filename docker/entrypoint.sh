#!/bin/sh

# Tạo thư mục log nếu chưa có
mkdir -p /var/data/logs
export FLOWISE_LOG_PATH=/var/data/logs

# Chạy Flowise từ source
cd packages/server
pnpm start
