%% CT Convolution

clear; clc;
close all;

dt = 0.001;
t = 0:dt:5;

x = exp(-t);
h = exp(-2*t);

y = conv(x,h)*dt;

t_y = 0:dt:(length(y)-1)*dt;

subplot(3,1,1);
plot(t,x,'b');
xlabel('Time [s]');
ylabel('Amplitude');
title('Signal x(t) = e^{-t}u(t)');
grid on;

subplot(3,1,2);
plot(t,h,'r');
xlabel('Time [s]');
ylabel('Amplitude');
title('Signal h(t) = e^{-2t}u(t)');
grid on;

subplot(3,1,3);
plot(t_y,y,'k');
xlabel('Time [s]');
ylabel('Amplitude');
title('Convolution y(t) = x(t) * h(t)');
grid on;