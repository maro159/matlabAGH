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

fir_1
fir_3
