clc; clear; close all;

fs = 3000;
Ts = 1/fs;
N = 15;
window = hamming(N).';

s = @(t,f0) sin(2*pi*f0*t);

t = 0:Ts:(N-1)*Ts;
x1 = s(t,600) .* window;
x2 = s(t,666) .* window;


f = 0:1:N-1;
f = f .* (fs/N);

X1 = fft(x1)/N;
X2 = fft(x2)/N;

X1(abs(X1)<1e-12) = 0;
X2(abs(X2)<1e-12) = 0;

disp("sum(abs(X1)):   " + sum(abs(X1)));
disp("sum(abs(X2)):   " + sum(abs(X2)));

subplot(2,2,1)
stem(f,abs(X1));
subplot(2,2,2)
stem(f,angle(X1));
subplot(2,2,3)
stem(f,abs(X2));
subplot(2,2,4)
stem(f,angle(X2));
