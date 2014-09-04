#!/bin/sed -f

# sanitize input
/^[01 	]\+$/! {
	i\
	ERROR: WRONG INPUT DATA
	d
	q
}
s/[ 	]//g

# Add place for result (after new line)
s/$/\n/


:LOOP
# prepend with 0s if too short
s/^\(.\{1,3\}\)\n/000\1\n/

# remember in hold
h

# grab 4 bits and append the replace pattern
s/^\(.*\)\(....\)\n\(.*\)$/\2;0000=00001=10010=20011=30100=40101=50110=60111=71000=81001=91010=a1011=b1100=c1101=d1110=e1111=f/

# bin2hex
s/\(....\);[^;]*\1=\(.\).*/\2/

# Push the result to Hold
H
# grab the result and rewrite it
g
s/^\(.*\)....\n\(.*\)\n\(.*\)/\1\n\3\2/

# remove excessive 0s
s/^0\{1,3\}\n/\n/


# quit if nothing left to process, rewrite to print the sum
/^\n/ {
	s/^\n\(.*\)/\1/
	q
}

b LOOP
