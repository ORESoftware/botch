#!/usr/bin/env bash

set -e;

mkdir -p "$HOME/.botch"
cat shell.sh > "$HOME/.botch/shell.sh"
cat botch-shell-overrides.sh > "$HOME/.botch/overrides.sh"