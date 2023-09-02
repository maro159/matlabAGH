clc; clear; close all;

%% FILTR
H = @(f) xpi_mod(f,0,0.25) + xpi_mod(f,1,0.25); % pożądana funkcja transmitancji
N_fir = 64;
use_window = false;
display_fir = true;

[h, f_result, H_result] = design_fir(N_fir,H,use_window,display_fir);

%% SYGNAŁ
fs = 44100; % częstotliwość próbkowania
N = 128;    % liczba próbek

Ts = 1/fs;  % okres próbkowania
tx = 0:Ts:(N-1)*Ts;                         % czas dla sygnału we
ty = 0:Ts:(length(tx)+length(h)-2)*Ts;    % czas dla sygnału wy (minus 2 bo liczone od zera i splot)

x = chirp(tx,1,tx(end),fs*0.45);       % sygnał we - próbki
y = conv(x,h);                      % sygnał wy - próbki

[tx_cont, x_aprox] = rec(x,fs);     % sygnał we - pseudo-ciągły
[ty_cont, y_aprox] = rec(y,fs);     % sygnał wy - pseudo-ciągły

%% to samo z oknem
use_window = true;
[h, f_result, H_result] = design_fir(N_fir,H,use_window,display_fir);
y_window = conv(x,h);               % sygnał wy - próbki
[ty_cont_window, y_aprox_window] = rec(y_window,fs);     % sygnał wy - pseudo-ciągły

%% WYKRESY
figure()
c = colororder;

subplot(2,1,1)
plot(tx, x, 'o', Color="#0072BD"); hold on;
plot(ty, y, 'o', Color="#D95319");
plot(tx_cont, x_aprox, Color="#0072BD");
plot(ty_cont, y_aprox, Color="#D95319"); hold off;
title("filtracja z oknem prostokątnym");

subplot(2,1,2)
plot(tx, x, 'o', Color="#0072BD"); hold on;
plot(ty, y_window, 'o', Color="#D95319");
plot(tx_cont, x_aprox, Color="#0072BD");
plot(ty_cont_window, y_aprox_window, Color="#D95319"); hold off;
title("filtracja z oknem Hanna");
