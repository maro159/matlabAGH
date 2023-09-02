% m-plik skryptowy: studium_sygnalow_losowych.m
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% (C) P.Korohoda, 17 grudnia 2021 r.

clc; clear; close all;

fp=22050;  % mozna zmienic i zobaczyc co sie stanie...
dt=1/fp;  t=0:dt:0.05;   Nt=length(t);
K=2^12; % liczba losowañ (ostro¿nie ze zwiêkszaniem);

proces=1;
tic;
for k=1:K
   switch proces 
       case 1
           X(k,1:Nt)=rand*ones(1,Nt);
       case 2
           p0=rand*2*pi;  f0=100; 
           X(k,1:Nt)=0.5*cos(2*pi*f0*t - p0)+0.5;
       case 3
           X(k,1:Nt)=rand(1,Nt);
   end        
end 
czas_w_sekundach=toc

n_test=100;
x_test=X(:,n_test);

    figure(1); Kmax=4;
        for k=1:Kmax
            subplot(Kmax,1,k); plot(t,X(k,:),'b.-'); grid on; hold on;
                               plot(t(n_test),X(k,n_test),'ro','markersize',4,'markerface','r');
                                    ylim([0,1]); xlim([t(1),t(end)]);
        end    
            
    figure(2);
        histogram(x_test,0:0.01:1);
    
% KONIE2C PLIKU