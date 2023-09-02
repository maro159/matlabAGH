% m-plik skryptowy: ts_demo_21_metoda_g_s.m
%
% Teoria sygnalow
% Elektronika
% AGH
%
% Przykład realizacji metody Grama-Schmidta;
%
% (C) P.Korohoda, 5/12/2022;

clc; clear; close all;

przyklad=1;

switch przyklad
    case 1
        dt=0.00001; t=-2:dt:2;
        N=4; % liczba sygnałów wchodzących w skład bazy;
        for n=1:N
          c=(rand(1,4)-0.5)*2;
          v(n).x=c(1)*xpi(t,-1.5,1)+c(2)*xpi(t,-0.5,1)+c(3)*xpi(t,0.5,1)+c(4)*xpi(t,1.5,1);    
          A(n,1:N)=c;
        end
    case 2 % miejsce na wlasny przyklad (czyli trenujemy...)
end

% testujemy liniową niezależność:
test_liniowej_niezaleznosci = det(A)

% wyznaczanie wspolczynnikow aproksymacji:
b(1).x=v(1).x/sqrt(calka(v(1).x.*v(1).x,dt));
for n=2:N
     v_apr=0;
     for m=1:n-1
       v_apr=v_apr+calka(v(n).x.*b(m).x,dt)*b(m).x;
     end
     u=v(n).x-v_apr;
     b(n).x=u/sqrt(calka(u.*u,dt));
end

% test ortonormalnosci uzyskanej bazy:
for n=1:N
    for m=1:N
      B(m,n)=calka(b(n).x.*b(m).x,dt);     
    end
end
test_ortonormalnosci_bazy = max(max(abs(B-eye(N)))),

% czesc graficzna:    
    figure(1); clf; lw=1;
            for n=1:N
                subplot(N,2,(n-1)*2+1); plot(t,v(n).x,'b.-'); grid on; hold on;
                                        plot([t(1),t(end)],[0,0],'k','linewidth',lw);
                                           xlim([t(1),t(end)]);
                subplot(N,2,n*2); plot(t,b(n).x,'r.-'); grid on; hold on;
                                  plot([t(1),t(end)],[0,0],'k','linewidth',lw);
                                           xlim([t(1),t(end)]);
            end    
   
% opisy wykresów proszę uzupełnić samodzielnie;

% EOF