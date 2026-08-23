% %%CTFT of a Rectangular Pulse with two approaches

clear; clc;
close all;

syms t w

T = 2;

x = rectangularPulse(-T/2, T/2, t);

X = fourier(x, t, w);

subplot(2,1,1);
fplot(x, [-3 3]);
xlabel('Time [s]');
ylabel('Amplitude');
title('Rectangular Pulse x(t)');
grid on;

subplot(2,1,2);
fplot(abs(X), [-30 30]);
xlabel('Angular Frequency [rad/s]');
ylabel('|X(\omega)|');
title('Magnitude Spectrum |X(\omega)|');
ylim([0 2.2]);
grid on;

% 
% clear; clc;
% close all;
% T = 2;
% 
% t = linspace(-3,3,1000);
% x = double(abs(t) <= T/2);
% 
% f = linspace(-5,5,1000);
% 
% %X = T*sinc(f*T);
% 
% subplot(2,1,1);
% plot(t,x);
% xlabel('Time [s]');
% ylabel('Amplitude');
% title('Rectangular Pulse x(t)');
% grid on;
% 
% subplot(2,1,2);
% plot(f,abs(X));
% xlabel('Frequency [Hz]');
% ylabel('|X(f)|');
% title('Magnitude Spectrum |X(f)|');
% grid on;