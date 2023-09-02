clc; clear; close all;

dt=1e-3;
t=-5:dt:5;

% x1 = @(t) xpi(t,1,2);
% x2 = @(t) -2*xpi(t,0,2);
% x1 = @(t) xpi(t,0,8);
% x2 = @(t) xtri(t,0,2);
x1 = @(t) xpi(t,1,1);
x2 = @(t) xpi(t,2,1);


[c, tt] = splot(x1(t),x2(t),t(1),t(1),dt);

figure(1);

subplot(3,1,1);
plot(t,x1(t));
subplot(3,1,2);
plot(t,x2(t));
subplot(3,1,3);
plot(tt,c);
