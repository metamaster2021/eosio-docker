#!/usr/bin/bash

ver=$1
[[ -z "$ver" ]] && ver='v2.0.9'

img="mgp/eos:${ver}"

cd $ver && docker build -t $img .

docker login --username tigerich --password $mgpchain
docker push $img 
