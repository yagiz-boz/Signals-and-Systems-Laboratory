%% DT Amplitude Scaling

clear; clc;
close all;

A = 5;
omega = pi/10;
phi = 0;

n = 0:20;

signal_original = A*sin(omega*n + phi);

signal_scaled1 = 3*signal_original;
signal_scaled2 = signal_original/3;

subplot(3,1,1);
stem(n,signal_original);
xlabel('Sample Index n');
ylabel('Amplitude');
title('Original Signal x[n]');
grid on;

subplot(3,1,2);
stem(n,signal_scaled1);
xlabel('Sample Index n');
ylabel('Amplitude');
title('Amplitude-Scaled Signal 3x[n]');
grid on;

subplot(3,1,3);
stem(n,signal_scaled2);
xlabel('Sample Index n');
ylabel('Amplitude');
title('Amplitude-Scaled Signal x[n]/3');
grid on;