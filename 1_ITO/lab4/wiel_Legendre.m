function A = wiel_Legendre(n)
%Funkcja zwraca macierz, będąca zestawem n współczynników
%wielomianów Legendre'a o stopniach od 0 do n-1
%współczynniki wielomianów to kolejne wiersze zwracanej macierzy

%np. 4 wielomiany -> 3 stopień max, 4 współczynniki

a0=[1];
A(1,:)=[zeros(1,n-1), a0];

if n>1
a1=[1,0];
A(2,:)=[zeros(1,n-2), a1];
end

for i=2:n-1
    wsp1=(2*(i-1)+1)/(i);
    wsp2=(-i+1)/(i);
    
    Ai=wsp1*A(i,:);
    Ai=incDegree(Ai);
    Ai=Ai+(wsp2*A(i-1,:));
    A(i+1,:)=Ai;
end




