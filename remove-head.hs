#!/usr/bin/env runhaskell

import System.Environment
import Data.List

main = do
    [file] <- getArgs
    cts <- readFile file
    let cts' = unlines . tail . dropWhile (not . ("build-depends:" `isSuffixOf`)) . lines $ cts
    writeFile (file ++ ".new") cts'

