the core mathematical equation for converting an 8-bit binary number to decimal:

$$
\text{decimal value} = \sum_{i=0}^{7} b_i \cdot 2^{7-i}
$$


$$
\text{decimal value} = ((((((b_0 \cdot 2 + b_1) \cdot 2 + b_2) \cdot 2 + b_3) \cdot 2 + b_4) \cdot 2 + b_5) \cdot 2 + b_6) \cdot 2 + b_7
$$

this is mathematically equivalent to:

$$
\text{decimal value} = b_0 \cdot 2^7 + b_1 \cdot 2^6 + b_2 \cdot 2^5 + b_3 \cdot 2^4 + b_4 \cdot 2^3 + b_5 \cdot 2^2 + b_6 \cdot 2^1 + b_7 \cdot 2^0
$$

example: converting "01000001" (Letter 'A')

$$
\text{decimal value} = 0 \cdot 2^7 + 1 \cdot 2^6 + 0 \cdot 2^5 + 0 \cdot 2^4 + 0 \cdot 2^3 + 0 \cdot 2^2 + 0 \cdot 2^1 + 1 \cdot 2^0 = 65
$$

hexadecimal Conversion Equations

each character is converted to its ASCII value, then to hex:

$$
\text{hex}(c) = \text{hex} (\text{ord}(c))
$$

apply the conversion to each character and concatenate:

$$
\text{HexString}(S) = \bigoplus_{i=0}^{n-1} \text{hex}(S_i)
$$

convert each hex value back to its character:

$$
\text{char}(H) = \text{chr} (\text{dec}(H))
$$

convert each hex pair back to characters and concatenate:

$$
\text{Text}(H) = \bigoplus_{i=0}^{m-1} \text{char}(H_i)
$$
