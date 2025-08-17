#!/bin/sh
# Tạo thư mục log hợp lệ và chỉ định đúng biến môi trường
mkdir -p /opt/render/.flowise/logs
export LOG_PATH=/opt/render/.flowise/logs

# Khởi chạy Flowise đúng cách
exec npx flowise start --PORT=3000
