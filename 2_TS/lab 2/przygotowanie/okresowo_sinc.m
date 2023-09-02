% m-plik skryptowy: okresowo_sinc.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Opracowanie: M.Pawłowski 08.11.2022


clc; clear; close all;
t=-10:0.01:10;
N=10^3;
dt=[1;2;7;8];

X=zeros(size(t));
for n=-N:N
    X = X+sinc(t-(n*dt));
end

figure(1);
for i=1:length(dt)
    subplot(length(dt),1,i);
    plot(t,X(i,:));
    xlabel("t", FontSize=15);
    ylabel("x(t)", FontSize=15);
    titletext="$\sum\limits_{n=-\infty}^\infty sinc(\pi\cdot(t-$" + dt(i) + "$\cdot n))$";
    title(titletext,Interpreter="latex",FontSize=15);
end