clc; clear;

SHIFT = 0;

% N = 32;
f0 = 200;
T0 = 1/f0;

% fp = N*f0;
fp = 2000;
N = 100;

Tp = 1/fp;
t = 0:Tp:(N-1)*Tp;
ts = 0:1:N-1;
fs = ts*(fp/N);

x = sin(2*pi*f0*t) + sin(2*pi*2*f0*t);
x = [x,zeros(1,1000)];
Y = fft(x);
Y = (Y/length(x));

if SHIFT == 1
    ts = ts - floor(N/2);
    fs = ts*(fp/N);
    Y = fftshift(Y);
end

% figure(1)
% subplot(4,1,1)
% stem(ts,x);
% subplot(4,1,2);
% stem(ts,abs(Y));
% subplot(4,1,3)
% stem(ts,real(Y));
% subplot(4,1,4)
% stem(ts,imag(Y));

% figure(2)
% subplot(4,1,1)
% stem(t,x);
% subplot(4,1,2);
% stem(fs,abs(Y));
% subplot(4,1,3)
% stem(fs,real(Y));
% subplot(4,1,4)
% stem(fs,imag(Y));

figure(2)
subplot(4,1,1)
stem(x);
subplot(4,1,2);
stem(abs(Y));
subplot(4,1,3)
stem(real(Y));
subplot(4,1,4)
stem(imag(Y));