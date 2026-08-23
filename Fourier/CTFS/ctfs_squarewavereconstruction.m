%% CTFS - Square Wave Reconstruction

clear; clc;
close all;

f0 = 1;
w0 = 2*pi*f0;

t = linspace(-2,2,2000);

harmonic_counts = [1 3 5 15];

for i = 1:length(harmonic_counts)

    N = harmonic_counts(i);
    x = zeros(size(t));

    for k = 1:2:(2*N-1)
        x = x + (1/k)*sin(k*w0*t);
    end

    x = (4/pi)*x;

    subplot(4,1,i);
    plot(t,x);
    xlabel('Time [s]');
    ylabel('Amplitude');
    title(['Square Wave Approximation - ', num2str(N), ' Harmonics']);
    ylim([-1.5 1.5]);
    grid on;

end