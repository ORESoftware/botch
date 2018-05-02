#!/usr/bin/env bash


run_botch_test(){
  export botch_env="mucho botcho";
}

run_botch(){

    which_botch=$(which botch);

    if [[ -z "$which_botch" ]]; then
       npm install -g botch
    fi

    which_botch="$(which do_the_botch)"

    if [[ -z "$which_botch" ]]; then
      . "$HOME/.botch/shell.sh";
    fi

    do_the_botch || {
        p="$(botch --clean-path)";
        export PATH="$p";
   }
}

pushd(){
    builtin pushd "$@";
    run_botch
}

popd(){
    builtin popd "$@";
    run_botch
}

alias prev_cd="cd";

# Turn on extended shell debugging
shopt -s extdebug
# Dump the function's name, line number and fully qualified source file
declare -F cd
# Turn off extended shell debugging
shopt -u extdebug

cd(){
    builtin cd "$@";
#    prev_cd "$@"
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
export -f run_botch_test;