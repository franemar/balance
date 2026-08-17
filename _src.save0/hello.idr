module Main

import Data.String

-- Hex U+1F408 is 128008 in decimal
catCodePoint : Int
catCodePoint = 0x1F408

main : IO ()
main = do
  let catChar = cast catCodePoint
  let catString = singleton catChar
  putStrLn ("Hello Tango: " ++ catString)