clc; clear; close all;

dt=1e-3;
t = -5:dt:5-dt;

% X = xpi(t,1,4) - j*xpi(t,-1,4);
% X = (xpi(t,1,4) - j*xpi(t,-1,4)) .* (xpi(t,1,4) + j*xpi(t,-1,4));
X = sinc(t) + j*sin(t);


figure(1);
subplot(2,2,1);
plot(t,real(X));
title("real");
xlabel("t");
ylim([-1,2]);

subplot(2,2,2)
plot(t,imag(X));
title("imag");
xlabel("t");
ylim([-1,1]);

subplot(2,2,3)
plot(t,angle(X)/pi);
title("angle");
xlabel("t");
ylabel("pi")
ylim([-1,1]);

subplot(2,2,4)
plot(t,abs(X));
title("abs");
xlabel("t");
% ylim([-1,1]);


figure(2);
plot3(t, real(X), imag(X), 'o');
xlabel("t"); ylabel("real");zlabel("imag"); grid on;
