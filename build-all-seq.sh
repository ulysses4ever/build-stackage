#!/usr/bin/env bash
pkgs="$1"
wd="_work"
ghc="$GHC"

mkdir -p "$wd"

build () {
    echo "Processing $1"
    rm -rf "$1"
    cabal get "$1" > /dev/null
    pushd "$1" > /dev/null
    cp ../../cabal.project .
    cabal build all -j --with-compiler="$ghc" 1>out 2>&1
    echo $? >res
    popd > /dev/null
    echo "Finished with $1"
}

pushd "$wd" > /dev/null
while read p; do
    build "$p"
done < "../$pkgs"
popd > /dev/null
