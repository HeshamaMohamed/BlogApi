#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then # checks that tmp/pids/server.pid is not present to ensure that there won’t be server conflicts when we start the application
  rm tmp/pids/server.pid
fi

rails db:drop
rails db:create
rails db:migrate
rails db:seed

bundle exec rails s -b 0.0.0.0 
