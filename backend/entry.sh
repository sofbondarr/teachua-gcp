#!/usr/bin/env bash
set -e

set_default() {
  var_name=$1
  default_value=$2
  if [ -n "$var_name" ]; then
    eval "current=\${$var_name}"
    if [ -z "$current" ]; then
      export "$var_name"="$default_value"
    fi
  fi
}

trim() {
  str=$1
  str="${str#"${str%%[![:space:]]*}"}"
  str="${str%"${str##*[![:space:]]}"}"
  printf '%s' "$str"
}

while IFS= read -r line || [ -n "$line" ]; do
  case "$line" in
    ''|\#*) continue ;;
  esac
  # Split the line into key and value
  # Example: "KEY=VALUE" becomes key="KEY", val="VALUE"
  key="${line%%=*}"
  val="${line#*=}"

  key=$(trim "$key")
  val=$(trim "$val")


  set_default "$key" "$val"

done < /app/.env.default

exec java -jar app.war
