function C = A_jiao_B(A,B)
%����A��������,BҲ��������,
%���CҲ��������
for i = 1 : 1 : length(A)
    C(i) = min_1(A(i),B(i));
end