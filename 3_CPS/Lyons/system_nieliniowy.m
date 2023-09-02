f0 = 1;
N = 32;

t = linspace(0,1,N+1);
t = t(1:end-1);
x1 = sin(2*pi*1*t);
x2 = sin(2*pi*3*t);
x3 = x1+x2;

sys = @(x) x.*x;

y1 = sys(x1);
y2 = sys(x2);
y3 = sys(x3);

Y1 = abs(fft(y1))/N;
Y2 = abs(fft(y2))/N;
Y3 = abs(fft(y3))/N;

x=[x1;x2;x3];
y=[y1;y2;y3];
Y=[Y1;Y2;Y3];

[i_max, ~] = size(Y);

figure()
for i=1:i_max
    subplot(i_max,3,i*3-2)
    stem(t*N,x(i,:));
    subplot(i_max,3,i*3-1)
    stem(t*N,y(i,:));
    subplot(i_max,3,i*3-0)
    stem(t*N,Y(i,:));
    xlim([0,15]);
    ylim([0,1])
end
