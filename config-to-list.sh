#!/usr/bin/env bash
cat $1 | sed -E "/^[^0-9]*$/d" | sed "s/ ==/-/" | sed "s/,//" | sed "s/^ *//" > pkgs.txt
