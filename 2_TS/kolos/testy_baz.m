clc; clear; close all;

N=2^14+1; % liczba punktów na osi czasu - dodanie "1" powoduje, ze nie trafiamy "pomiedzy" z przeskokiem w funkcji xpi;
K = 2;   

dt=1/(N-1); t=0:dt:1;



B_kanoniczna = baza_kanoniczna(K,N);
B_walsha = baza_walsha(K,N);
B_Haara = baza_haara(K,N);

nK = 2^(K+1);
figure(1)
for k = 1:nK
    subplot(nK,3,3*k-2);
    plot(t,B_kanoniczna(k,:), LineWidth=2);

    subplot(nK,3,3*k-1);
    plot(t,B_walsha(k,:), LineWidth=2);

    subplot(nK,3,3*k);
    plot(t,B_Haara(k,:), LineWidth=2);
end
