%% DT Time Shifting

clear; clc;
close all;

A = 5;
omega = pi/10;
phi = 0;

n = 0:20;
n0 = 4;

signal_original = A*sin(omega*n + phi);
signal_shifted = A*sin(omega*(n-n0) + phi);

subplot(2,1,1);
stem(n,signal_original);
xlabel('Sample Index n');
ylabel('Amplitude');
title('Original Signal x[n]');
grid on;

subplot(2,1,2);
stem(n,signal_shifted);
xlabel('Sample Index n');
ylabel('Amplitude');
title('Time-Shifted Signal x[n-n_0]');
grid on;