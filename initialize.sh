#!/bin/bash
cat /tmp/nginx.conf.template \
  | \
    envsubst '\
    \$WEB_DOMAIN \
    \$WEB_SOCKET_NAME \
  ' \
  > /etc/nginx/nginx.conf

ln -sf /dev/stdout $ACCESS_LOG
ln -sf /dev/stdout $ERROR_LOG

nginx -g 'daemon off;'
