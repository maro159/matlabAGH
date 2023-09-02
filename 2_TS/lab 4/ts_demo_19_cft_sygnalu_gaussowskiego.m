% m-plik skryptowy: ts_demo_19_cft_sygnalu_gaussowskiego.m
%
% Teoria sygnalow
% Elektronika
% AGH
%
% Temat: ilustracja twierdzenia, ze transformata CFT funkcji Gaussa jest funkcja Gaussa;
%
% (C) P.Korohoda, 11/12/2020;

clc; clear; close all;

tmax=10; dt=0.001;  t=-tmax:dt:tmax; % wytworzenie pseudo-ciaglego modelu osi czasu;
Nt=length(t);

% sygnal Gaussa:
a=0.1;   % arbitralnie wybrana wartosc parametru;
x=exp(-a*t.^2);

% CFT wyznaczona z definicji - czyli calka oznaczona (ale wyliczana numerycznie!):
fmax=1; df=2*fmax/1000;  f=-fmax:df:fmax;   Nf=length(f);
for k=1:Nf
   X(k)=calka(x.*exp(-j*2*pi*f(k)*t),dt); 
end    
test_imag_X=max(abs(imag(X))),   X=real(X);

X_ref=sqrt(pi/a)*exp(-(pi^2/a)*f.^2); % wzor, ktory weryfikujemy;
E=X-X_ref;
d=sqrt(calka(E.*conj(E),df)),

    figure(1); clf;
         subplot(3,1,1); plot(t,x,'b.-'); grid on;
                            xlabel('t [s]'); ylabel('x(t)');
         subplot(3,1,2); plot(f,X,'b.-'); grid on; hold on;
                         plot(f,X_ref,'r.'); 
                            xlabel('f [Hz]'); ylabel('X(f)  oraz  X_r_e_f(f)'); % warto zrobic "zoom";
         subplot(3,1,3); plot(f,E,'g.-'); grid on;
                            xlabel('f [Hz]'); ylabel('E(f) = X(f) - X_r_e_f(f)');
         
% to wyliczenie mozna wmontowac w petle, gdzie os czasu bedzie stopniowo wydluzana (teoretycznie powinna byc nieskonczona);
         
% EOF