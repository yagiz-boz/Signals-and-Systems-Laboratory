%% CT Time Reversal

clear; clc;
close all;

A = 220;
phi = 0;
f = 50;
T = 1/f;

t = linspace(-T,T,256);

signal_original = A*sin(2*pi*f*t + phi);
signal_reversed = A*sin(2*pi*f*(-t) + phi);

subplot(2,1,1);
plot(t,signal_original,'b');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('Original Signal x(t)');
grid on;

subplot(2,1,2);
plot(t,signal_reversed,'r');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('Time-Reversed Signal x(-t)');
grid on;