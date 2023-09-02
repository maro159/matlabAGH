clc; clear; close all;
N=30;
e=0;
for n = 0:N
    e = e + 1/factorial(n);
end

exp(1)
e
error=(exp(1)-e)/exp(1)
