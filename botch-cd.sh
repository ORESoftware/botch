#!/usr/bin/env bash

cd(){
    builtin cd "$@";

    which_botch=$(which botch);

    if [[ -z "$which_botch" ]]; then
       npm install -g botch
    fi

    # we always clean the path
    p="$(botch --clean-path)";
    export PATH="$p";

    # we only add to the path, if botch is installed locally
    . "$HOME/.botch/shell.sh"
}