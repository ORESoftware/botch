#!/usr/bin/env bash



run_botch(){

    echo "botch hook invoked, running run_botch...";

    local which_botch=$(which botch);

    if [[ -z "$which_botch" ]]; then
       npm install -g botch
    fi

    local which_do_the_botch="$(declare -f do_the_botch)"

    if [[ -z "$which_do_the_botch" ]]; then
      echo "botch could not find shell.sh in .botch home dir, re-sourcing.";
      . "$HOME/.botch/shell.sh";
    fi

    do_the_botch || {
        p="$(botch --clean-path)";
        export PATH="$p";
   }
}

pushd(){
    builtin pushd "$@";
    echo "botch pushd hook invoked."
    run_botch
}

popd(){
    builtin popd "$@";
    echo "botch popd hook invoked."
    run_botch
}

#alias prev_cd="cd";

#shopt -s extdebug
#declare -F cd
#shopt -u extdebug

if [[ -z "$is_botch_cd_defined" ]]; then
    export is_botch_cd_defined="yes";
    definition_prev_cd="prev_$(declare -f cd)"
    echo "$definition_prev_cd";
    eval "${definition_prev_cd}"
    unset definition_prev_cd  # clean up, no reason to leave this string around
    export -f prev_cd
fi


cd(){
#    builtin cd "$@";
    prev_cd "$@"
    echo "botch cd hook invoked."
    run_botch
}


botch_unset_all(){
 unset -f cd;
 unset -f popd;
 unset -f pushd;
}

export -f run_botch;
export -f cd;
#export -f popd;
#export -f pushd;
export -f botch_unset_all;