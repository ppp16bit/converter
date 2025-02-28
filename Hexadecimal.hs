import Data.Char (chr, ord, digitToInt)
import Numeric (showHex, readHex)
import Data.List (unfoldr)

charToHex :: Char -> String
charToHex char =
    let hex = showHex (ord char) ""
    in if length hex == 1 then '0' : hex else hex

textToHex :: String -> String
textToHex = unwords . map charToHex

-- validation
validHex :: String -> Bool
validHex hex = all (`elem` "0123456789abcdefABCDEF") hex && length hex == 2

-- ASCII
hexToChar :: String -> Char
hexToChar hex = case readHex hex of
    [(value, "")] -> chr value
    _ -> error "invalid hex"

-- string hex for text
hexToText :: String -> Maybe String
hexToText input =
    let hexValues = words input
    in if all validHex hexValues
        then Just (map hexToChar hexValues)
        else Nothing

main :: IO ()
main = do
    putStrLn "1 - text to hexadecimal" 
    putStrLn "2 - hexadecimal to text"
    option <- getLine
    case option of
        "1" -> do
            putStrLn "enter"
            text <- getLine
            putStrLn $ "Hex: " ++ textToHex text
        "2" -> do
            putStrLn "enter the hexadecimal"
            hex <- getLine
            case hexToText hex of
                Just result -> putStrLn $ " " ++ result
                Nothing -> putStrLn "error"
        _ -> putStrLn "error enter 1 or 2"