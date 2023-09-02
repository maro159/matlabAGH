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

% sygnał testowy
syg = zeros(1,lt);
for i = 1:M
    f = rand(); 
    faza = (rand()-0.5)*T;
    amp = rand();
    syg = syg + cos(2*pi*f*(t-faza));
end


% sprawdzenie czy baza jest liniowa niezalezna
if (rank(B) == N)
    disp("jest liniowa niezalezna");
end


% aproksymacja
b = zeros(N,1);
for n = 1:N
    b(n,:) = il_skalarny(syg,B(n,:),dt);
end

A = zeros(N,N);
for i = 1:N
    for j = 1:N
        A(i,j) = il_skalarny(B(j,:),B(i,:),dt);
    end
end

a = A^(-1) * b;

syg_aprox = 0;
for n = 1:N
    syg_aprox = syg_aprox + a(n,:) * B(n,:);
end

error = max(abs(syg-syg_aprox))


% wykresy

% baza
figure(2);
for n = 1:N
    subplot(N,1,n);
    plot(t,B(n,:));
end

% sygnał i aproksymacja
figure(1);
plot(t,syg,'b'); hold on;
plot(t,syg_aprox, 'r');
plot(t,syg-syg_aprox, 'y');



