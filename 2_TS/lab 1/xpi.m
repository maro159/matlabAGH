function y = xpi(t,t0,T)
% xpi(t,t0,T)
% zwraca wartości "funkcji PI" na przedziale t, środek t0, szerokość T
%
% MP 19.10.2022
Nt = length(t);
y = ones(1,Nt);
y((t>t0+T/2)|(t<t0-T/2))=0;
end