#!/usr/bin/env sh
set -eu
envsubst '${PACKAGE_SERVER_HOST} ${PACKAGE_SERVER_PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
exec "$@"