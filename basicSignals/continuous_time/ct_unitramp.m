%% CT Unit Ramp

t=linspace(-5,5,1000);
signal=t.*double(t>=0);
plot(t,signal,'r');
xlabel('Time (s)');
ylabel('Amplitude');
title('CT Unit Ramp');
grid on;