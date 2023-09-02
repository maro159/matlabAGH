% m-plik skryptowy: eksperyment_prezentacja_10_slajd_16.m
%
% Teoria sygnalow
% Elektronika
% AGH 
% 
% Opracowanie: P.Korohoda, 11/01/2023

clc; clear; close all;

fp=2000; dt=1/fp;
K=100;   ddt=dt/K;

f1=400; f2=2200; f3=600;
t=0:ddt:3+ddt; % pseudo-ciągła oś czasu (z parzystą liczbą elementów ze wzgłędu na funkcję cft);
x=xpi(t,0.5,1).*cos(2*pi*f1*t)+xpi(t,1.5,1).*cos(2*pi*f2*t)+xpi(t,2.5,1).*cos(2*pi*f3*t);

tn=0:dt:3; N=length(tn);
xn=xpi(tn,0.5,1).*cos(2*pi*f1*tn)+xpi(tn,1.5,1).*cos(2*pi*f2*tn)+xpi(tn,2.5,1).*cos(2*pi*f3*tn);

[X,f]=cft(x,t);      k=find((f>-3*fp)&(f<3*fp)); X=X(k); f=f(k); Nf=length(f);

Xp=zeros(1,Nf);
tic;
for n=1:N
    Xp=Xp+xn(n).*exp(-j*2*pi*f/fp*(n-1));
end    
czas=toc

x=x/max(abs(x)); % na wszelki wypadek "na potem";
% sound(x,fp*K) ; % można posłuchać jak to brzmi;
    
    
% EOF;