%% Z-Plane Pole-Zero Map

clear; clc;
close all;

num = [1];
den = [1 -0.5];

H = tf(num,den,1);

disp('Transfer Function H(z) =')
H

disp('Poles =')
pole(H)

disp('Zeros =')
zero(H)

figure;
pzmap(H);
grid on;
title('Pole-Zero Map in the z-Domain');

xlim([-1.5 1.5]);
ylim([-1.5 1.5]);