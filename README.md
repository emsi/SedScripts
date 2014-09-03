SedScripts
==========

Varius sed scripts

Example usage
=============

hex2bin.sed  - converts HEX to Binary. Most hex formats are accepted. '0x', spaces and tabs are ignored. Arbitrary lenght numbers can be processed (limited by memory).

<pre>
./hex2bin.sed 
1234567890abcdef111
0001001000110100010101100111100010010000101010111100110111101111000100010001

./hex2bin.sed
0x123 0x1 0xf 41f 0x0
000100100011000111110100000111110000
</pre>


bin2hex.sed - converts Binary to Hexadecimal. Spaces and tabs are ignored.

<pre>
./bin2hex.sed 
111111111110101000001111100011001000100000100100010010101010101111011010101011010
1ffd41f1910489557b55a

./bin2hex.sed
100100100100 0010 11010                10100 111001            101
49216a9cd
</pre>
