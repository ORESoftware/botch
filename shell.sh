#!/usr/bin/env bash

# we only want to change the path if botch is installed
# if it's not installed, we don't run/source the botch/bin.sh file


. "$PWD/$botch_shell_file_name" && echo "Local shell file sourced: $botch_shell_file_name";
. "$PWD/node_modules/botch/bin.sh" && echo "Botch was sourced. Local development environment detected.";