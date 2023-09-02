function [z,p,k] = my_bilinear(za,pa,fs)

Ts = 1/fs;
z = zeros(size(za));
p = zeros(size(pa));
K = 2/Ts;

k = 1;
for i=1:length(za)
    z(i) = (K + za(i)) / (K - za(i));
    k = k*(2*fs - za(i))/(2*fs - pa(i))
end
for i=1:length(pa)
    p(i) = (K + pa(i)) / (K - pa(i));
end

end



