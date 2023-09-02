clc; clear; close all;

fs = 3000;
Ts = 1/fs;
N = 15;

s = @(t,f0) sin(2*pi*f0*t);

t = 0:Ts:(N-1)*Ts;
x1 = s(t,600);
x2 = s(t,666);

f = 0:1:N-1;
f = f .* (fs/N);

X1 = fft(x1);
X2 = fft(x2);

X1(abs(X1)<1e-12) = 0;
X2(abs(X2)<1e-12) = 0;

% x1 = [x1,x1];
% x2 = [x2,x2];
% t = 0:Ts:(2*N-1)*Ts;

[t_aprox2,x2_aprox] = rec(x2,fs);
[t_aprox1,x1_aprox] = rec(x1,fs);

% t_cont = 0:1e-6:t(end);
% X1_cont = fft(s(t_cont,600));
% X2_cont = fft(s(t_cont,666));

% figure(1)
% subplot(2,1,1)
% plot(t_aprox2,x2_aprox); hold on;
% plot(t_aprox2, s(t_aprox2, 666));
% stem(t, x2); hold off;
% title("f0=666")
% subplot(2,1,2)
% plot(t_aprox1,x1_aprox); hold on;
% plot(t_aprox1, s(t_aprox1, 600));
% stem(t, x1); hold on;
% title("f0=600")

disp("sum(abs(X1)):   " + sum(abs(X1))/N);
disp("sum(abs(X2)):   " + sum(abs(X2))/N);

figure(2)

subplot(2,2,1)
stem(f,abs(X1)); hold on;
% plot(f_cont, abs(X1_cont));

subplot(2,2,2)
stem(f,abs(X2)); hold on;
% plot(f_cont, abs(X2_cont));

subplot(2,2,3)
stem(f,angle(X1)); hold on;
% plot(f_cont, angle(X2_cont));

subplot(2,2,4)
stem(f,angle(X2)); hold on;
% plot(f_cont, angle(X1_cont));
