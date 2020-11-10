%{
Program ID:     Project 2: Discrete Convolution
Subject:        BMEN 3402.002
Date:           2020-02-21
Author:         Karel Lirazan


Program Purpose:
This program aims to compute the output of a system that filters noisy
signals as well as compute the convolution of the impluse resepnse and the
noisy signal and comparing the two.

Program Design Description:
This program was designed and compiled
using MATLAB R2019b

Inputs: "ecgsig1" and "ecgsig2" provided in the 
"BMEN3402_Project2.mat" file; Number of samples of
the input signal, N; 

Outputs: Subplots of the clean ECG signal, the noisy ECG signal,
the output signal, y[n], when the input signal is the noisy ECG signal,
the convoultion of the noisy ECG signal and the impulse response of the
system.
%}

% Define Variables

% Number of Samples of the inout signal
N = input('Enter a value for N:');

% time = 4 s
t = time;

% Let a[n] be the Clean ECG Signal
a = ecgsig1;

% Let b[n] be the Noisy ECG Signal
b = ecgsig2;

figure(1)

% Load Clean ECG signal
subplot(2,2,1)
plot(t,a,'-');
ylim([-1,1]);
xlabel('Time (s)');
title('Clean ECG Signal, a[n]')

% Load Noisy ECG signal
subplot(2,2,2)
plot(t,b,'r');
ylim([-1,1]);
xlabel('Time (s)');
title('Noisy ECG Signal, b[n]')

% Define the output y[n] when the input is the noisy signal
x = 1:1:400;
y = zeros(size(x));
for c = 1 : length(x)
    if c >= N
    y(c) = (1/N)*sum(x(c:-1:c-N+1));
    end
end


% Define the impulse response h[n]
h = ones(1,N)/N;

% Convolution of the h[n] and b[n]
hb = conv(b,h,'same');

% Plot of the Convolution
subplot(2,2,3)
plot(t,hb,'m');
ylim([-1,1]);
xlabel('Time (s)');
title('Convolution of h[n] and b[n]')
