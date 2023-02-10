#!/bin/bash

# NOTE!! Never ever use this if youn want to check the error codes by yourself
#    set -e
# as we want to do here:

current_dir=$(dirname "$BASH_SOURCE")
config_file="$current_dir/lichen-cfg.yaml"

if ! command -v lichen &>/dev/null; then
  go install github.com/uw-labs/lichen@latest
fi

case "$2" in
c)
  lichen \
    -c $config_file \
    --template="{{range .Modules}}{{range .Module.Licenses}}{{.Name | printf \"%s\n\"}}{{end}}{{end}}" \
    "$1" | sort | uniq -c | sort -nr
  ;;
v)
  lichen -c $config_file "$1"
  ;;
*)
  lichen -c $config_file --template="" $1
  ;;
esac

result=$?

rm "$1"

if [ $result -gt 0 ]; then
  echo "Licensing error"
  exit 1
fi
echo "Licensing OK"
