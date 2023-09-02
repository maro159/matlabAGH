clc; clear; close all;


fp = 1250;
fr = 1750;
fs = 8000;
Rr = 50;
N = 60;

n = -N/2:N/2;
h1 = (((fr+fp)/(fs)))*sinc(n*2*(fr+fp)/(2*fs));
h1 = h1 .* hamming(N+1).';

F1 = linspace(0,fs,1000);
F1 = F1(1:end-1);
h1_zeropad = [h1, zeros([1,length(F1)-length(h1)])];
H1 = fft(h1_zeropad);

Ts= 1/fs;
t = 0:Ts:100*(Ts);
f = [450,1200,1800,3150];
s = 0;
for i=1:length(f)
    s = s+ sin(2*pi*f(i)*t);
end

s_filtr = conv(s,h1);

FFT1 = abs(fft(s));
FFT2 = abs(fft(s_filtr));
f1 = linspace(0,1,length(FFT1)+1) * fs;
f1 = f1(1:end-1)
f2 = linspace(0,1,length(FFT2)+1) * fs;
f2 = f2(1:end-1)

stem(f1, FFT1); hold on;
stem(f2, FFT2); hold off;


