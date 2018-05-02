#!/usr/bin/env bash

which_botch=$(which botch);

if [[ -z "$which_botch" ]]; then
   npm install -g botch
fi


p="$(botch --clean-path)";
export PATH="$PWD/node_modules/.bin:$p"