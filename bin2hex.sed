#!/bin/sed -f

# sanitize input
/^[01 	]\+$/! {
	i\
	ERROR: WRONG INPUT DATA
	d
	q
}
s/[ 	]//g

# dodaj na koñcu wynik hex (pusty string)
s/$/\n/
h

:LOOP
# Wy³uskaj 4 ostatnie bity
s/^\(.*\)\(....\)\n\(.*\)$/\2;0000=00001=10010=20011=30100=40101=50110=60111=71000=81001=91010=a1011=b1100=c1101=d1110=e1111=f/

# Zamieñ bin2hex
s/\(....\);[^;]*\1=\(.\).*/\2/g

# Dopisz wynik do holda
H
# Pobierz ca³o¶æ i przepisz wynik 
g
s/^\(.*\)....\n\(.*\)\n\(.*\)/\1\n\3\2/
s/^\(...\)\n/0\1\n/
s/^\(..\)\n/00\1\n/
s/^\(.\)\n/000\1\n/


/^.\{0\}\n/ {
	s/^\n\(.*\)/\1/g
	q
}

h
b LOOP
