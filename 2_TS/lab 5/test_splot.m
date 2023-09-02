% m-plik skryptowy: test_splot.m
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Opracował: P.Korohoda, 20/12/2022

clc; clear; close all;
dt=1e-3; t=-2:dt:5;
x=@(t) xtri(t,1.2,2.5)+xpi(t,0.5,1.5);
h=@(t) xtri(t,0.25,1.5)-xpi(t,1.5,0.5);
tic;
[y,ty]=splot(x(t),h(t),t(1),t(1),dt);
czas_1=toc,

Ny=length(y);
x1=x(t);
tic;
for n=1:Ny
   h1=h(ty(n)-t); 
   y_ref(n)=calka(x1.*h1,dt);
end    
czas_2=toc,

test_y=max(abs(y-y_ref))

    figure(1);
        subplot(4,1,1); plot(t,x(t),'b.-'); grid on; hold on;
                          xlim([t(1),t(end)]);
        subplot(4,1,2); plot(t,h(t),'b.-'); grid on; hold on;
                          xlim([t(1),t(end)]);
        subplot(4,1,3); plot(ty,y,'b.-'); grid on; hold on;
                        plot(ty,y_ref,'r.');
                          xlim([ty(1),ty(end)]);                          
        subplot(4,1,4); plot(ty,y-y_ref,'g.-'); grid on; hold on;
                          xlim([ty(1),ty(end)]);
                          
% opisy wykresów proszę uzupełnić samodzielnie;

% EOF