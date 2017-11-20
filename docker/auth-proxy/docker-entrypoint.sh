#!/bin/sh
set -e

AUTH_USER=${AUTH_USER:-'admin'}
if [ -z "$AUTH_PASS" ]; then
  echo "AUTH_PASS must be set"; exit 1
fi

htpasswd -b -c /etc/nginx/.htpasswd $AUTH_USER $AUTH_PASS

nginx

exec "$@"
