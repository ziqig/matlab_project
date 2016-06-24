%ģ����ϵ�����ӳ���fuzzy_relation.m
function [R,n,nE,nEC,nU,nfe,nfec,nfu]=fuzzy_relation(Me,Mec,Mu,UC)
% Me  �����ȱ�1
% Mec �����ȱ�2
% Mu  �����ȱ�3
% UC  ģ������
% R ��ʾȫ����򹹳ɵ�ģ����ϵ
% n=nfe��nfec
% nE ģ������E������ֵ����
% nEC ��ʾģ������EC������ֵ����
% nU ��ʾģ������U������ֵ����
% nfe ��ʾE�ĵȼ�������,ʾ��1��������Ϊ{-6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6}
% nfec ��ʾEC�ĵȼ�������,ʾ��1��������Ϊ{-6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6}
% nfu ��ʾU�ĵȼ�������,ʾ��1��������Ϊ{-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7}
% Me ��ʾE�������ȱ�
% Mec ��ʾEC�������ȱ�
% Mu��ʾU�������ȱ�
% UC��ʾ�����

nE=size(Me,1);                                                              %ģ������E������ֵ����
E=nE:-1:1;                                                                  %E(1:nE)���α�ʾE��ģ�������Ӽ�An,An-1,...,A1
nfe=size(Me,2);                                                             %E�ĵȼ�������,������Ϊ{-(nfe-1)/2  ... -1 0 1 ... (nfe-1)/2}

nEC=size(Mec,1);                                                            %ģ������EC������ֵ����
EC=nEC:-1:1;                                                                %EC(1:nEC)���α�ʾEC��ģ�������Ӽ�Bn,Bn-1,...,B1
nfec=size(Mec,2);                                                           %EC�ĵȼ�������,������Ϊ{-(nfec-1)/2  ... -1 0 1 ... (nfec-1)/2}

nU=size(Mu,1);                                                              %ģ������U������ֵ����                                                      
nfu=size(Mu,2);                                                             %U�ĵȼ�������,
                                               
nfc=size(UC,2);                                                             %ģ��������Ʊ�����
mfc=size(UC,1);                                                             %ģ��������Ʊ�����
%###########################����R=��E��EC��U��#############################
%######�ֽ����ΪR=��R(i,j) (i=1->mfc,j=1->nfc,�ű�ʾmax(a,b))##############
%#R(i,j)=E(i)��EC(j)��U(i,j)=reshape((E(i))'��EC(j))',nfe*nfec,1)��U(i,j)##
%#####��Ϊ�ϳ��������������ο��ϳ����������.docx##########################
%#####�ڱ������ܹ���7��7=49������###########################################
R=zeros(nfe*nfec,nfu);
Reec=zeros(nfe,nfec);
Reecu=zeros(nfe*nfec,nfu);
for i=1:mfc
    for j=1:nfc
        %E��EC
        ie=E(j);
        iec=EC(i);
        for k=1:nfe
            for l=1:nfec
                if Me(ie,k)<Mec(iec,l)
                    Reec(k,l)=Me(ie,k);
                else
                    Reec(k,l)=Mec(iec,l);
                end
            end
        end
        %E��EC��U
        iu=UC(i,j);                                                         %ģ�������i�У�j������Ӧ��U��ģ���Ӽ�  
        n=0;
        for k=1:nfe
            for l=1:nfec
                n=n+1;
                for t=1:nfu
                    if Reec(k,l)<Mu(iu,t)
                        Reecu(n,t)=Reec(k,l);
                    else
                        Reecu(n,t)=Mu(iu,t);
                    end
                end
            end
        end
        for k=1:n
            for l=1:nfu
                if Reecu(k,l)>R(k,l)
                    R(k,l)=Reecu(k,l);
                end
            end
        end
    end
end
