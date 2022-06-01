#!/bin/sh

set -e # tells the /bin/sh shell that runs the script to fail fast if there are any problems later in the script.

if [ -f tmp/pids/server.pid ]; then # checks that tmp/pids/server.pid is not present to ensure that there won’t be server conflicts when we start the application
  rm tmp/pids/server.pid
fi

bundle exec rails s -b 0.0.0.0 
# -b binds the server to all IP addresses rather than to the default, localhost.
# makes the Rails server route incoming requests to the container IP rather than to the default localhost.
