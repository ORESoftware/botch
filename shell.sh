#!/usr/bin/env bash

# we only want to change the path if botch is installed
# if it's not installed, we don't run/source the botch/bin.sh file

which_botch="$(which botch)";

if [[ -z "$which_botch" ]]; then
   npm install -g botch
fi


. "$PWD/$botch_shell_file_name" 2> /dev/null && echo "Local shell file sourced: $botch_shell_file_name";
. "$PWD/node_modules/botch/bin.sh" 2> /dev/null && echo "Botch shell was sourced. Local development environment detected.";
