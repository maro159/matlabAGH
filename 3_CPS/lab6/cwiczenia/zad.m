clc; clear; close all;
f0 = 300;
f1 = 500;
fs = 4000;
N = 1000;
Ts = 1/fs;

t=0:Ts:Ts*(N-1);
t_cont = 0:1e-6:t(end);
f = (0:1:N-1).*fs/N;

ft = sin(2*pi*f0*t)+sin(2*pi*f1*t);
ft_cont = sin(2*pi*f0*t_cont)+sin(2*pi*f1*t_cont);

ft2 = ft .* hamming(N).';
ft2_cont =  sin(2*pi*f0*t_cont) .* hamming(length(t_cont)).';

integral_hamming = trapz((hamming(length(t_cont)).'))/length(t_cont);

ff = fft(ft)/N;
ff2  = fft(ft2)/N;


figure(1)
stem(f, abs(ff));grid on;

figure(2)
stem(f,abs(ff2)); grid on;

sum(abs(ff2))
sum(abs(ff))
% stem(t,ft2); hold on;
% plot(t_cont, ft2_cont);
% plot(t_cont, hamming(length(t_cont)).' , 'g');