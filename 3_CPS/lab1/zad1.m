clc; clear; close all;

dt = 1e-3;
t = -3:dt:7;

s1 = my_pi(t);
s2 = my_tri(t);

figure(1)
subplot(2,1,1)
plot(t,s1);
subplot(2,1,2)
plot(t,s2);