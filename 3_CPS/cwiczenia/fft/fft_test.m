clc; clear;

SHIFT = 0;

f0 = 200;
T0 = 1/f0;

% fp = N*f0;
fp = 2000;
N = 20;
N_cont = 100*N;

Tp = 1/fp;
t = 0:Tp:(N-1)*Tp;
ts = 0:1:N-1;
ts_cont = 0:1:N_cont-1;
fs = ts*(fp/N);
fs_cont = ts_cont*(fp/N_cont);

x = sin(2*pi*f0*t) + sin(2*pi*2*f0*t);
% x = x .* hamming(length(x)).';
zeros_to_add = length(fs_cont) - length(x);
x_zero_pad = [x,zeros(1,zeros_to_add)];
Y = fft(x);
Y = (Y/length(x));
Y_cont = fft(x_zero_pad);
Y_cont = (Y_cont/length(x));

if SHIFT == 1
    ts = ts - floor(N/2);
    ts_cont = ts_cont - floor(N_cont/2);
    fs = ts*(fp/N);
    fs_cont = ts_cont*(fp/N_cont);
    Y = fftshift(Y);
    Y_cont = fftshift(Y_cont);
end

figure(1)
subplot(4,1,1)
stem(ts,x);
subplot(4,1,2);
stem(ts,abs(Y));
subplot(4,1,3)
stem(ts,real(Y));
subplot(4,1,4)
stem(ts,imag(Y));

figure(2)
subplot(4,1,1)
stem(t,x);
subplot(4,1,2);
stem(fs,abs(Y)); hold on;
plot(fs_cont, abs(Y_cont)); hold off;
subplot(4,1,3)
stem(fs,real(Y)); hold on;
plot(fs_cont, real(Y_cont)); hold off;
subplot(4,1,4)
stem(fs,imag(Y)); hold on;
plot(fs_cont, imag(Y_cont)); hold off;
