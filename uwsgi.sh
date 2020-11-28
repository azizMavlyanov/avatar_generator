#!/bin/bash
set -e

if [ "$APP_ENV" = 'production' ]; then
  echo "Running Production Server..."
  exec uwsgi \
    --http "$HOSTNAME":"9090" --wsgi-file ./src/app.py --callable app \
    --stats "$HOSTNAME":"9191" --stats-http \
    --log-socket "$HOSTNAME":"9292"
else
  echo "Running Development Server..."
  cd src
  export FLASK_APP=app.py
  export FLASK_ENV="$APP_ENV"
  exec flask run --host "$HOSTNAME" --port "9090"
fi
