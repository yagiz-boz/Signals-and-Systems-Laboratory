%% DT Unit Ramp Signal

clear; clc;
close all;

n = -10:10;

signal = n .* double(n >= 0);

stem(n,signal);

xlabel('Sample Index n');
ylabel('Amplitude');
title('DT Unit Ramp Signal');

grid on;