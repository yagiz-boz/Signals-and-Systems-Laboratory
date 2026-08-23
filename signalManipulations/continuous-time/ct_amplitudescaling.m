%% CT Amplitude Scaling

clear; clc;
close all;

A = 220;
phi = 0;
f = 50;
T = 1/f;

t = linspace(0,T,128);

signal_original = A*sin(2*pi*f*t + phi);

signal_scaled1 = 3*signal_original;
signal_scaled2 = signal_original/3;

subplot(3,1,1);
plot(t,signal_original,'b');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('Original Signal x(t)');
grid on;

subplot(3,1,2);
plot(t,signal_scaled1,'r');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('Amplitude-Scaled Signal 3x(t)');
grid on;

subplot(3,1,3);
plot(t,signal_scaled2,'g');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('Amplitude-Scaled Signal x(t)/3');
grid on;