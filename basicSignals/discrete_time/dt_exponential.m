%% DT Exponential Signal

clear; clc;
close all;

n = 0:20;

A = 5;
a = 0.8;

signal=A*a.^n;

stem(n,signal);

xlabel('Sample Index n');
ylabel('Amplitude');
title('DT Exponential Signal');
grid on;