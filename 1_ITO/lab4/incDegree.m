function B=incDegree(A)
%mnoży wielomian przez x
%zwieksza stopien o 1
 for i=1:length(A)-1
     B(1,i)=A(1,i+1);
 end
 B(1,length(A))=0;
