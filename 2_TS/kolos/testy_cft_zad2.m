clc; clear; close all;

dt = 1e-6;
t = -5:dt:5-dt;
N = length(t);



% x = @(t) sin(2*pi*t) + cos(2*pi*t) + cos(4*pi*t);
% x = @(t) sinc(t) .* cos(2*pi*0.5*t);
% x = @(t) xpi(t,1,2) + xtri(t,2,4);
x = @(t) (xpi(t,1,4) - j*xpi(t,-1,4)) .* (xpi(t,1,4) + j*xpi(t,-1,4));
 
xt = x(t);

tic;
[X,f] = cft(x(t),t);
czas1 = toc

% dla poprawy wyświetlania kąta
X(abs(X)<1e-6)=0;

% tic;
% for k=1:N
%    X_(k)=calka(xt.*exp(-j*2*pi*f(k)*t),dt);
% end    
% czas2 = toc

% X_ = 2*((sinc(2*f)).^2).*exp(-2*j*pi*f*2) + 2*sinc(2*f).*exp(-j*2*pi*f);
X_ = 8*sinc(4*f) .* cos(2*pi*f);

figure(1);
subplot(3,1,3);
plot(t,xt);

subplot(3,2,1);
plot(f,real(X)); hold on;
plot(f,real(X_));
title("real");
xlim([-10,10]);
subplot(3,2,2)
plot(f,imag(X)); hold on;
plot(f,imag(X_));
title("imag");
xlim([-10,10]);
subplot(3,2,3)
plot(f,angle(X)); hold on;
plot(f,angle(X_));
title("angle");
xlim([-10,10]);
subplot(3,2,4)
plot(f,abs(X)); hold on;
plot(f,abs(X_));
title("abs");
xlim([-10,10]);
