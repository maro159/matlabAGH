clc; clear; close all;

dt = 1e-3;
t = -3:dt:7;

a = 3;
b = 3;
A = 2.5;

s1 = A*my_pi((t-b)/a);
s2 = A*my_tri((t-b)/a);

figure(1)
subplot(2,1,1)
plot(t,s1);
subplot(2,1,2)
plot(t,s2);