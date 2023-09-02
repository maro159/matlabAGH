function [y,t]=splot(x,h,tx0,th0,dt)
%[y,t]=splot(x,(x,h,tx0,th0,dt)
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Opracował: P.Korohoda, 20/12/2022

y=conv(x,h)*dt; N=length(y);
t=tx0+th0+(0:dt:(N-1)*dt);

% EOF