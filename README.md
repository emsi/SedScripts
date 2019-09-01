SedScripts
==========

Varius sed scripts

Adders
=============

Occasionally you want to add two long numbers without falling into precision issues. Why not use sed for it?

**binAdder.sed** - arbitrary length binary full adder. Adds two binary numbers together.

<pre>
./binAdder.sed
1111110111
1
1111111000

./binAdder.sed
10
10001
10011

./binAdder.sed
0 1 1 0
0 0 0 1
111
</pre>

**decAdder.sed** - arbitrary length decimal full adder. Adds two decimal numbers together.

<pre>
./decAdder.sed
98765432111111111111111122222222222333333333444444455555567890
10000000000100002000030000401050060007007000088010901234567891
108765432111211113111141122623272282340340333532455356790135781

./decAdder.sed
99990
1234567890
1234667880

</pre>

Converters
=============

**hex2bin.sed**  - converts HEX to Binary. Most hex formats are accepted. '0x', spaces and tabs are ignored. Arbitrary lenght numbers can be processed (limited by memory).

<pre>
./hex2bin.sed 
1234567890abcdef111
0001001000110100010101100111100010010000101010111100110111101111000100010001

./hex2bin.sed
0x123 0x1 0xf 41f 0x0
000100100011000111110100000111110000
</pre>


**bin2hex.sed** - converts Binary to Hexadecimal. Spaces and tabs are ignored. Arbitrary lenght numbers can be processed (limited by memory).

<pre>
./bin2hex.sed 
111111111110101000001111100011001000100000100100010010101010101111011010101011010
1ffd41f1910489557b55a

./bin2hex.sed
100100100100 0010 11010                10100 111001            101
49216a9cd

./bin2hex.sed
0000 0000 1011 1101 1111 0100 1111 0000 0000
00bdf4f00
</pre>

Combine
=============

It's OK to combine all the tools the way you like :)

<pre>
(./hex2bin.sed ; ./hex2bin.sed ) | ./binAdder.sed | ./bin2hex.sed
ff
100
1ff
</pre>
