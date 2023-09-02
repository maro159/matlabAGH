% m-plik skryptowy: ts_demo_22_przyklad_transformaty_Laplacea.m
%
% Teoria sygnalow
% Elektronika
% AGH
%
% Przyklad transformaty Laplace'a;
%
% (C) P.Korohoda, 7/12/2020;

clc; clear; close all;

ds=0.1;
re_s=-2:ds:1;
im_s=-0.8:ds:0.8;
Re_s=ones(length(im_s),1)*re_s;  Im_s=im_s(:)*ones(1,length(Re_s),1);
%[Re_s,Im_s]=meshgrid(re_s,im_s); % alternatywnie - z wywolaniem wbudowanej funkcji;
S=Re_s+j*Im_s;
a=-1+j;
Xs=1./(S-a);

dt=0.01; t=0:dt:10;  x=exp(a*t);
f=im_s/(2*pi); Nf=length(f);
for k=1:Nf
    Xf(k)=calka(x.*exp(-j*2*pi*f(k)*t),dt);
end

    figure(1); clf;
        subplot(2,2,1); plot(t,real(x),'b.-'); grid on;        
        subplot(2,2,3); plot(t,imag(x),'b.-'); grid on;
        subplot(2,2,2); plot(f,real(Xf),'r.-'); grid on;        
        subplot(2,2,4); plot(f,imag(Xf),'r.-'); grid on;
          % Uwaga - opisy osi, itp., proszę uzupełnić samodzielnie;
        
    figure(2); clf; 
        subplot(1,2,1); mesh(re_s,im_s,real(Xs)); axis tight; hold on;
                        plot3(zeros(1,Nf),im_s,real(Xf),'r.');
                            xlabel('Re(s)'); ylabel('Im(s)'); zlabel('Re(X(s))');
        subplot(1,2,2); mesh(re_s,im_s,imag(Xs)); axis tight; hold on;
                        plot3(zeros(1,Nf),im_s,imag(Xf),'r.');
                            xlabel('Re(s)'); ylabel('Im(s)'); zlabel('Im(X(s))');
                            
% EOF