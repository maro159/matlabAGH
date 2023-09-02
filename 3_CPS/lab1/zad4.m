clc; clear; close all;

dt=1e-3;
t = -1:dt:5;

A = 2;
f0 = 2;
t0 = 0;
T = 1/f0;
okno1 = my_pi((t-2*T)/(4*T));
syg1 = sin(2*pi*f0*(t-t0)) .* okno1;

A = 4;
f0 = 3;
t0 = 1;
T = 1/f0;
okno2 = my_pi((t-1-2.5*T)/(5*T));
syg2 = cos(2*pi*f0*(t-t0)) .* okno2;

subplot(2,1,1)
plot(t,syg1)
subplot(2,1,2)
plot(t,syg2)
