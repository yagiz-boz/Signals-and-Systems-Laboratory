%% CTFT Time Shifting Property

clear; clc;
close all;

syms t w

a = 2;
t0 = 1;

x = exp(-a*t)*heaviside(t);

x_shifted = subs(x, t, t-t0);

X = fourier(x, t, w);
X_shifted = fourier(x_shifted, t, w);

subplot(3,1,1);
fplot(x, [0 5], 'b');
hold on;
fplot(x_shifted, [0 5], 'r');
xlabel('Time [s]');
ylabel('Amplitude');
title('Original and Time-Shifted Signals');
legend('x(t)', 'x(t-t_0)');
grid on;

subplot(3,1,2);
fplot(abs(X), [-10 10], 'b');
hold on;
fplot(abs(X_shifted), [-10 10], 'r--');
xlabel('Angular Frequency [rad/s]');
ylabel('Magnitude');
title('Magnitude Spectra');
legend('|X(\omega)|', '|X_{shifted}(\omega)|');
grid on;

subplot(3,1,3);
fplot(angle(X), [-10 10], 'b');
hold on;
fplot(angle(X_shifted), [-10 10], 'r');
xlabel('Angular Frequency [rad/s]');
ylabel('Phase [rad]');
title('Phase Spectra');
legend('\angleX(\omega)', '\angleX_{shifted}(\omega)');
grid on;