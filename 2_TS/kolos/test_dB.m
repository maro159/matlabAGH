clc; clear; close all;

dx1 = 1e-3;
x1 = 0:dx1:1-dx1;

dx2 = 1;
x2 = 1:1:1e3;

dx3 = 1e3;
x3 = 1e3:dx3:1e6-dx3;

db1 = 20*log10(x1);
db2 = 20*log10(x2);
db3 = 20*log10(x3);

subplot(3,1,1);
plot(x1,db1);

subplot(3,1,2);
plot(x2,db2);

subplot(3,1,3);
plot(x3,db3);

