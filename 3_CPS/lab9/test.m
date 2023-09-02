H127=zeros(1,127);
H127(1:7)=1;
H127(127:-1:127-5)=1;
h127=real(ifft(H127))
h=h127;

h1016=[h(1:64), zeros(1,1016-127),h(65:127)]
H1016=fft(h1016);
plot(1:509,abs(H1016(1:509)));
hold on
plot(1:8:509, abs(H1016(1:8:509)),'r');

figure(2);
plot(1:509,angle(H1016(1:509)));
hold on
plot(1:8:509,angle(H1016(1:8:509)).*abs(H1016(1:8:509)),'r');
