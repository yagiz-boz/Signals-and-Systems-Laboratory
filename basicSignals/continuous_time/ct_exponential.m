%% CT Exponential Signal

clear; clc;
close all;

A = 4;
a = -2;

t = linspace(0,5,500);

signal = A * exp(a*t);

plot(t,signal,"r");

xlabel("Time [s]");
ylabel("Amplitude [V]");
title("Continuous-Time Exponential Signal");

grid on;