#!/usr/bin/env bash

shopt -s extdebug
# Dump the function's name, line number and fully qualified source file
declare -pf do_the_botch
# Turn off extended shell debugging
shopt -u extdebug