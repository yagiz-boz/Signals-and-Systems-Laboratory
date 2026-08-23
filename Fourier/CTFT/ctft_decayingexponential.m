%% CTFT of a Decaying Exponential

clear; clc;
close all;

syms t w
a = 2;

x = exp(-a*t)*heaviside(t);

X = fourier(x,t,w);

subplot(3,1,1);
fplot(x,[0 5]);
xlabel('Time [s]');
ylabel('Amplitude');
title('x(t) = e^{-at}u(t)');
grid on;

subplot(3,1,2);
fplot(abs(X),[-10 10]);
xlabel('Angular Frequency [rad/s]');
ylabel('|X(\omega)|');
title('Magnitude Spectrum');
ylim([0 0.7]);
grid on;

subplot(3,1,3);
fplot(angle(X),[-10 10]);
xlabel('Angular Frequency [rad/s]');
ylabel('Phase [rad]');
title('Phase Spectrum');
grid on;