%% DT Convolution

clear; clc;
close all;

x = [1 2 1];
h = [1 1 1];

n_x = 0:length(x)-1;
n_h = 0:length(h)-1;

y = conv(x,h);

n_y = 0:length(y)-1;

subplot(3,1,1);
stem(n_x,x);
xlabel('Sample Index n');
ylabel('Amplitude');
title('Signal x[n]');
grid on;

subplot(3,1,2);
stem(n_h,h);
xlabel('Sample Index n');
ylabel('Amplitude');
title('Signal h[n]');
grid on;

subplot(3,1,3);
stem(n_y,y);
xlabel('Sample Index n');
ylabel('Amplitude');
title('Convolution y[n] = x[n] * h[n]');
grid on;