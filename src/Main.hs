{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty
import Data.Monoid ((<>))
import Data.Text.Lazy as T

printCase :: T -> T
printCase text = T.toUpper text

main :: IO ()
main = do
  putStrLn "Starting web server..."
  scotty 3000 $ do
    get "/hello/:name" $ do
      name <- param "name"
      text  $ "Hello " <>  printCase name <> "!"
