#!/bin/bash

# We don't want to check error return values by our self here.
set -e

tmpfile=$(mktemp /tmp/findy-scan.XXXXXX)

go build -o "$tmpfile"

# subscript does the scanning and cleanup
$GITHUB_ACTION_PATH/scanner/lichen.sh "$tmpfile" "$@"
