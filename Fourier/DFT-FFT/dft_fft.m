%% DFT-FFT Frequency Spectrum

clear; clc;
close all;

fs = 1000;
T = 1/fs;

t = 0:T:1-T;

f1 = 50;
f2 = 120;

x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t);

N = length(x);

X = fft(x);

P2 = abs(X/N);
P1 = P2(1:N/2+1);

P1(2:end-1) = 2*P1(2:end-1);

f = fs*(0:N/2)/N;

subplot(2,1,1);
plot(t,x);
xlabel('Time [s]');
ylabel('Amplitude');
title('Time-Domain Signal');
xlim([0 0.1]);
grid on;

subplot(2,1,2);
stem(f,P1);
xlabel('Frequency [Hz]');
ylabel('Magnitude');
title('Single-Sided Amplitude Spectrum');
xlim([0 200]);
grid on;