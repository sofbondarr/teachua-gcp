#!/bin/sh
set -e

ENV_FILE="/react/.env.production"

if [ -f "$ENV_FILE" ]; then
  echo "Updating $ENV_FILE → REACT_APP_ROOT_SERVER=${REACT_APP_ROOT_SERVER}"
  # Replace the entire line beginning with REACT_APP_ROOT_SERVER=
  sed -i "s|^REACT_APP_ROOT_SERVER=.*$|REACT_APP_ROOT_SERVER=${REACT_APP_ROOT_SERVER}|g" "$ENV_FILE"
else
  echo "Error: $ENV_FILE not found!"
  exit 1
fi

npm run start