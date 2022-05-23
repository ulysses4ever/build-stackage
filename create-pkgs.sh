#!/usr/bin/env bash

wget https://raw.githubusercontent.com/Bodigrim/clc-stackage/master/clc-stackage.cabal
./remove-head.hs clc-stackage.cabal
./config-to-list.sh clc-stackage.cabal.new
rm clc-stackage.cabal clc-stackage.cabal.new
