#!/usr/local/bin/dumb-init /bin/bash
set -e

# Disabling nginx daemon mode
export KONG_NGINX_DAEMON="off"
export KONG_CLUSTER_ADVERTISE=$(curl -s 169.254.169.254/latest/meta-data/local-ipv4):7946

exec "$@"
