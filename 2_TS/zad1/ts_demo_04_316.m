% m-plik skryptowy: ts_demo_03.m
%
% Teoria sygnalow
% Elektronika, WIEiT, AGH
% 
% Opracowanie: P.Korohoda, 18.10.2022
% Modyfikacja: M.Pawłowski 25.10.2022

clc; clear; close all;



dt=1e-3;  t=-2:dt:2;        % pseudo-ciagla os czasu;
    A=2; f0=2; p0=pi/8;     % zadawane wartosci parametrów sygnalu;  
x=A*exp(j*(2*pi*f0*t-p0));  % sygnal harmoniczny x=x(t);
    x_re   = real(x);
    x_im   = imag(x);
    x_faza = angle(x);
    x_ampl = abs(x);

    y_limits = [-2.25 , 2.25];
    x_limits = [t(1), t(end)];


% WYKRESY

figure(1); clf;

    subplot(4,2,1);
    set(gca,'FontSize',15)
    title('Re(x(t))', FontSize=15);
    grid on;
    ylim(y_limits);
    xlim(x_limits);
    drawXY(1);
    plot(t,x_re,'r-','LineWidth',1);    
    hold off;

    subplot(4,2,3);
    set(gca,'FontSize',15)
    title('Im(x(t))', FontSize=15);
    grid on;
    ylim(y_limits);
    xlim(x_limits);
    drawXY(1);
    plot(t,x_im,'r-','LineWidth',1);
    hold off;

    subplot(4,2,5);
    set(gca,'FontSize',15)
    title('|x(t)|', FontSize=15);
    grid on;
    ylim(y_limits);
    xlim(x_limits);
    drawXY(1);
    plot(t,x_ampl,'r-','LineWidth',1);
    hold off;

    subplot(4,2,7);
    set(gca,'FontSize',15)
    title('\phi(x(t))/\pi', FontSize=15);
    grid on;
    ylim([-1.25,1.25]);
    xlim(x_limits);
    drawXY(1);
    plot(t,x_faza/pi,'r-','LineWidth',1);
    hold off;

    subplot(1,2,2);
    set(gca,'FontSize',15)
    axis('equal');
    title('Płaszczyzna zespolona', FontSize=25);
    grid on;
    ylim(y_limits);
    xlim(y_limits);
    drawXY(2);
    plot(x_re,x_im,'r-','LineWidth',2);
    xlabel("Re(x(t))", FontSize=20);
    ylabel("Im(x(t))", FontSize=20);
    hold off;


    function drawXY(k)
        hold on;
        plot([0 0], ylim, 'k-','LineWidth',k);
        plot(xlim, [0 0], 'k-','LineWidth',k);
    end

% KONIEC