#!/bin/sh
mkdir -p /usr/src/logs
export FLOWISE_LOG_PATH=/usr/src/logs
exec flowise start
