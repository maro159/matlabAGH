% m-plik skryptowy: ts_demo_20_aproksymacja_w_bazie_przyklady.m
%
% Teoria sygnalow
% Elektronika
% AGH
%
% Przykłady aproksymacji - do samodzielnego ćwiczenia metodyki postępowania;
%
% (C) P.Korohoda, 5/12/2022;

clc; clear; close all;

przyklad=1;

switch przyklad
    case 1
        dt=0.00001; t=-2:dt:2;
        x=xtri(t,-0.5,3);
        N=4;
        b(1).x=xpi(t,-1.5,1);
        b(2).x=xpi(t,-0.5,1);
        b(3).x=xpi(t,0.5,1);
        b(4).x=xpi(t,1.5,1);
        d_man=sqrt(3)/6;
    case 2
        dt=0.00001; t=0:dt:1;
        x=xpi(t,0.25,0.5)-xpi(t,0.75,0.5);
        N=4;
        b(1).x=xtri(t,1/8,1/4);
        b(2).x=xtri(t,3/8,1/4);
        b(3).x=xtri(t,5/8,1/4);
        b(4).x=xtri(t,7/8,1/4);
        d_man=1/2;
   case 3
        dt=0.00001; t=0:dt:1;
        x=xtri(t,3/8,3/4);
        N=5;
        b(1).x=ones(1,length(t));
        b(2).x=cos(2*pi*1*t);
        b(3).x=sin(2*pi*1*t);
        b(4).x=cos(2*pi*2*t);
        b(5).x=sin(2*pi*2*t);
        d_man=0.027; % ta wartość już nie była w istocie policzona ręcznie (ale można to zrobić);
    case 4 % miejsce na wlasny przyklad (czyli trenujemy...)
end

% wyznaczanie wspolczynnikow aproksymacji:
for n=1:N
     a(n)=calka(x.*b(n).x,dt)/calka(b(n).x.*b(n).x,dt);
end

% aproksymacja:
    x_apr=0;
    for n=1:N
         x_apr=x_apr + a(n)*b(n).x;
    end
    e=x_apr-x;
    d2=calka(e.*e,dt);
    d=sqrt(d2),
    d_man,

% czesc graficzna:    
    figure(1); clf; lw=1;
            for n=1:N
                subplot(N,2,(n-1)*2+1); plot(t,b(n).x,'b.-'); grid on; hold on;
                                plot([t(1),t(end)],[0,0],'k','linewidth',lw);
                                        xlim([t(1),t(end)]);
                subplot(N,2,n*2); plot(t,b(n).x.*x,'g.-'); grid on; hold on;
                                plot([t(1),t(end)],[0,0],'k','linewidth',lw);
                                        xlim([t(1),t(end)]);
            end    
    figure(2); clf; 
            subplot(3,1,1); plot(t,x,'r.-'); grid on; hold on;  title('x(t) - red; x_a_p_r(t) - black');
                            plot(t,x_apr,'k.-');
                            plot([t(1),t(end)],[0,0],'k','linewidth',lw);
                                 xlim([t(1),t(end)]);
            subplot(3,1,2); plot(t,e,'m.-'); grid on; hold on; title('e(t)');
                            plot([t(1),t(end)],[0,0],'k','linewidth',lw);
                                 xlim([t(1),t(end)]);
            subplot(3,1,3); plot(t,e.^2,'c.-'); grid on; hold on;  title('e^2(t)');
                            plot([t(1),t(end)],[0,0],'k','linewidth',lw);
                                 xlim([t(1),t(end)]);
                                 xlabel('t [s]');
                                 
% opisy wykresów proszę uzupełnić samodzielnie;
% EOF