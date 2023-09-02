function X = wz_cardano(A)
%% zastosowanie wz cardano
%% A = [a3, a2, a1, a0]
A=A/A(1);

p = (3*A(3)-A(2)^2) / 9;
q = (A(2)^3)/27 - A(2)*A(3)/6 + A(4)/2;
d = q^2 + p^3;

%%AA = [1, 0, 3*p, 2*q];

u = (-q+d^(1/2))^(1/3);
v = (-q-d^(1/2))^(1/3);

Y(1) = u+v;
Y(2) = u*exp(j*((-pi)*(2/3))) + v*exp(-j*((-pi)*(2/3)));
Y(3) = u*exp(j*(pi*(2/3))) + v*exp(-j*(pi*(2/3)));

Y=Y.';

X = Y-(A(2)/3);
X = sort(X,"descend");

%% KONIEC

