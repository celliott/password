#!/bin/sh
set -e

AUTH_USER=${AUTH_USER:-'admin'}
AUTH_PASS=${AUTH_PASS:-'password'}

htpasswd -b -c /etc/nginx/.htpasswd $AUTH_USER $AUTH_PASS

nginx

exec "$@"
