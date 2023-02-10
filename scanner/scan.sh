#!/bin/bash

# We don't want to check error return values by our self here.
set -e

tmpfile=$(mktemp /tmp/findy-scan.XXXXXX)

go build -o "$tmpfile"

CURRENT_DIR=$(dirname "$BASH_SOURCE")

# subscript does the scanning and cleanup
$CURRENT_DIR/lichen.sh "$tmpfile" "$@"
