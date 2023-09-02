function [b,a] = my_impinvar(ba,aa,fs)

Ts = 1/fs;
[r,p,K] = residue(ba,aa);
b_tmp = Ts*r;
a_tmp = exp(Ts*p);
[b,a] = residue(b_tmp,a_tmp,K);

end

