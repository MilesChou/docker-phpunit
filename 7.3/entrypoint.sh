#!/bin/sh -l

# check if the first argument passed in looks like a flag
if [ "${1#-}" != "$1" ]; then
  set -- /sbin/tini -- phpunit "$@"
# check if the first argument passed in is phpunit
elif [ "$1" = 'phpunit' ]; then
  set -- /sbin/tini -- "$@"
fi

exec "$@"
