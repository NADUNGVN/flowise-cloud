#!/bin/sh

# Tạo thư mục log Flowise cần
mkdir -p /var/data/logs

# Khởi chạy Flowise đúng cách qua npx
exec npx flowise start
