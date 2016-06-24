%˫����ʱģ�������ӳ���fuzzy_Deduce.m
function [FU,feec]=fuzzy_deduce(fe,fec,R)
% FU      ��ʾ(E'��EC')��R
% feec    ��ʾE'��EC'
% fe      ��ʾeģ�������Ӧ��ģ���Ӽ�����Ӧ�������Ⱥ���
% fec     ��ʾecģ�������Ӧ��ģ���Ӽ�����Ӧ�������Ⱥ���
% R       ��ʾȫ����򹹳ɵ�ģ����ϵ

%#######################����E��EC#####################################
n=0;
nfe=size(fe,2);                                                             % nfe ��ʾE�ĵȼ�������,ʾ��1��������Ϊ{-6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6}
nfec=size(fec,2);                                                           % nfec ��ʾEC�ĵȼ�������,ʾ��1��������Ϊ{-6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6}
nfu=size(R,2);                                                              % nfu ��ʾU�ĵȼ�������,ʾ��1��������Ϊ{-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7}
feec=zeros(nfe*nfec,1);
fu=zeros(nfe*nfec,1);
FU=zeros(1,nfu);
for i=1:nfe
    for j=1:nfec
        n=n+1;
        if fe(i)<fec(j)
            feec(n)=fe(i);
        else
            feec(n)=fec(j);
        end
    end
end
%#######################����(E��EC)��R################################
for l=1:nfu
    for i=1:n
        if feec(i)<R(i,l)
            fu(i)=feec(i);
        else
            fu(i)=R(i,l);
        end
        FU(l)=max(fu);
    end
end
