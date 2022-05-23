# Build Stackage in Bulk

**WARNING: This is still a WIP**

This repository contains scripts to build (most of) stackage packages in bulk
mode. It is meant for testing of changes in GHC.

## Dependencies and Assumptions

* `bash` and `sed`

* a system-wide GHC (we `runhaskell` certain things)

* https://github.com/Bodigrim/clc-stackage/ for list of packages from a recent
  Stackage snapshot (so, internet connection is assumed)

**We assume that you built the GHC you want to test and export a path to it as an
environment variable `GHC`.** A guide on how to build GHC is available at https://ghc.dev/

## Usage

``` shellsession
./create-pkgs.sh
./build-all-par.sh pkgs.txt
```

It will create a `_work` directory in the current directory and store package
directories there. Each package directory will hold a `res` and `out` files
containing, respectively, the exit code and the output of the build process.
Using `grep` in smart ways can help exploring these data. 
