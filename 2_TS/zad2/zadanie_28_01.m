

y = 2 * rand * sin(t);

for n = 1:N
    c(n) = 4 * rand;
end;
d = 4 * rand;

dt=0.0001; t=0:dt:4;
x=xtri(t,0.25,0.5)-xtri(t,0.75,0.5);
N=4;
v(1).x=xtri(t,c(1),d);
v(2).x=xtri(t,c(2),d);
v(3).x=xtri(t,c(3),d);
v(4).x=xtri(t,c(4),d);

b(1).x =  v(1).x/sqrt(calka(v(1).x .* conj(v(1).x),dt));
for k = 2:N
    for m = 1:(k-1)
        p(1).x = 0;
        p(k).x = p(1).x + calka(v(k).x .* conj(b(m).x),dt);
    end
    u(k) = v(k).x - sum(p(all));
    b(k) = u(k)/sqrt( calka(u(k) .* conj(u(k)),dt));
end;


figure(1)
    subplot (4,1,1)
        plot(t,v(1).x,'b-');grid on;hold on;
    subplot (4,1,2)
        plot(t,v(2).x,'b-');grid on;hold on;
     subplot (4,1,3)
        plot(t,v(3).x,'b-');grid on;hold on;
     subplot (4,1,4)
        plot(t,v(4).x,'b-');grid on;hold on;