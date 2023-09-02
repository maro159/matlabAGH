% m-plik skryptowy: ZadanieLab.m
%
% 28.01.2023
%
% Jakub Domagała

clc; clear; close all;

dt = 0.01;
t_max = 10;
t = 0 : dt : t_max;
N = 10;
T = t_max/N;

sig = 0;

for n=1:N
    at=0;
    for k=1:N
        amp = rand(1)*5;
        td = rand(1)*10;
        at = at + amp*xtri(t, td, T);
        v(n).x = at;
    end
    amplitude = rand(1)*5;
    f0 = rand(1)*1;
    phi = rand(1)*2;
    sig = sig + amplitude .* cos(2.*pi.*f0.*t + phi);
end

%metoda Grama-Schmidta

for n = 1:N
    b(n).x = calka(sig.*v(n).x,dt);
end



b(1).x=v(1).x/sqrt(calka(v(1).x.*v(1).x,dt));

for n=2:N
     v_apr=0;
     for m=1:n-1
       v_apr=v_apr+calka(v(n).x.*b(m).x,dt)*b(m).x;
     end
     u=v(n).x-v_apr;
     b(n).x=u/sqrt(calka(u.*u,dt));
end
for n = 1:N
    a(n).x = calka(sig.*b(n).x,dt);
end

sig_aprox = 0;
for n=1:N
    sig_aprox = sig_aprox + a(n).x .* b(n).x;
end
blad_aprox_max = max(abs(sig - sig_aprox))

% test ortonormalnosci uzyskanej bazy:
for n=1:N
    for m=1:N
      B(m,n)=calka(b(n).x.*b(m).x,dt);     
    end
end
test_ortonormalnosci_bazy = max(max(abs(B-eye(N)))),



figure(1)
 plot(t,v(1).x);
   for n=1:N
        subplot(N+2,1,n); plot(t,v(n).x); hold on;
   end
   figure(2);
    plot(t,sig,"r");hold on;
        plot(t,sig_aprox,'g.-'); grid on; hold on
    

    