clc; clear; close all;
x=linspace(-pi, pi, 1000);
y=pi-x;


N = 1000;
yf = 2*pi/2;
for n=1:N
f = ((-1)^n)*(-2)/n;
yf = yf + f.* sin(n*x);
end
figure(1);
plot(x,y,'red'); grid on; hold on;
plot(x,yf,'blue');
