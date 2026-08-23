%% Transfer Function

clear; clc;
close all;

num = [1];
den = [1 2 5];

H = tf(num,den);

disp('Transfer Function H(s) =')
H

disp('Poles =')
pole(H)

disp('Zeros =')
zero(H)

figure;
pzmap(H);
grid on;
title('Pole-Zero Map in the s-Domain');

xlim([-4 2]);
ylim([-4 4]);