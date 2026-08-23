%% DTFS of a Periodic Sequence

clear; clc;
close all;

x = [1 2 1 0];

N = length(x);
n = 0:N-1;
k = 0:N-1;

C = zeros(1,N);

for m = 1:N
    C(m) = (1/N) * sum(x .* exp(-1j*2*pi*k(m)*n/N));
end

subplot(3,1,1);
stem(n,x);
xlabel('Sample Index n');
ylabel('Amplitude');
title('One Period of x[n]');
grid on;

subplot(3,1,2);
stem(k,abs(C));
xlabel('Harmonic Index k');
ylabel('|C_k|');
title('DTFS Magnitude Coefficients');
grid on;

subplot(3,1,3);
stem(k,angle(C));
xlabel('Harmonic Index k');
ylabel('Phase [rad]');
title('DTFS Phase Coefficients');
grid on;