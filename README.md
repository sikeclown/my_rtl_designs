# addRoundKey
An operation in AES Encryption Round, that performs bitwise XOR. addRoundKey b(afterMixColumns,afterAddroundKey,key);
# mixColumns
An operation in AES Encryption Round, mixes columns in the 4X4 matrics of 128 bits of AES block cypher input. mixColumns m(afterShiftRows,afterMixColumns);
# shiftRows
An operation in AES Encryption Round for all rows in 4X4 matrics  of 128 bits of AES block cypher input. shiftRows r(afterSubBytes,afterShiftRows);
# subBytes
An operation in AES Encryption Round for all Bytes in 4X4 matrics of 128 bits of AES block cypher input. subBytes s(AES-Input,afterSubBytes);
# sbox
Byte substitution LUT according to AES standard.

# encryptRound
Uses "addRoundKey" "mixColumns" "sbox" "shiftRows" to perform 1 full Round of AES encryption

# keyExpansion
Takes in the 256 bit key and generate 10 round keys for each Round of AES Encryption/Decryption. Output size (10*128) bits

# AES_Encrypt
AES block cypher with 10 full Round of AES encryption and 1 round without "mixColumns". (Total: 11 Rounds of AES encryption for 256 bit key)

# ICB
Initial counter block
Takes in the 128 bit IV & 128 bit H

# H
AES Encryption of the "KEY" & 128 bits of "0".

# add32
Adds 128 bit of 32 to the input. Used for generating CB1, CB2.. from "ICB" (CB: Counter block) (IC2 = add23(IC1) ; IC1 = add23(ICB))

# xoR
Bitwise xor for 128 bits. Used in TOP module

# gfm
Performs Galois Field multiplication on a 128 bit input(in "TOP" module) & "H"

# Example Picture of TOP module (AES-GCM)
![image](https://github.com/user-attachments/assets/4ca8e434-ce0a-48ad-8ca4-a42bab4b17f4)
> Ek is AES block cypher(128 bit).
> GFH is Galois field multiplier applied in H.
> H is Ek(128’b 0).
> incr is add32.
> AAD additional data.
> TAG is Authentication TAG.
> C* is the Block cyphertext.

![image](https://github.com/user-attachments/assets/95caa70f-24e1-44ef-8227-cbe101536983)

![image](https://github.com/user-attachments/assets/bc45b06f-3b40-4d20-b19e-5af1e8b5bb5b)



