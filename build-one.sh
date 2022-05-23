#!/usr/bin/env bash

jobid="$1"
pkg="$2"
wd="_work"
ghc=$GHC

mkdir -p "$wd"

build () {
    echo "Processing $1"
    rm -rf "$1"
    cabal get "$1" > /dev/null
    pushd "$1" > /dev/null
    echo $PWD
    cp ../../cabal.project .
    cabal --store-dir="../../.cabal-store-$jobid" build lib:$(echo $1 | sed -E s/-[0-9.]+//) -j2 --with-compiler="$ghc" 1>out 2>&1
    echo $? >res
    popd > /dev/null
    echo "Finished with $1"
}

pushd "$wd" > /dev/null
build "$pkg"
popd > /dev/null
