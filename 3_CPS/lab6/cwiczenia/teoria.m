clc; clear;

fs = 1000;
N = 39;
Ts = 1/fs;

t=0:Ts:Ts*(N-1);
t_cont = 0:1e-4:t(end);

s1 = @(t)2+6*sin(2*pi*200*t+0.3*pi);
s2 = @(t)-3*sin(2*pi*700*t-0.5*pi);
s = s1(t) + s2(t);
s_cont = s1(t_cont) + s2(t_cont);

window = hann(N).';
widnow_cont = hann(length(s_cont)).';

s = s.* window;
s_cont = s_cont .* widnow_cont;

y = fft(s)/N;
f = 0:1:N-1;
f = f* (fs/N);

subplot(2,1,1);
plot(t_cont,s_cont); hold on;
stem(t,s); hold off;
subplot(2,1,2);
stem(f,abs(y));


