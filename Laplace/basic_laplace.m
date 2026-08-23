%% Basic Laplace Transform

clear; clc;

syms t s

x1 = exp(-2*t);
x2 = t;
x3 = sin(3*t);

X1 = laplace(x1,t,s);
X2 = laplace(x2,t,s);
X3 = laplace(x3,t,s);

disp('X1(s) =')
pretty(X1)

disp('X2(s) =')
pretty(X2)

disp('X3(s) =')
pretty(X3)