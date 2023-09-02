%zad domowe: wyliczyć błąd z macierzsy błędów punktowych
clc; clear; close all;

x=-10:0.1:10;

c = cos(x);
s = sin(x);

c_euler = (exp(j*x) + exp(-j*x))/2;
s_euler = (exp(j*x) - exp(-j*x))/(2*j);

s_blad = ((s-s_euler)./s);
c_blad = ((c-c_euler)./c);


[c;c_euler]
c_blad,
[s;s_euler]
s_blad,
figure(1)
subplot(2,1,1),hold on, grid on
plot(x,s,'b')
plot(x,s_euler,'r')
subplot(2,1,2),hold on, grid on
plot(x,c,'b')
plot(x,c_euler,'r')

