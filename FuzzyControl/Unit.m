function G = Unit(A,B,C,D,F)
% ����A��C�ǵ���ģ��������������B��D��F�ֱ��Ƕ�Ӧ�ſ��ƹ���������ʾ
% ���GΪ�������ƹ����Ӧ��һ��ģ�����
% ʵ�ֱ��ʽ Ao(B ->F)��Co(D ->F)
G = A_jiao_B((A_compose_B(A,A_have_B(B,F))),(A_compose_B(C,A_have_B(D,F))));