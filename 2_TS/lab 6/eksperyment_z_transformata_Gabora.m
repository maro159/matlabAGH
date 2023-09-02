% m-plik skryptowy: eksperyment_z_transformata_Gabora.m
%
% Teoria sygnalow
% Elektronika
% AGH 
% 
% Opracowanie: P.Korohoda, 11/01/2023

clc; clear; close all;

% wstep (dla pewności):
x=0:3
y=(-1:4)'
A=x+y

% eksperyment wlasciwy:
dt=1e-2; t=-16:dt:16; f0=1;
x=cos(2*pi*f0*t);
df=1e-2; f=-3:df:3; f=f';
XG1=(1/2)*( exp(-pi*(f+f0).^2).*exp(-j*2*pi*(f+f0)*t) + exp(-pi*(f-f0).^2).*exp(-j*2*pi*(f-f0)*t)); % wzór wstępny:
XG2=exp(-pi*(f.^2+f0^2+2*j*f*t)).*cosh(2*pi*f0*(f+j*t)); % wzór "zwinięty":

porownanie=max(abs(XG1(:)-XG2(:)))

    figure(1);
        plot(t,x,'b.-'); grid on;
            xlim([t(1),t(end)]);
    figure(2);
        subplot(1,2,1); mesh(t,f,real(XG2)); grid on;
        subplot(1,2,2); mesh(t,f,imag(XG2)); grid on;
    figure(3);
        subplot(1,2,1); mesh(t,f,abs(XG2)); grid on;
        subplot(1,2,2); mesh(t,f,angle(XG2)/pi); grid on;
        
% opisy wykresów proszę uzupełnić samodzielnie;        

% Pytanie do przemyślenia: czy na pewno wszystko tu się zgadza?

% EOF        