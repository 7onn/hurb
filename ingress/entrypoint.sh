#!/usr/bin/env sh
set -eu
envsubst '${PACKAGE_SERVER_HOST} ${PACKAGE_SERVER_PORT}' < /etc/nginx/template.nginx.conf > /etc/nginx/nginx.conf
exec "$@"