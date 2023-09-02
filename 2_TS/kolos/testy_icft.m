% m-plik skryptowy: test_icft.m
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Opracował: P.Korohoda, 20/12/2022

clc; clear; close all;

dt=1e-3; t=-2:dt:5; N=length(t); if N/2>floor(N/2), t=[t,t(end)+dt]; end
%x=@(t) xtri(t,1.2,2.5)+xpi(t,0.5,1.5);
% x=@(t) xpi(t,-0.5,1.5)-xpi(t,0.5,1.5)+2*xpi(t,1.0,1.5);
x = @(t) xtri(t,3,2);
xt = x(t);


tic;
[X,f]=cft(xt,t);
% X = sinc(f) .* sinc(f) .* exp(-6*j*pi*f);
czas_1=toc,

[x_rec,t]=icft(X,t(1),dt);

test_x = max(abs(x_rec-xt))

    figure(1);
        subplot(2,1,1); plot(t,xt,'b.-'); grid on; hold on;
                        plot(t,x_rec,'r.');
                          xlim([t(1),t(end)]);
        subplot(2,1,2); plot(t,abs(x_rec-xt),'g.-'); grid on; hold on;
                          xlim([t(1),t(end)]);

% opisy wykresów proszę uzupełnić samodzielnie;

% EOF