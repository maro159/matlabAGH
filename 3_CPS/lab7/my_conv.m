function c = my_conv(a,b)
L = length(a)+length(b)-1;

c = zeros([1,L]);
a = [a, zeros([1,L-length(a)])];
b = [b, zeros([1,L-length(b)])];

for n=1:length(c)
    for m=1:length(b)
        if (n-m+1) > 0
            c(n) = c(n) + a(n-m+1)*b(m);
        end
    end
end