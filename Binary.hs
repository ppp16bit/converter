import Data.Char (chr, ord, digitToInt)
import Numeric (showIntAtBase)
import Data.List (unfoldr)

charToBin :: Char -> String
charToBin char =
  let bin = showIntAtBase 2 (\x -> if x == 0 then '0' else '1') (ord char) ""
  in replicate (8 - length bin) '0' ++ bin

textToBin :: String -> String
textToBin = unwords . map charToBin

validBin :: String -> Bool
validBin bin = all (`elem` "01") bin && length bin == 8

binToChar :: String -> Char
binToChar = chr . foldl (\acc x -> acc * 2 + digitToInt x) 0
  where digitToInt c = if c == '0' then 0 else 1

binToText :: String -> Maybe String
binToText input = 
  let bins = words input
  in if all validBin bins
     then Just (map binToChar bins)
     else Nothing

main :: IO ()
main = do
  putStrLn "choise"
  putStrLn "1. text for binary"
  putStrLn "2. binary for text"
  option <- getLine
  case option of
    "1" -> do
      putStrLn "enter a text:"
      text <- getLine
      if all (\c -> ord c <= 255) text 
        then putStrLn $ "binary: " ++ textToBin text
        else putStrLn "error"
    "2" -> do
      putStrLn "enter the binary (8 bits per char):"
      bin <- getLine
      case binToText bin of
        Just result -> putStrLn $ "text: " ++ result
        Nothing -> putStrLn "error: binary invalid"
    _ -> putStrLn "error: choise 1 or 2"