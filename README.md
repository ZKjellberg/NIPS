# Extra Credit Assignment

Write a program ( using any language you choose ) to convert the following MIPS floating point data to the NIPS format showing the result as a 32-bit hexadecimal result.  Include your source code when your submit your results.  Also,  provide a brief description of what you did.

Type | BIAS | Mantissa
:--: | :--: | :------:
MIPS | 7F   | [1].####
NIPS | 80   | [0].1###

## MIPS 40A8 0000

Type   | 31-28 | 27-24 | 23-20 | 19-16 | 15-0
:----: | :---: | :---: | :---: | :---: | :-----------------:
HEX    | 4     | 0     | A     | 8     | 0 0 0 0
Binary | 0100  | 0000  | 1010  | 1000  | 0000 0000 0000 0000

Sign | Exponent       | Mantissa
:--: | :------------: | :------:
0    | 1000 0001 (81) | 0101 000 0000 0000 0000 000

1. Exponent minus BIAS: 81-7F = 2
1. Mantissa + hidden bit = 1.0101
1. Actual value: 1.0101 * 2^2 == 101.01

### Conversion to NIPS

1. 101.01 == 2^3 * [0].10101
1. NIPS Mantissa: [0].10101
1. NIPS Exponent: 3 + 80 = 83

NIPS Represenation

Sign | Exponent       | Mantissa
:--: | :------------: | :------:
0    | 1000 0011 (83) | 10101

Type   | 31-28 | 27-24 | 23-20 | 19-16 | 15-0
:----: | :---: | :---: | :---: | :---: | :-----------------:
Binary | 0100  | 0001  | 1101  | 0100  | 0000 0000 0000 0000
HEX    | 4     | 1     | D     | 4     | 0 0 0 0

### Comparison of values

Type | HEX Value | Sign | Exponent | Mantissa
:--: | :-------: | :--: | :------: | :------:
MIPS | 40A8 0000 | 0    | 81 (2^2) | [1].0101
NIPS | 41D4 0000 | 0    | 83 (2^3) | [0].10101

## MIPS 3EA0 0000

Type   | 31-28 | 27-24 | 23-20 | 19-16 | 15-0
:----: | :---: | :---: | :---: | :---: | :-----------------:
HEX    | 3     | E     | A     | 0     | 0 0 0 0
Binary | 0011  | 1110  | 1010  | 0000  | 0000 0000 0000 0000

Sign | Exponent       | Mantissa
:--: | :------------: | :------:
0    | 0111 1001 (79) | 010 0000 0000 0000 0000 0000

1. Exponent minus BIAS: 79-7F = -2
1. Mantissa + hidden bit = 1.01
1. Actual value: 1.01 * 2^-2 == __0.0101__

### Conversion to NIPS

1. 0.0101 == 2^-1 * [0].101
1. NIPS Mantissa: [0].101
1. NIPS Exponent: 80 - 1 = 7F

NIPS Represenation

Sign | Exponent       | Mantissa
:--: | :------------: | :------:
0    | 0111 1111 (7F) | 101 0000 0000 0000 0000 0000

Type   | 31-28 | 27-24 | 23-20 | 19-16 | 15-0
:----: | :---: | :---: | :---: | :---: | :-----------------:
Binary | 0011  | 1111  | 1101  | 0000  | 0000 0000 0000 0000
HEX    | 3     | F     | D     | 0     | 0 0 0 0

### Comparison of values

Type | HEX Value | Sign | Exponent  | Mantissa
:--: | :-------: | :--: | :-------: | :------:
MIPS | 3EA0 0000 | 0    | 7D (2^-2) | [1].01
NIPS | 3FD0 0000 | 0    | 7F (2^-1) | [0].101

## Possible Implementation

1. Update mantissa by with a shift right logical for bits 15-0 a single position.
1. Add 1 to bit 15 for hidden bit.
1. Add 2 to bits 27-24 (exponent)
