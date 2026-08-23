%% Inverse Z-Transform

clear; clc;

syms n z

X = z/(z - 0.5);

x = iztrans(X,z,n);

disp('X(z) = z/(z-0.5)  -->  x[n] =')
disp(x)