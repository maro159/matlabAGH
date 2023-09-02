clc; clear; close all;

fs = 100;
Ts = 1/fs;

f1 = @(t) (1/20) * sinc((fs/20)*(t-0.25));
f2 = @(t) (1/5) * sinc((fs/5)*(t-0.25));

K = 51;

t_filtr = 0:Ts:(K-1)*Ts;

h1 = f1(t_filtr);
h2 = f2(t_filtr);

b = roots(h1)
zplane(b,1);
