% m-plik skryptowy: demo_transformacji_Gabora.m
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% (C) P.Korohoda, 28/12/2017;

clc; clear; close all;
odwrotna1=1; odwrotna2=1;
tmax=4; dt=0.01;  t=-tmax:dt:tmax; Nt=length(t);
fmax=6; df=0.01;  f=-fmax:df:fmax; Nf=length(f);

sygnal=1;
switch sygnal
    case 1, f1=2; x=cos(2*pi*f1*t);
    case 2, f1=2; a=1.2;     x=cos(2*pi*f1*t*a);
            x(abs(t*a)>tmax)=0;
    case 3, ddf=(3-1.5)/(Nt-1);
            f1=1.5:ddf:3;    x=cos(2*pi*f1.*t);
            x(abs(t*1.2)>tmax)=0;
    case 4, a=1;
            ddf=(4-1.5)/(Nt-1);
            f1=1.5:ddf:4;    x=cos(2*pi*(f1.*t)*a);
            x(abs(a*t*1.2)>tmax)=0;
end

tic;
for nt=1:Nt
    w=exp(-pi*(t-t(nt)).^2);
    for nf=1:Nf
       X(nf,nt)=calka(x.*w.*exp(-j*2*pi*f(nf)*t),dt); 
    end
end
czas_w_minutach_Gabor=toc/60,
[N1,N2]=size(X),

max_abs=max(abs(X(:))),
mean_abs=mean(abs(X(:))),
SD_abs=std(abs(X(:))),

tic;
for nf=1:Nf
   Xf(nf)=calka(x.*exp(-j*2*pi*f(nf)*t),dt); 
end    
czas_w_minutach_CFT=toc/60,

% a teraz weryfikacja wzorow na odwrotna transformacje Gabora:
if odwrotna1 % wyliczamy sygnal: x(t);
    tic;
    for nt=1:Nt
           w=1;
           xx(nt)=calka(X(:,nt).'.*exp(j*2*pi*t(nt)*f),df); 
    end
    czas_w_minutach_x_z_Gabora=toc/60,
end

if odwrotna2 % wyliczamy transformate CFT: X(f);
    tic;
    for nf=1:Nf
           w=1;
           XX(nf)=calka(X(nf,:),dt); 
    end
    czas_w_minutach_CFT_z_Gabora=toc/60,
end

% przeliczenia na potrzeby wyswietlania za pomoca funkcji "image":
abs_X=abs(X); abs_X=(abs_X-min(abs_X(:)))/(max(abs_X(:))-min(abs_X(:))); % normalizacja dla modulu;
    angle_X=angle(X)/pi; angle_X=angle_X/2+0.5; % normalizacja dla fazy;
        abs_X=abs_X*255+1; angle_X=angle_X*255+1; % dopasowanie do 8-bitowych poziomow "szarosci";

    figure(1); w=exp(-pi*t.^2);
        subplot(2,1,1); plot(t,x,'b.-'); grid on;
        subplot(2,1,2); plot(t,x.*w,'b.-'); grid on; hold on;
                        plot(t,w*max(x),'r-');
    figure(2);
        subplot(2,2,1); mesh(t,f,real(X)); axis ij tight; view([-75,30]); xlabel('t'); ylabel('f'); title('real part');
        subplot(2,2,3); mesh(t,f,imag(X)); axis ij tight; view([-75,30]); xlabel('t'); ylabel('f'); title('imaginary part');
        subplot(2,2,2); imshow(real(X),[]); colorbar('vertical'); xlabel('t'); ylabel('f'); title('real part');
        subplot(2,2,4); imshow(imag(X),[]); colorbar('vertical'); xlabel('t'); ylabel('f'); title('imaginary part');

    figure(3); fs=14;
        subplot(2,1,1); mesh(t,f,abs(X)); axis ij tight; view([-75,30]); xlabel('t [s]','fontsize',fs); ylabel('f [Hz]','fontsize',fs); title('magnitude','fontsize',fs);
        subplot(2,1,2); mesh(t,f,angle(X)/pi); axis ij tight; view([-75,30]); xlabel('t [s]','fontsize',fs); ylabel('f [Hz]','fontsize',fs); title('phase/pi','fontsize',fs);
        
    figure(4); fs=14;
        subplot(2,1,1); imshow(abs(X),[]);   colorbar('vertical');  xlabel('t [s]','fontsize',fs); ylabel('f [Hz]','fontsize',fs); title('magnitude','fontsize',fs);
        subplot(2,1,2); imshow(angle(X),[]); colorbar('vertical');  xlabel('t [s]','fontsize',fs); ylabel('f [Hz]','fontsize',fs); title('phase','fontsize',fs);

    figure(5); fs=14;
        subplot(2,1,1); image(t,f,abs_X);  axis image; grid on; xlabel('t [s]','fontsize',fs); ylabel('f [Hz]','fontsize',fs); title('magnitude','fontsize',fs);
        subplot(2,1,2); image(t,f,angle_X);axis image; grid on; xlabel('t [s]','fontsize',fs); ylabel('f [Hz]','fontsize',fs); title('phase','fontsize',fs);
                         colormap(copper(256));
                 
    figure(6); fs=14;
        subplot(3,1,1); plot(t,x,'b-'); grid on; hold on; xlabel('t [s]','fontsize',fs);
                        plot(t,real(xx),'r.');
        subplot(3,2,3); plot(f,abs(Xf),'b-'); grid on; hold on; xlabel('f [Hz]','fontsize',fs); title('abs(X)','fontsize',fs);
                        plot(f,abs(XX),'r.');
        subplot(3,2,5); plot(f,angle(Xf)/pi,'b-'); grid on; hold on; xlabel('f [Hz]','fontsize',fs);title('angle(X)/pi','fontsize',fs);
                        plot(f,angle(XX)/pi,'r.');
        subplot(3,2,4); plot(f,real(Xf),'b-'); grid on; hold on; xlabel('f [Hz]','fontsize',fs);title('real(X)','fontsize',fs);
                        plot(f,real(XX),'r.');        
        subplot(3,2,6); plot(f,imag(Xf),'b-'); grid on; hold on; xlabel('f [Hz]','fontsize',fs);title('imag(X)','fontsize',fs);
                        plot(f,imag(XX),'r.');
        
% KONIEC PLIKU;