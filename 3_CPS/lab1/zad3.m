clc; clear; close all;

dt = 1e-3;
t = 0:dt:11;

a = 3; % skala
b = 3; % przesuniecie 
A = 2.5; % amplituda

s = my_pi((t-3)/4);
s = s + 2*my_tri((t-2));
s = s + my_pi(t-4.5);



s2 = my_pi((t-6)/2);
s2 = s2 + my_tri((t-5)/2) .* my_pi((t-4)/2);
s2 = s2 + my_tri((t-7)/3) .* my_pi((t-8.5)/3);

plot(t,s);
plot(t,s2)