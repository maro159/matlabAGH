clc; clear;
% close all;

N = 5; % liczba próbek
use_window = true; % określa czy używać okna do poprawy transmitancji -> niwelowanie zafalowań

df = 1e-4;

H = @(f) xpi_mod(f,0.15,0.125) + xpi_mod(f,1-0.15,0.125); % pożądana funkcja transmitancji
% H = @(f) xpi_mod(f,0.25,0.05) + xpi_mod(f,0.75,0.05); % pożądana funkcja transmitancji

f_cont = 0:df:1-df; % pseudo-ciągła oś częstotliwości [0,1]
H_cont = H(f_cont); % pożądana transmitancja na osi [0,1]
f_samp = linspace(0,1,N+1); % dyskretna oś częstotliwości [0,1]
f_samp = f_samp(1:end-1); % obcięcie do [0,1)
H_samp = H(f_samp); % spróbkowana pożądana transmitancja

h_shift = ifft(H_samp); % obliczenie odpowiedzi impulsowej o N próbkach
h = fftshift(h_shift); % przesunięcie kołowe -> współczynniki filtru

if use_window
    window = blackman(N).'; % generowanie okna
    h = h .* window; 
end

% H_cont_result = zeros(size(f_cont)); % tu będzie wynikowa transmitancja
% Z = exp(2*pi*j*f_cont); % Z-transform -> Fourier-transform
% 
% for n = 1:length(h)
%     H_cont_result = H_cont_result + h(n) .* Z.^(-n); % obliczenie wynikowej transmitancji
% end

zeros_to_add = length(f_cont) - length(h);
h_zero_pad=[h,zeros(1,zeros_to_add)];
H_cont_result = fft(h_zero_pad);

subplot(2,2,1)
plot(f_cont,H_cont); hold on; % pożądana transmitancja
stem(f_samp,H_samp); % spróbkowana pożądana transmitancja
plot(f_cont,abs(H_cont_result)); hold off; % wynikowa transmitancja
title("|H(f)|")
legend("H_{design}", "H_{sampled}", "H_{result}",Location='bestoutside')
xlabel("f_{norm}")

subplot(2,2,2)
plot(f_cont,rad2deg(angle(H_cont_result)), Color='#EDB120'); % wynikowa faza
xlabel("f_{norm}")
ylabel("degrees")

subplot(2,2,3)
plot(0:N-1,real(h));
title("real(h(n))")
xlabel("n")

subplot(2,2,4)
plot(0:N-1,imag(h));
title("imag(h(n))")
xlabel("n")

