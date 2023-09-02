% m-plik skryptowy: ts_demo_25_przeksztalcanie_filtrow.m
%
% Teoria sygnalow
% Elektronika
% AGH 
%
%
% (C) P.Korohoda: listopad 2015r./ grudzien 2017r./listopad 2018r.;

clc; clear; close all;

f=logspace(-1,5,1000); w=2*pi*f; s=j*w;
N=5;
[b0,a0]=butter(N,2*pi*1,'s'); % czestotliwosc graniczna wzorca jest rowna 1;
%[b0,a0]=butter(N,2*pi*4,'s'); % czestotliwosc graniczna wzorca jest ROZNA OD 1;
[H0,w0]=freqs(b0,a0,w);
   L0=ones(1,length(f))*b0(end);   M0=ones(1,length(f))*a0(end);
   for n=1:N,
     L0=L0+b0(N-n+1).*s.^n;
     M0=M0+a0(N-n+1).*s.^n;       
   end;    
   H0_LM=L0./M0;
   
typ_filtru=1;
switch typ_filtru,
    case 1, fg=1000; wg=2*pi*fg; sg=j*wg;
            f1=f/fg; s1=j*2*pi*f1; 
                     s2=s./fg;
            [b_ref,a_ref]=butter(N,wg,'s'); H_ref=freqs(b_ref,a_ref,w);            
    case 2, fd=1000; wd=2*pi*fd; sd=j*wd;
            f1=-fd./f; s1=j*2*pi*f1; 
                       s2=-j*(2*pi)*sd./s;
            [b_ref,a_ref]=butter(N,wd,'high','s'); H_ref=freqs(b_ref,a_ref,w);
    case 3, fa=2000; fb=6000; wa=2*pi*fa; wb=2*pi*fb;
            sa=j*wa; sb=j*wb;
            f1=(f.^2-fb*fa)./(f.*(fb-fa)); s1=j*2*pi*f1;
                                           s2=(j*2*pi)*(s.^2-sb*sa)./(s.*(sb-sa));
            [b_ref,a_ref]=butter(N,[wa,wb],'bandpass','s'); H_ref=freqs(b_ref,a_ref,w);
    case 4, fa=100; fb=6000; wa=2*pi*fa; wb=2*pi*fb;
            sa=j*wa; sb=j*wb;
            f1=-(f.*(fb-fa))./(f.^2-fb*fa); s1=j*2*pi*f1;
                                            s2=-(j*2*pi)*(s.*(sb-sa))./(s.^2-sb*sa);
            [b_ref,a_ref]=butter(N,[wa,wb],'stop','s'); H_ref=freqs(b_ref,a_ref,w);                        
end;        

   L1=ones(1,length(f))*b0(end);   M1=ones(1,length(f))*a0(end);
   for n=1:N,
     L1=L1+b0(N-n+1).*s1.^n;
     M1=M1+a0(N-n+1).*s1.^n;       
   end;    
   H1=L1./M1;
   
   L2=ones(1,length(f))*b0(end);   M2=ones(1,length(f))*a0(end);
   for n=1:N,
     L2=L2+b0(N-n+1).*s2.^n;
     M2=M2+a0(N-n+1).*s2.^n;       
   end;    
   H2=L2./M2;   
   
   figure(1);
        subplot(2,1,1); semilogx(f,20*log10(abs(H0)+eps),'ro-'); grid on; hold on;
                        plot(f,20*log10(abs(H0_LM)+eps),'b.-');
        subplot(2,1,2); semilogx(f,angle(H0)/pi,'ro-'); grid on; hold on;
                        plot(f,angle(H0_LM)/pi,'b.-');
   figure(2);
        subplot(2,1,1); semilogx(f,20*log10(abs(H1)+eps),'ro-'); grid on; hold on;
                        semilogx(f,20*log10(abs(H_ref)+eps),'b.-');
        subplot(2,1,2); semilogx(f,angle(H1)/pi,'ro-'); grid on; hold on;
                        semilogx(f,angle(H_ref)/pi,'b.-');
   figure(3);
        subplot(2,1,1); semilogx(f,20*log10(abs(H2)+eps),'go-'); grid on; hold on;
                        semilogx(f,20*log10(abs(H_ref)+eps),'b.-');                
        subplot(2,1,2); semilogx(f,angle(H2)/pi,'go-'); grid on; hold on;
                        semilogx(f,angle(H_ref)/pi,'b.-');
                        
% opisy wykresów proszę sobie uzupełnić samodzielnie;
% KONIEC PLIKU;