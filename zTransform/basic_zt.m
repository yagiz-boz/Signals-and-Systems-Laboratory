%% Basic Z-Transform

clear; clc;

syms n z

a = 0.5;

x = a^n;

X = ztrans(x,n,z);

disp('x[n] = (0.5)^n  -->  X(z) =')
pretty(X)