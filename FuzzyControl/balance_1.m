function c = balance_1(A)
%��Ȩƽ���������ķ������������������������
Balance_U=[-6	-5	-4	-3	-2	-1	0	1	2	3	4	5	6];
sum1=0;
sum2=0;
for i = 1 : 1 : length(A)
    sum1=sum1+A(i);
    sum2=sum2+Balance_U(i)*A(i);
end
c=sum2/sum1;
 

     
     
 

 
 
 