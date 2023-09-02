%%x = rand() + j*rand()

a = atan(imag(x)/real(x))
b = atan2(imag(x),real(x))
c = angle(x)

M=abs(x)

a2 = M*exp(j*a)
b2 = M*exp(j*b)
c2 = M*exp(j*c)