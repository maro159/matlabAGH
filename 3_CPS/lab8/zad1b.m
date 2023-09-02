fp = 1250;
fr = 1750;
fs = 8000;
Rr = 50;
N = 60;

f = linspace(0,1,N);
f = f(1:end-1);

f_cut_norm = (fr+fp)/(2*fs);
H_design = my_pi(f/f_cut_norm) + my_pi(f/f_cut_norm);

% 
% F1 = linspace(0,fs,1000);
% F1 = F1(1:end-1);
% h1_zeropad = [h1, zeros([1,length(F1)-length(h1)])];
% H1 = fft(h1_zeropad);

plot(f,H_design);