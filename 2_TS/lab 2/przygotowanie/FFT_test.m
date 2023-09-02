% m-plik skryptowy: CFT_test.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Opracowanie: M.Pawłowski 08.11.2022


clc; clear; close all;
t=-1:0.0001:1;
Fs=10000;
L=length(t);

f=10;
x=sin(2*pi*f*t)+cos(2*pi*f*4*t);

Y=fft(x);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

subplot(2,1,1);
plot(t,x)
subplot(2,1,2);
plot(f,P1)
xlim([0,100]);
