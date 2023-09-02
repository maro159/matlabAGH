% m-plik skryptowy: aproksymacja_ortonorm.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Wykorzystane funkcje zewnetrzne:
% calka, il_skalarny, metryka, norma, xtri
%
% Opracowanie: M.Pawlowski, 28.01.2023


clc; clear; close all;

dt=1e-3;
t=-6:dt:6;
lt = length(t); 

M = 10; % liczba cosinusów
N = 50; % ilosc trojkatow w funkcji bazowej; ilosc funkcji bazowych w bazie
T = t(end) - t(1); % szerokość osi czasu
B = zeros([N,lt]); % baza

for i = 1:N % kolejne funkcje bazowe
    for j = 1:N % kolejne trójkąty
        polozenie = (rand()-0.5)*T;
        amp = rand();
        B(i,:) = B(i,:) + xtri(t,polozenie,T/N)*amp;
    end
end

% ortonormalizacja bazy - procedura Grama-Schmidta
Bon = B;
Bon(1,:) = B(1,:)./norma(B(1,:),dt); % normalizacja pierwszego wektora
for k = 2:N
    for m=1:(k-1)
        Bon(k,:) = Bon(k,:) - il_skalarny(B(k,:),Bon(m,:),dt) * Bon(m,:);
    end
    Bon(k,:) = Bon(k,:)./norma(Bon(k,:),dt); % normalizacja wektorów od 2 do k
end

% Bon - baza ortonormalna

% sygnał testowy
syg = zeros(1,lt);
for i = 1:M
    f = rand(); 
    faza = (rand()-0.5)*T;
    amp = rand();
    syg = syg + cos(2*pi*f*(t-faza));
end


% sprawdzenie czy baza jest liniowa niezalezna
if (rank(Bon) == N)
    disp("jest liniowa niezalezna");
end

% sprawdzenie czy baza jest ortonormalna
A_check = zeros(N,N); % macierz iloczynów skalarnych
for i = 1:N
    for j = 1:N
        A_check(i,j) = il_skalarny(Bon(j,:),Bon(i,:),dt);
    end
end
A_check = A_check - eye(N);

blad_ortonorm_max = max(abs(A_check(:)))
if blad_ortonorm_max < 1e-14 % akceptowalny blad
    disp("jest ortonormalna");
end


% aproksymacja
a = zeros(N,1);
for n = 1:N
    a(n,:) = il_skalarny(syg,Bon(n,:),dt);
end


syg_aprox = 0;
for n = 1:N
    syg_aprox = syg_aprox + a(n,:) * Bon(n,:);
end

blad_aprox_max = max(abs(syg-syg_aprox))


% wykresy

% baza - po prawej ortonormalna
figure(2);
subplot(N,2,1);
plot(t,B(1,:));
title("Wektory bazy nieortonormalnej")
xlabel("t");
ylabel("x");
subplot(N,2,2);
plot(t,Bon(2,:));
title("Wektory bazy ortonormalnej")
xlabel("t");
ylabel("x");
for n = 2:N
    subplot(N,2,2*n-1);
    plot(t,B(n,:));
    xlabel("t");
    ylabel("x");
    subplot(N,2,2*n);
    plot(t,Bon(n,:));
    xlabel("t");
    ylabel("x");
end

% sygnał i aproksymacja
figure(1);
plot(t,syg,'b'); hold on;
plot(t,syg_aprox, 'r');
plot(t,syg-syg_aprox, 'g');
title("Aproksymacja sygnału w bazie ortonormalnej")
xlabel("t");
ylabel("x");
legend("syg", "syg aprox", "aprox error")

% EOF

