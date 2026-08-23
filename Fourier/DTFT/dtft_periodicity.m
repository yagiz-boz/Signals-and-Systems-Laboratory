%% DTFT Periodicity

clear; clc;
close all;

x = [1 2 1];

[X,w] = freqz(x,1,1024,'whole');

w_periodic = [w-2*pi; w; w+2*pi];
X_periodic = [X; X; X];

subplot(2,1,1);
plot(w_periodic,abs(X_periodic));
xlabel('Angular Frequency [rad/sample]');
ylabel('|X(e^{j\omega})|');
title('DTFT Magnitude - 2\pi Periodicity');
xlim([-2*pi 4*pi]);
xticks([-2*pi -pi 0 pi 2*pi 3*pi 4*pi]);
xticklabels({'-2\pi','-\pi','0','\pi','2\pi','3\pi','4\pi'});
grid on;

subplot(2,1,2);
plot(w_periodic,angle(X_periodic));
xlabel('Angular Frequency [rad/sample]');
ylabel('Phase [rad]');
title('DTFT Phase - 2\pi Periodicity');
xlim([-2*pi 4*pi]);
xticks([-2*pi -pi 0 pi 2*pi 3*pi 4*pi]);
xticklabels({'-2\pi','-\pi','0','\pi','2\pi','3\pi','4\pi'});
grid on;