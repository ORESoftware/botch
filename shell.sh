#!/usr/bin/env bash

# we only want to change the path if botch is installed
# if it's not installed, we don't run/source the botch/bin.sh file


. "$PWD/$botch_shell_file_name" 2> /dev/null && echo "Botch env: local shell file sourced: $botch_shell_file_name";
. "$PWD/node_modules/botch/bin.sh" 2> /dev/null && echo "Botch env: Local development environment detected."


botch_re_source(){
  . "$HOME/.botch/shell.sh";
  . "$HOME/.botch/overrides.sh"
}

do_the_botch(){

    local which_botch="$(which botch)";

    if [[ -z "$which_botch" ]]; then
       npm install -g botch
    fi

    . "$PWD/$botch_shell_file_name" 2> /dev/null && echo "Botch env: local shell file sourced: $botch_shell_file_name";
    . "$PWD/node_modules/botch/bin.sh" 2> /dev/null && echo "Botch env: Local development environment detected." || {
        return 1;
   }
}


export -f do_the_botch