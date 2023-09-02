function [x,t]=icft(X,t0,dt)
%[x,t]=icft(X,t0,dt)
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Opracowal: P.Korohoda, 20/12/2022

N=length(X); fp=1/dt; df=fp/N;
f=0:df:(N-1)*df;

X=X*fp;  X=fftshift(X);  X=X.*exp(j*2*pi*f*t0);
x=ifft(X); if max(abs(imag(x)))<1e-10, x=real(x); end
t=t0+(0:dt:(N-1)*dt);

% EOF