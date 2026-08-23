%% CT Unit Impulse (Delta Dirac) Approx
clear; clc;
close all;

t = linspace(-1,1,10000);

width = 0.02;

signal = double(abs(t) <= width/2) / width;

plot(t,signal,'r');

xlabel('Time (s)');
ylabel('Amplitude');
title('CT Unit Impulse Approximation');

grid on;