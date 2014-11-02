# Extra Credit Assignment

Consider the NIPS floating point format.    Words are 32-bits with 1 bit for sign, 8 for exponent, and 23 for mantissa.

The differences from MIPS are that for NIPS

1. The bias is 80 (hex) rather than 7F that MIPS uses
2. Mantissas are normalized to .1xxxxxx rather than 1.xxxx like MIPS and the “hidden bit” technique is not used.
 
Write a program ( using any language you choose ) to convert the following MIPS floating point data to the NIPS format showing the result as a 32-bit hexadecimal result.  Include your source code when your submit your results.  Also,  provide a brief description of what you did.
 
1. MIPS 40A8 0000 -> NIPS ?
1. MIPS 3EA0 0000 -> NIPS ?

# MIPS vs NIPS

Type | BIAS | Mantissa
:--: | :--: | :------:
MIPS | 7F   | [1].####
NIPS | 80   | [0].1###

### Comparison of values

Type | HEX Value | Sign | Exponent | Mantissa
:--: | :-------: | :--: | :------: | :------:
MIPS | 40A8 0000 | 0    | 81 (2^2) | [1].0101
NIPS | 41D4 0000 | 0    | 83 (2^3) | [0].10101

Type | HEX Value | Sign | Exponent  | Mantissa
:--: | :-------: | :--: | :-------: | :------:
MIPS | 3EA0 0000 | 0    | 7D (2^-2) | [1].01
NIPS | 3FD0 0000 | 0    | 7F (2^-1) | [0].101

## Possible Implementation

1. Update mantissa by with a shift right logical for bits 15-0 a single position.
1. Add 1 to bit 15 for hidden bit.
1. Add 2 to bits 27-24 (exponent)