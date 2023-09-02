function P = zero_points(A)
% zadanie 1
% 11.02.2022
% maro159
% 
% zero_points([1 2 0])
%
    sqrt_delta = sqrt(A(2)^2 - 4 * A(1) * A(3));
    x1 = (- A(2) - sqrt_delta)/(2*A(1));
    x2 = (- A(2) + sqrt_delta)/(2*A(1));
    P = [x1; x2];
end