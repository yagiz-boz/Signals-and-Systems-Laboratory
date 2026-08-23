%% CT Unit Step

clear; clc;
close all;

t=linspace(-5,5,1000);
signal=double(t>=0);
plot(t,signal,LineWidth=1.5 ...
    );
xlabel('Time (s)');
ylabel('Amplitude');
title('CT Unit Step Function');
grid on;
