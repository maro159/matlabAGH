% m-plik skryptowy: ts_demo_05.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Opracowanie: M.Pawłowski 19.10.2022
%

clc; clear; close all;

dt=1/48000;    t=0:dt:8;   Nt=length(t);       % pseudo-ciagla os czasu;

a1 = xpi(t,5/2,5);
a2 = xpi(t,13/2,3);

x1 = cos(2*pi*400*t);
x2 = cos(2*pi*800*t);
x = a1.*x1 + a2.*x2;

plot(t,a1,'r.-'); hold on;
plot(t,a2,'b.-')

% x=x/max(abs(x));                    % normalizacja sygnalu przed wyslaniem do karty dzwiekowej; 
% fp=1/dt;   sound(x,fp);             % odsluchanie (porownaj sound z soundsc);