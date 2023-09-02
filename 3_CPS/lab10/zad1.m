clc; clear;
fp = 1250;
fr = 1750;
fs = 8000;
Rr = 43;
Rp = 2;
% buttord(fp/fs,fr/fs,Rp,Rr,'s')

N = 16;
fo = 2*pi*(fp+0.05*(fr-fp));
[ba,aa] = butter(N,fo,"low","s");
[b1,a1] = my_impinvar(ba,aa,fs);
% [b2,a2] = bilinear(ba,aa,fs,fo/(2*pi));

[za,pa,ka] = tf2zp(ba,aa);
[z,p,k] = my_bilinear(za,pa,fs);
[b2,a2] = zp2tf(z,p,ka*k);

[Ha, Fa] = freqs(ba,aa,2*pi*linspace(0,fs,5000));
[H2, F2] = freqz(b2,a2,5000,fs,"whole");
[H1, F1] = freqz(b1,a1,5000,fs,"whole");

iir_1
iir_2
iir_3
iir_4

