module Main where

import Test.Tasty
import Test.Tasty.HUnit

import Lib

skipsSuite :: TestTree
skipsSuite = testGroup "0three rec poly TEST"
              [ testGroup "Test of --skips-- function" $
                  [testCase "skips 1" $ skips "ABCD" @?= ["ABCD", "BD", "C", "D"]
                  ,testCase "skips 2" $ foundfibo 8 @?= 10
                  ,testCase "skips 3" $ maximumPrime 600851475143 @?= 6857
                  ]
              ]

main = defaultMain skipsSuite

