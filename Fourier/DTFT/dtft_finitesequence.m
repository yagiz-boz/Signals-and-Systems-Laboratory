%% DTFT of a Finite Sequence

clear; clc;
close all;

x = [1 2 1];

[X,w] = freqz(x,1,1024,'whole');

n = 0:length(x)-1;

subplot(3,1,1);
stem(n,x);
xlabel('Sample Index n');
ylabel('Amplitude');
title('Discrete-Time Signal x[n]');
grid on;

subplot(3,1,2);
plot(w,abs(X));
xlabel('Angular Frequency [rad/sample]');
ylabel('|X(e^{j\omega})|');
title('Magnitude Spectrum');
grid on;

subplot(3,1,3);
plot(w,angle(X));
xlabel('Angular Frequency [rad/sample]');
ylabel('Phase [rad]');
title('Phase Spectrum');
grid on;