% m-plik skryptowy: generator_melodyjki_rudolf.m
%
% Teoria sygnałów,
% Elektronika, AGH
% 
% Opracowanie: P.Korohoda, 26/11/2022, 19/12/2022, 20/12/2022

clc; clear; close all;

fp=48000;   dt=1/fp;

wybor_zestawu_harmonicznych=1;
switch wybor_zestawu_harmonicznych
    case 1, ah=[1, 0.25];      % amplitudy wybranych harmonicznych;
            nh=[1, 3];         % numery wybranych harmonicznych;
    case 2, ah=[1, 0.5, 0.25]; % amplitudy wybranych harmonicznych;
            nh=[1, 3, 5];      % numery wybranych harmonicznych;
    case 3, ah=[1, 0.5, 0.25]; % amplitudy wybranych harmonicznych;
            nh=[1, 2, 4];      % numery wybranych harmonicznych;
    case 4, ah=[1, 0.5, 0.25, 0.25, 0.25]; % amplitudy wybranych harmonicznych;
            nh=[1, 2, 4, 6, 8];      % numery wybranych harmonicznych;
end
Nh=length(ah);

Tn=[0.2,0.4,1.0,1.6];       kT=[1,2,1,2,2,2,3,1,1,1,1,2,2,4, 1,2,1,2,2,2,3,1,1,1,1,2,2,4, 1,2,1,2,2,2,3,1,1,1,1,2,2,4, 1,2,1,2,2,2,3,1,1,1,1,2,2,4];
n=[0,2,4,5,7,9,11,12,14]-9; kn=[5,6,5,3,8,6,5,5,6,5,6,5,8,7, 3,4,3,2,7,6,5,5,6,5,6,5,6,3, 5,6,5,3,8,6,5,5,6,5,6,5,8,7, 3,4,3,2,7,6,5,5,6,5,6,5,9,8];   Nn=length(kn),
fa1=440;    c0=(2^(1/12));    fn = fa1 * c0.^n;

x=[];
for m=1:Nn
    t=0:dt:Tn(kT(m))-dt;    Nt=length(t);
    x_aux=zeros(1,Nt);
    for k=1:Nh
        x_aux=x_aux+ah(k)*cos(2*pi*nh(k)*fn(kn(m))*t);
    end
    
    narastanie=1;
    switch narastanie
        case 1, N0=100; % liczba próbek dla fazy narastania dźwięku (uwaga - trzeba uważać, żeby możliwe było potem wyliczenie: 2*Nt-2*N0);
        case 2, N0=1000;
        case 3, N0=8000;
    end    
        w1=hann(2*N0); w2=hann(2*Nt-2*N0);
        N1=length(w1); N2=length(w2);
        w=[w1(1:floor(N1/2));w2(floor(N2/2)+1:end)];
        if length(w)<Nt, w=[w;zeros(Nt-length(w),1)]; end % korekta na wszelki wypadek;
        
    x_aux=x_aux.*w';
    x=[x,x_aux];
end

N=length(x);     % całkowita liczba próbek w sygnale;
t=0:dt:(N-1)*dt; % całkowita "oś czasu";

x=x/max(abs(x)); % normalizacja konieczna do zapisu (audiowrite) i dla odtwarzania za pomocą funkcji sound;
sound(x,fp);
audiowrite('Rudolf_1.wav',x,fp);

% część graficzna:
        figure(1);
            plot(t,x,'b.-'); grid on;
                xlabel('t [s]'); title('x(t) - wykres całego sygnału');

% EOF