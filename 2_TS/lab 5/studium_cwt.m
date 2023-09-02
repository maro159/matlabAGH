% m-plik skryptowy: studium_cwt.m
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Korzystamy z funkcji anonimowej sygnal.m
% a ponadto z funkcji wavefun;
%
% (C) P.Korohoda, 20 lutego 2006 r./marzec 2008 r./luty 2009 r./17 grudnia 2021 r.

clc; clear; close all;

sygnal=@(dt,tmax,fo)sin(2*pi*fo*(0:dt:tmax-dt));

fp=22050;  % mozna zmienic i zobaczyc co sie stanie...
dt=1/fp;
a=2^(1/12);
k=0:12;
fo=440*a^(3-12); % transponujemy, zeby dzwiekiem odniesienia bylo "c1"

   % parametryczny zapis melodii:
        % ciag wartosci funkcji:
        nutki.kn=[7,4,4,5,2,2,0,4,7];  % wartosci nutek (mozna pozmieniac);
        nutki.f=fo*a.^(nutki.kn); % wektor kolejnych wartoœci "f";

        % ciag dlugosci trwania sygnalu w kolejnych etapach (w sekundach):
        T=0.5;  % "ca³a nuta" odniesienia (w sekundach);
        nutki.tmax=[1/2,1/2,1/2,1/2,1/2,1/2,1/4,1/4,1/2]*T;  % czas brzmienia nutek (mozna zmieniac) - pó³nuty, æwierænuty itd.;
    % koniec zapisu melodii;

N=length(nutki.kn);
t_pauza=dt;
s_pauza=zeros(1,round(t_pauza/dt));

s=[];    % na poczatku jest "nic";
for n=1:N
    s1=sygnal(dt,nutki.tmax(n)-t_pauza,nutki.f(n)); % tu wlasnie wywolujemy funkcje;
    s=[s,s1,s_pauza];
    Ns=length(s);
end

sound(s,fp); % mo¿na zablokowaæ, ¿eby nie s³uchaæ sygna³u za ka¿dym razem;

%skale=logspace(2,6,10);
skale=1:500;
ktora_falka=2;

switch ktora_falka
    case 1, falka='db1';
    case 2, falka='db2';
    case 3, falka='db3';
    case 4, falka='db12';        
end
       
[xfalka,xf_skalujaca,tw]=wavefun(falka);
dtw=tw(2)-tw(1); fw_maks=1/dtw; dfw=(fw_maks/100)/800;
fw=-fw_maks/50:dfw:fw_maks/50;
M=2^12;
[CFT_falka,f1]=cft([xfalka,zeros(1,M)],[tw,tw(end)+(dt:dt:M)]);
[CFT_f_skalujaca,f1]=cft([xf_skalujaca,zeros(1,M)],[tw,tw(end)+(dt:dt:M)]); % powinno wyjœæ to samo - dlatego te¿ f1;

N=length(s);
t=0:dt:(N-1)*dt;
figure(1);
    plot(t,s,'b-','linewidth',2); grid on;
        set(gca,'fontsize',12); ylim([-1.2,1.2]);
    
figure(2); Nw=1024;
    w=hann(Nw);
    spectrogram(s,w,Nw-1,Nw,fp,'yaxis');
        axis([t(1),t(end)-dt*255,0,2]); % zak³adam kHz;
    
figure(3);
    subplot(2,1,1); plot(tw,xfalka,'r-','linewidth',2); grid on; hold on;
                    plot(tw,xf_skalujaca,'b-','linewidth',2);
                            xlabel('t [s]'); xlim([tw(1),tw(end)]);
    subplot(2,1,2); plot(f1,abs(CFT_falka),'r','linewidth',2); grid on; hold on;
                    plot(f1,abs(CFT_f_skalujaca),'b','linewidth',2);
                            xlabel('f [Hz]');  xlim([fw(1),fw(end)]);                   
figure(4); 
    tic;
    cwt(s,skale,falka,'absglb'); % lvl, glb, abslvl, absglb
    czas_liczenia_cwt_w_minutach=toc/60,
        set(gca,'fontsize',12);
    
% KONIEC PLIKU