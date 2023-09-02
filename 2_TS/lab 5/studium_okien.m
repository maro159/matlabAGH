% m-plik skryptowy: studium_okien.m
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Wykresy okien i ich transformat Fouriera (aproksymacja rozwiazan analogowych);
%
% (C) P.Korohoda, grudzien 2009 r./grudzien 2015 r./styczen 2017 r./grudzień 2022 r.;

clc; clear; close all;

opcja_dla_czasu=1;

switch opcja_dla_czasu
    case 1, dt=0.001; t=-3:dt:3+dt; N=length(t); T=0.5; % uwaga - szerokosc okna to 2T (mozna zmieniac - byle rozsadnie);
    case 2, % tu mozna okreslic inny przedzial dla "t" albo inne "dt", ale uwaga - z rozsądkiem i zrozumieniem;
end

opcja_dla_sygnalu=4;

switch opcja_dla_sygnalu
    case 1, fo=10; x=cos(2*pi*fo*t);
    case 2, f1=10; f2=15; x=cos(2*pi*f1*t) + cos(2*pi*f2*t); 
    case 3, f1=10; f2=15; x=cos(2*pi*f1*t) + 0.5*cos(2*pi*f2*t);
    case 4, f1=100; f2=150; f3=200; x=cos(2*pi*f1*t) + 0.5*cos(2*pi*f2*t) + 0.25*cos(2*pi*f3*t);
    case 5, % tu mozna okreslic inny sygnał testowy, ale uwaga - z rozsądkiem i zrozumieniem;
end

opcja_dla_czestotliwosci=1;

switch opcja_dla_czestotliwosci
    case 1, min_f=-250; max_f=250; 
    case 2, % tu mozna okreslic inny przedzial dla "f", ale uwaga - z rozsądkiem i zrozumieniem;
end    

N=length(t); fp=1/dt; df=fp/N;
f=(0:df:(N-1)*df)-fp/2;

wzor_na_wykladzie=1;
opcja_dla_okna=1;
switch opcja_dla_okna
    case 1, w=zeros(1,N); k=find((t>-T)&(t<T)); w(k)=1; % okno prostokatne;
            Wref=2*T*sinc(f*2*T);
            min_db=-80; max_dB=10; min_Re=-0.5; max_Re=2.2;
    case 2, w=zeros(1,N); k=find((t>-T)&(t<=0)); w(k)=1+t(k)/T; k=find((t>0)&(t<=T)); w(k)=1-t(k)/T; % okno Bartletta (trojkatne);
            Wref=T*sinc(f*T).^2;
            min_db=-80; max_dB=5; min_Re=-0.25; max_Re=1.2;
    case 3, w=zeros(1,N); k=find((t>-T)&(t<T)); w(k)=0.5*(1+cos(pi*t(k)/T)); % okno Hanna (podniesiony kosinus); 
            k=find((f~=0)&((1-4*T^2*f.^2)~=0));     Wref(k)=sin(2*pi*f(k)*T)./(2*pi*(1-4*T^2*f(k).^2).*f(k)); 
            k=find(f==0); Wref(k)=T;  
            min_db=-80;   max_dB=5; min_Re=-0.25; max_Re=1.2;
    case 4, w=zeros(1,N); k=find((t>-T)&(t<T)); w(k)=0.54+0.46*cos(pi*t(k)/T); % okno Hamminga;
            k=find((f~=0)&((1-4*T^2*f.^2)~=0));
            Wref(k)=(1.08-0.64*T^2*f(k).^2).*sin(2*pi*f(k)*T)./(2*pi*f(k).*(1-4*T^2*f(k).^2)); 
            k=find(f==0); Wref(k)=T; % dzieki temu widac gdzie (na osi "f") we wzorze jest dzielenie przez zero;
            k=find((1-4*T^2*f.^2)==0); Wref(k)=T; 
            min_db=-80;   max_dB=5; min_Re=-0.25; max_Re=1.2;
    case 5, w=zeros(1,N); k=find((t>-T)&(t<T)); w(k)=3/(4*T)*(1-(t(k)/T).^2); % okno paraboliczne;
            wzor_na_wykladzie=0; % brak wzoru na Wref na wykładzie;
            min_db=-80;   max_dB=5; min_Re=-0.25; max_Re=1.2;
    case 6, w=zeros(1,N); k=find((t>-T/2)&(t<T/2)); w(k)=1-6*t(k).^2/(T^2)+6*abs(t(k)).^3/(T^3);   
            k=find(((t>-T)&(t<=-T/2))|((t>=T/2)&(t<T)));  w(k)=2*(1-abs(t(k))/T).^3;    % okno Parzena;
            Wref=(3/4)*T*sinc(f*T*0.5).^4; 
            min_db=-160;   max_dB=5; min_Re=-0.25; max_Re=1.2;
    case 7, w=zeros(1,N); k=find((t>-T)&(t<T)); K=length(k); Beta=9; h=kaiser(K,Beta); w(k)=h; % okno Kaisera;
            wzor_na_wykladzie=0; % brak wzoru na Wref na wykładzie;
            min_db=-160;   max_dB=5; min_Re=-0.25; max_Re=1.4;
    case 8, w=zeros(1,N); k=find((t>-T)&(t<T)); K=length(k); alfa=3; h=gausswin(K,alfa); w(k)=h; % okno Gaussa;
            wzor_na_wykladzie=0; % brak wzoru na Wref na wykładzie;
            min_db=-80;   max_dB=5; min_Re=-0.25; max_Re=1.3;            
    case 9, w=zeros(1,N); k=find((t>-T)&(t<T)); sigma=1/3; a=(1/2)*sigma^2, w(k)=(1/(2*sqrt(pi*a)))*exp(-t(k).^2/(4*a)); % obciete okno Gaussa, sigma=1/3;
            wzor_na_wykladzie=0; % brak wzoru na Wref na wykładzie;
            min_db=-80;   max_dB=15; min_Re=-0.25; max_Re=1.2;
    case 10,w=zeros(1,N); k=1:N; sigma=1/2; a=(1/2)*sigma^2, w(k)=(1/(2*sqrt(pi*a)))*exp(-t(k).^2/(4*a)); % obciete okno Gaussa, sigma=1/2;
            wzor_na_wykladzie=0; % brak wzoru na Wref na wykładzie;
            min_db=-160;   max_dB=5; min_Re=-0.25; max_Re=1.2;
end    

xw=x.*w;

tic;
[W,fW]=cft(w,t); W=W(:).';
[XW,fXW]=cft(xw,t); XW=XW(:).';
czas_obl_CFT=toc,

    lw1=1;     lw=1;     lw2=1;
    fs1=12;     fs2=14;
    
    figure(1);
        subplot(3,1,1);  plot(t,x,'r-','linewidth',lw); grid on; legend('x(t)','location','NorthEast');
                            xlim([t(1),t(end)]);
        subplot(3,1,2);  plot(t,w,'r-','linewidth',lw); grid on; legend('w(t)','location','NorthEast');
                            xlim([t(1),t(end)]);
        subplot(3,1,3);  plot(t,xw,'r-','linewidth',lw); grid on; legend('x(t) razy w(t)','location','NorthEast');
                            xlim([t(1),t(end)]); xlabel('t [s]');

    figure(2);
        subplot(2,1,1);  plot(fW,real(W),'b-','linewidth',lw); grid on;  hold on; axis([min_f,max_f,min_Re*T,max_Re*T]);
                         if wzor_na_wykladzie, plot(f,real(Wref),'m.'); end % tam gdzie jest Wref, warto dodac ten wykres (skad wynikaja roznice?);
                             	set(gca,'FontName','Arial CE','FontSize',fs1,'FontWeight','bold');
                                text(-0.15,1.09,['razy T'],'sc','FontName','Arial CE','FontSize',fs2,'FontWeight','bold');                                                                            
        subplot(2,1,2);  plot(fXW,real(XW),'b-','linewidth',lw); grid on;  axis([min_f,max_f,min_Re*T/2,max_Re*T/2]);
                                xlabel('f [Hz]','FontName','Arial CE','FontSize',fs2,'FontWeight','bold');       
                         	    set(gca,'FontName','Arial CE','FontSize',fs1,'FontWeight','bold');
                                text(-0.15,1.09,['razy T'],'sc','FontName','Arial CE','FontSize',fs2,'FontWeight','bold');                                                
    
    figure(3);
        subplot(2,1,1);   plot([min_f,max_f],[max(20*log10(abs(W/T)))-40,max(20*log10(abs(W/T)))-40],'r','linewidth',lw2); hold on;
                          plot([-1/T,-1/T],[-200,100],'r','linewidth',lw2);
                          plot([1/T,1/T],[-200,100],'r','linewidth',lw2);     
                          plot(f,20*log10(abs(W/T)),'b-','linewidth',lw); grid on; axis([min_f,max_f, min_db,max_dB]);
                             	set(gca,'FontName','Arial CE','FontSize',fs1,'FontWeight','bold');
                                text(-0.15,1.09,['[dB]'],'sc','FontName','Arial CE','FontSize',fs2,'FontWeight','bold');                    
        subplot(2,1,2);   plot([min_f,max_f],[max(20*log10(abs(XW/T)))-40,max(20*log10(abs(XW/T)))-40],'r','linewidth',lw2); hold on;
                          plot(f,20*log10(abs(XW/T)),'b-','linewidth',lw); grid on;  axis([min_f,max_f, min_db,max_dB]);
                                xlabel('f [Hz]','FontName','Arial CE','FontSize',fs2,'FontWeight','bold');       
                             	set(gca,'FontName','Arial CE','FontSize',fs1,'FontWeight','bold');
                                text(-0.15,1.09,['[dB]'],'sc','FontName','Arial CE','FontSize',fs2,'FontWeight','bold');
                    
% KONIEC PLIKU;