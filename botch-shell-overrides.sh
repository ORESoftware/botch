#!/usr/bin/env bash


run_botch(){

    which_botch=$(which botch);

    if [[ -z "$which_botch" ]]; then
       npm install -g botch
    fi

    # we always clean the path
    p="$(botch --clean-path)";
    export PATH="$p";

    . "$HOME/.botch/shell.sh"
}

pushd(){
    builtin pushd "$@";
    run_botch
}

popd(){
    builtin popd "$@";
    run_botch
}

cd(){
    builtin cd "$@";
    run_botch
}


botch_unset_all(){
 unset -f cd;
 unset -f popd;
 unset -f pushd;
}

export -f run_botch;
export -f cd;
export -f popd;
export -f pushd;
export -f botch_unset_all;