clc; clear; close all;

clc; clear; close all;

fs = 100;
Ts = 1/fs;

s1 = @(t) my_pi((t-1)/1.01);
f1 = @(t) (1/20) * sinc((fs/20)*(t-0.25));

K = 51;
N1 = 200;

t1 = 0:Ts:(N1-1)*Ts;
t_filtr = 0:Ts:(K-1)*Ts;

x1 = s1(t1);
x1 = [ 0 0 1 0 0 0];
h1 = f1(t_filtr);

c1 = conv(x1,h1);
my_c1 = my_conv(x1,h1);

plot(h1); hold on;
stem(my_c1);