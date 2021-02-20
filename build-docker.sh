#!/usr/bin/bash

ver=$1
[[ -z "$ver" ]] && ver='v2.0.9'

img="mgp/eos:${ver}"

cd $ver && docker build -t $img .
