%%Continuous time sinusoidal signal
clear; clc;
close all;
A=4;
f=50;
phi=0;
t=linspace(0,1/f,100); %1/f=T
signal = A * sin(2 * pi * f * t + phi);
plot(t,signal,"r");
xlabel("Time[s]");
ylabel("Amplitude[V]");
title("Continuous Time Sinusoidal Signal");
grid on;