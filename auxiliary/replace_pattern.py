#!/usr/bin/env python3

import numpy as np

base = 16

print("Replace pattern for base {}.".format(base))

for c in range(2):
    for a in range(base):
        for b in range(base):
            summed = np.base_repr(a+b+c, base, 2)[-2:]
            S = summed[1]
            C_out = summed[0]
            A = np.base_repr(a, base)
            B = np.base_repr(b, base)
            C_in = np.base_repr(c, base)
            print('{}{}{}={}{}'.format(C_in, A, B, C_out, S), end='')

print()
