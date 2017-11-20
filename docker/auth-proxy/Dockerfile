FROM nginx:alpine
MAINTAINER chris elliott <ctelliott@gmail.com>

RUN apk update && \
  apk add \
    ca-certificates \
    nginx \
    apache2-utils \
  && rm -rf /var/cache/apk/*

# Add nginx config.
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/default.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /run/nginx

# Add docker-entrypoint.sh
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
