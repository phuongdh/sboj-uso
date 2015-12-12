#!/bin/bash
set -e
usermod -u $USER_ID $APP_USER
bundle exec rails server -b 0.0.0.0
exec "$@"
