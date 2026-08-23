%% Inverse Laplace Transform

clear; clc;

syms t s

X1 = 1/(s + 2);
X2 = 1/s^2;
X3 = 3/(s^2 + 9);

x1 = ilaplace(X1,s,t);
x2 = ilaplace(X2,s,t);
x3 = ilaplace(X3,s,t);

disp('X1(s) = 1/(s+2)  -->  x1(t) =')
pretty(x1)

disp('X2(s) = 1/s^2  -->  x2(t) =')
pretty(x2)

disp('X3(s) = 3/(s^2+9)  -->  x3(t) =')
pretty(x3)