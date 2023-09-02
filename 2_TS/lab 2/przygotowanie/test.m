clc; clear; close all;
f=0:0.01:10;
a=10^6;
X=a*sinc(f*a);

plot(f,X)