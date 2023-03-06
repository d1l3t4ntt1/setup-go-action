#!/bin/bash

mkdir -p .temp
curl -s https://raw.githubusercontent.com/findy-network/setup-go-action/master/scanner/scan.sh >.temp/scan.sh && chmod a+x .temp/scan.sh
curl -s https://raw.githubusercontent.com/findy-network/setup-go-action/master/scanner/lichen.sh >.temp/lichen.sh && chmod a+x .temp/lichen.sh
curl -s https://raw.githubusercontent.com/findy-network/setup-go-action/master/scanner/lichen-cfg.yaml >.temp/lichen-cfg.yaml

.temp/scan.sh "$1"
