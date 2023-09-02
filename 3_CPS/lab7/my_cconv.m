function cc = my_cconv(a,b)

L = length(a)+length(b)-1;

a = [a, zeros([1,L-length(a)])];
b = [b, zeros([1,L-length(b)])];

cc = ifft(fft(a).*fft(b));
cc = cc(1:L);