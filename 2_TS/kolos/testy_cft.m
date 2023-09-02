clc; clear; close all;

dt = 1e-3;
t = -3:dt:3;
N = length(t);

x1 = @(t) xpi(t,0.5,1);
x2 = @(t) -2*xpi(t,0,2);

x1t = x1(t);
x2t = x2(t);

[X1,f1] = cft(x1(t),t);
[X2,f2] = cft(x2(t),t);


X1ref = sinc(f1).*exp(-j*pi*f1);
X2ref = -4*sinc(2*f2);

% wykresy 1
f = f1;
X = X1;
Xref = X1ref;
xt = x1t;

tic;
for k=1:N
   X_(k)=calka(xt.*exp(-j*2*pi*f(k)*t),dt);
end    
toc

X = X_;

figure(1);
subplot(3,1,3);
plot(t,xt);

subplot(3,2,1);
plot(f,real(X)); hold on;
plot(f,real(Xref));
title("real");
xlim([-10,10]);
subplot(3,2,2)
plot(f,imag(X)); hold on;
plot(f,imag(Xref));
title("imag");
xlim([-10,10]);
subplot(3,2,3)
plot(f,angle(X)); hold on;
plot(f,angle(Xref));
title("angle");
xlim([-10,10]);
subplot(3,2,4)
plot(f,abs(X)); hold on;
plot(f,abs(Xref));
title("abs");
xlim([-10,10]);


% wykresy 2
f = f2;
X = X2;
Xref = X2ref;
xt = x2t;

tic;
for k=1:N
   X_(k)=calka(xt.*exp(-j*2*pi*f(k)*t),dt);
end    
toc

X = X_;

figure(2)
subplot(3,1,3);
plot(t,xt);

subplot(3,2,1);
plot(f,real(X)); hold on; plot(f,real(Xref));
title("real");
xlim([-10,10]);
subplot(3,2,2)
plot(f,imag(X)); hold on; plot(f,imag(Xref));
title("imag");
xlim([-10,10]);
subplot(3,2,3)
plot(f,angle(X)); hold on; plot(f,angle(Xref));
title("angle");
xlim([-10,10]);
subplot(3,2,4)
plot(f,abs(X)); hold on; plot(f,abs(Xref));
title("abs");
xlim([-10,10]);

