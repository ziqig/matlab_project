function C = A_have_B(A,B)
% C = A -> B,�̺�����������A��������,B��������
for i = 1 : 1 : length(A)
    for j = 1 : 1 : length(B)
        C(i,j) = min_1(A(i),B(j));
    end
end
