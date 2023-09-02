% m-plik skryptowy: ts_demo_24_odpowiedz_impulsowa.m
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% (C) P.Korohoda, styczen 2017 r./grudzien 2019 r.;

clc; clear; close all;

N=6;
fg=1; 
tmax=30/fg;   dt=tmax/9999;   t=0:dt:tmax;   Nt=length(t);
[b,a]=butter(N,2*pi*fg,'s');

f=0:fg/100:10*fg; Nf=length(f);
H=freqs(b,a,2*pi*f);
[r,p,K]=residue(b,a), Np=length(p); % rozklad na ulamki proste;

h=zeros(1,Nt);
for k=1:Np
   h=h+r(k)*exp(p(k)*t);    
end
test_imag=max(abs(imag(h))),
h=real(h);

for k=1:Nf
   H1(k)=sum(h.*exp(-j*2*pi*f(k)*t))*dt; 
end

if length(K)==1, H1=H1+K; end

test_H=max(abs(H(:)-H1(:))),
ab=[b;a],
[z1,p1,K1]=tf2zp(b,a),

    figure(1);
        subplot(3,1,1); plot(t,h,'b.-'); grid on;
        subplot(3,1,2); plot(f,abs(H),'b-'); grid on; hold on;
                        plot(f,abs(H1),'r.');
        subplot(3,1,3); plot(f,angle(H)/pi,'b-'); grid on; hold on;
                        plot(f,angle(H1)/pi,'r.');
                        
% opisy wykresów proszę sobie uzupełnić samodzielnie;
% EOF