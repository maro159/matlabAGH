clc; clear; close all;
%rand1=rand();
%rand2=rand();

x1 = rand() + j*rand();
x2 = - rand() + j*rand();
x3 = - rand() - j*rand();
x4 = rand() - j*rand();

x = x1

X = [real(x1),real(x2),real(x3),real(x4)]
Y = [imag(x1),imag(x2),imag(x3),imag(x4)]
figure(1),hold on, grid on
plot(X,Y,'o')

