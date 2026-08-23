clear; clc;
close all;

n=0:20;
omega=pi/10;
A=5;
phi=0;
signal=A*sin(omega*n+phi);
stem(n,signal);

xlabel('Sample Index n');
ylabel('Amplitude');
title('DT Sinusoidal Signal');
grid on;