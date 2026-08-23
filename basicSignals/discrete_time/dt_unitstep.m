%% DT Unit Step Signal

clear; clc;
close all;

n = -10:10;

signal = double(n >= 0);

stem(n,signal);

xlabel('Sample Index n');
ylabel('Amplitude');
title('DT Unit Step Signal');

grid on;