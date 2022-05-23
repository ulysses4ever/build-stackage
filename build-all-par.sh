#!/usr/bin/env bash
cat $1 | parallel -j ../build-one.sh {%} {}
