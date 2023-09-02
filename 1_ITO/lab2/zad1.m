%porównanie sposobów sprawdzania fazy
%
clc; clear; close all;
x =  rand() - j*rand();

imx = imag(x);
rex = real(x);

a = atan(imx/rex);
b = atan2(imx,rex);
c = angle(x);

M=abs(x);

a2 = M*exp(j*a);
b2 = M*exp(j*b);
c2 = M*exp(j*c);