% m-plik skryptowy: ts_demo_23_filtr_butterwortha.m
%
% Teoria sygnalow
% Elektronika
% AGH 
%
%
% (C) P.Korohoda: kwiecien 2008r./grudzien 2017r./listopad 2018r.;

clc; close all; clear;

N=3; % zakladamy rzad filtru;
wg=2; % uwaga - operujemy tutaj na pulsacjach [rad/s];
[b,a]=butter(N,wg,'s');
[z,p,k]=tf2zp(b,a),

% test rozmieszczenia biegunow:
n=0:2*N-1;
if N/2==round(N/2);
    p1=wg*exp(j*(2*pi*n/(2*N)+pi/(2*N)));
else
    p1=wg*exp(j*(2*pi*n/(2*N)));
end;    

p2n=p.^(2*N), % pytanie: czy otrzymamy to samo dla kazdego bieguna?

w=0:0.001:10;     Nw=length(w); % [rad/s];

H2=1./(1+(w./wg).^(2*N));

H=k*ones(1,Nw);
Hj=k*ones(1,Nw);
for n=1:N
    H=H.*1./(j*w-p(n)); % czesc  transmitancji dla biegunow "stabilnych";
    Hj=Hj.*1./(-j*w-conj(p(n))); % czesc transmitancji dla biegunow "niestabilnych";
end

% weryfikacja tezy o biegunach dla czesci sprzezonej:
Hj2=conj(H);
test=max(abs(Hj-Hj2)),

    figure(1); clf; xy_lim=max(abs(p1))*1.1;
        zplane(b,a); hold on;
        plot(real(p1),imag(p1),'ro');
            axis([-xy_lim,xy_lim,-xy_lim,xy_lim]);
        
    figure(2); clf
        plot(w,H2,'r.-'); grid on; hold on;
        % plot(w,H.*Hj,'b.-'); % dodajemy dla porownania;
        % plot(w,abs(H).^2,'g.-');  % dodajemy dla porownania;
            ylim([0,1.1]);
            
% opisy wykresów proszę sobie uzupełnić samodzielnie;
% EOF