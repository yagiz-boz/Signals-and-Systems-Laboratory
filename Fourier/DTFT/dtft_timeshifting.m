%% DTFT Time Shifting Property

clear; clc;
close all;

x = [1 2 1];
n0 = 3;

x_shifted = [zeros(1,n0) x];

[X,w] = freqz(x,1,1024,'whole');
[X_shifted,~] = freqz(x_shifted,1,1024,'whole');

subplot(3,1,1);
stem(0:length(x)-1,x,'b');
hold on;
stem(0:length(x_shifted)-1,x_shifted,'r');
xlabel('Sample Index n');
ylabel('Amplitude');
title('Original and Time-Shifted Signals');
legend('x[n]','x[n-3]');
grid on;

subplot(3,1,2);
plot(w,abs(X),'b');
hold on;
plot(w,abs(X_shifted),'r--');
xlabel('Angular Frequency [rad/sample]');
ylabel('Magnitude');
title('Magnitude Spectra');
legend('|X(e^{j\omega})|','|X_{shifted}(e^{j\omega})|');
grid on;

subplot(3,1,3);
plot(w,angle(X),'b');
hold on;
plot(w,angle(X_shifted),'r');
xlabel('Angular Frequency [rad/sample]');
ylabel('Phase [rad]');
title('Phase Spectra');
legend('Original','Shifted');
grid on;