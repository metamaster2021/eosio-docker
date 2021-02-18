#!/usr/bin/bash

ver=$1
[[ -z "$ver" ]] && ver='v2.0.9'

build -t "mgp/eos:${ver}" .