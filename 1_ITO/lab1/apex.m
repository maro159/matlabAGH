function [p,q] = apex(A)
% zadanie 2
% 11.02.2022
% maro159
%
    p = -A(2)/(2*A(1));
    delta = A(2)^2 - 4 * A(1) * A(3);
    q = -delta/(4*A(1));
end

