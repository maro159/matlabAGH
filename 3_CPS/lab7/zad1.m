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

c1 = conv(x1,h1);
c2 = conv(x2,h2);
c3 = conv(x3,h2);

my_c1 = my_conv(x1,h1);
my_c2 = my_conv(x2,h2);
my_c3 = my_conv(x3,h2);

cc1 = cconv(x1,h1);
cc2 = cconv(x2,h2);
cc3 = cconv(x3,h2);

my_cc1 = my_cconv(x1,h1);
my_cc2 = my_cconv(x2,h2);
my_cc3 = my_cconv(x3,h2);

figure(1)
subplot(2,1,1)
stem(t_filtr, h1);
title("h1");
subplot(2,1,2)
stem(t_filtr, h2);
title("h2");

figure(2)
subplot(3,1,1)
plot(t1,x1);
title("x1");
subplot(3,1,2)
plot(t1,x2);
title("x2");
subplot(3,1,3)
plot(t2,x3);
title("x3");

figure(3)
subplot(3,1,1)
plot(c1); hold on;
plot(my_c1); hold off;
title("x1 * h1");
subplot(3,1,2)
plot(c2); hold on;
plot(my_c2); hold off;
title("x2 * h2");
subplot(3,1,3)
plot(c3); hold on;
plot(my_c3); hold off;
title("x3 * h2");

figure(4)
subplot(3,1,1)
plot(cc1); hold on;
plot(my_cc1); hold off;
title("x1 * h1 (circular)");
subplot(3,1,2)
plot(cc2); hold on;
plot(my_cc2); hold off;
title("x2 * h2 (circular)");
subplot(3,1,3)
plot(cc3); hold on;
plot(my_cc3); hold off;
title("x3 * h2 (circular)");

max_blad_c1 = max(abs(my_c1-c1))
max_blad_c2 = max(abs(my_c2-c2))
max_blad_c3 = max(abs(my_c3-c3))

max_blad_cc1 = max(abs(my_c1-c1))
max_blad_cc2 = max(abs(my_c2-c2))
max_blad_cc3 = max(abs(my_c3-c3))
