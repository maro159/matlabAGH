clc; clear; close all;

N=2^14+1; % liczba punktów na osi czasu - dodanie "1" powoduje, ze nie trafiamy "pomiedzy" z przeskokiem w funkcji xpi;
K = 2;   
tmin = -4;
tmax = 4;


dt=(tmax-tmin)/(N-1); t=tmin:dt:tmax;


B_walsha = baza_walsha(K,N);
% B_Haara = baza_haara(K,N);


[NH,~] = size(B_walsha);
Ais = zeros([NH,NH]);
% iloczyny skalarne:
for m=1:NH
    for n=1:NH
        x=B_walsha(n,:); y=B_walsha(m,:);
        Ais(m,n)=calka(x.*y,dt);
    end
end 

% ponowna normalizacja
B_walsha = B_walsha./sqrt(Ais(1));

Ais2 = zeros([NH,NH]);
% iloczyny skalarne:
for m=1:NH
    for n=1:NH
        x=B_walsha(n,:); y=B_walsha(m,:);
        Ais2(m,n)=calka(x.*y,dt);
    end
end 


nK = 2^(K+1);
figure(1);
for k = 1:nK
    subplot(nK,1,k);
    plot(t,B_walsha(k,:), LineWidth=2);
    ylim([-0.5,0.5]);
end