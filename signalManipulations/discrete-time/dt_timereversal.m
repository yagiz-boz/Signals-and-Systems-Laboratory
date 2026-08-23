%% DT Time Reversal

clear; clc;
close all;

A = 5;
omega = pi/10;
phi = 0;

n = -20:20;

signal_original = A*sin(omega*n + phi);
signal_reversed = A*sin(omega*(-n) + phi);

subplot(2,1,1);
stem(n,signal_original);
xlabel('Sample Index n');
ylabel('Amplitude');
title('Original Signal x[n]');
grid on;

subplot(2,1,2);
stem(n,signal_reversed);
xlabel('Sample Index n');
ylabel('Amplitude');
title('Time-Reversed Signal x[-n]');
grid on;