clc; clear; close all;

fs = 100;
Ts = 1/fs;

s1 = @(t) my_pi((t-1)/1.01);
s2 = @(t) my_pi((t-1)/1.01);
s3 = @(t) my_pi((t-2)/3) .* (sin(6*pi*t)+sin(86*pi*t)); 

f1 = @(t) (1/20) * sinc((fs/20)*(t-0.25));
f2 = @(t) (1/5) * sinc((fs/5)*(t-0.25));

K = 51;
N1 = 200;
N2 = 400;

t1 = 0:Ts:(N1-1)*Ts;
t2 = 0:Ts:(N2-1)*Ts;
t_filtr = 0:Ts:(K-1)*Ts;

x1 = s1(t1);
x2 = s2(t1);
x3 = s3(t2);

h1 = f1(t_filtr);
h2 = f2(t_filtr);

h = h2;

H2 = fft(h);
f = 0:1:K-1;
f = f * (fs/K);

K_pad = K + 10000;
h2_pad = [h, zeros(1,K_pad-K)];
f_pad = 0:1:K_pad-1;
f_pad = f_pad * (fs/K_pad)
H2_pad = fft(h2_pad)

stem(f,abs(H2)); hold on;
plot(f_pad,abs(H2_pad));