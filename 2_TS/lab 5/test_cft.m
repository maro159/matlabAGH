% m-plik skryptowy: test_cft.m
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Opracował: P.Korohoda, 20/12/2022

clc; clear; close all;

dt=1e-3; t=-2:dt:5; N=length(t); if N/2>floor(N/2), t=[t,t(end)+dt]; end
%x=@(t) xtri(t,1.2,2.5)+xpi(t,0.5,1.5);
x=@(t) xpi(t,-0.5,1.5)-xpi(t,0.5,1.5)+2*xpi(t,1.0,1.5);
tic;
[X,f]=cft(x(t),t);
czas_1=toc,

N=length(t);
xt=x(t);
tic;
for k=1:N
   X_ref(k)=calka(xt.*exp(-j*2*pi*f(k)*t),dt);
end    
czas_2=toc,

test_X=max(abs(X-X_ref))

    figure(1);
        subplot(4,1,1); plot(t,xt,'b.-'); grid on;
                          xlim([t(1),t(end)]);
        subplot(4,1,2); plot(f,real(X),'b.-'); grid on; hold on;
                        plot(f,real(X_ref),'r.');
                          xlim([-10,10]);
        subplot(4,1,3); plot(f,imag(X),'b.-'); grid on; hold on;
                        plot(f,imag(X_ref),'r.');
                          xlim([-10,10]);
        subplot(4,1,4); plot(f,abs(X-X_ref),'g.-'); grid on; hold on;
                          xlim([f(1),f(end)]);
                          
% opisy wykresów proszę uzupełnić samodzielnie;

% EOF