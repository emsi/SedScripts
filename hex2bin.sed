#!/bin/sed -f

# sanitize input
/^[0-9a-fA-Fx 	]\+$/! {
	i\
	ERROR: WRONG INPUT DATA
	d
	q
}
s/0x//g
s/[ 	]//g

# dodaj na koñcu wynik bin (pusty string)
s/$/\n/
h

:LOOP
# Wy³uskaj ostatni± cyfrê i dodaj pattern
s/^\(.*\)\(.\)\n\(.*\)$/\2;0=00001=00012=00103=00114=01005=01016=01107=01118=10009=1001a=1010b=1011c=1100d=1101e=1110f=1111A=1010B=1011C=1100D=1101E=1110F=1111/

# Zamieñ bin2hex
s/\(.\);[^;]*\1=\(....\).*/\2/g

# Dopisz wynik do holda
H
# Pobierz ca³o¶æ i przepisz wynik 
g
s/^\(.*\).\n\(.*\)\n\(.*\)/\1\n\3\2/

/^.\{0\}\n/ {
	s/^\n\(.*\)/\1/g
	q
}

h
b LOOP
