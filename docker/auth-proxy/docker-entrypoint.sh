#!/bin/sh
set -e

AUTH_USER=${AUTH_USER:-'admin'}

certbot certonly \
  --verbose \
  --noninteractive \
  --quiet \
  --standalone \
  --agree-tos \
  --email="${EMAIL}" \
  --domains="${DOMAIN}"

htpasswd -b -c /etc/nginx/.htpasswd $AUTH_USER $AUTH_PASS

nginx

exec "$@"
