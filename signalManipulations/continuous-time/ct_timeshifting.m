%% CT Time Shifting

clear; clc;
close all;

A = 220;
phi = 0;
f = 50;
T = 1/f;

phase_shift = pi/2;
t0 = phase_shift/(2*pi*f);

t = linspace(0,T,128);

signal_original = A*sin(2*pi*f*t + phi);
signal_shifted = A*sin(2*pi*f*(t-t0) + phi);

subplot(2,1,1);
plot(t,signal_original,'b');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('Original Signal x(t)');
grid on;

subplot(2,1,2);
plot(t,signal_shifted,'r');
xlabel('Time [s]');
ylabel('Amplitude [V]');
title('Time-Shifted Signal x(t-t_0)');
grid on;