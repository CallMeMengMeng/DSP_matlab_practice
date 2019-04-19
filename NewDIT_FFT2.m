function NewDIT_FFT2(xn)
%�Աຯ��NewDIT_FFT2ʵ�ֻ�2 DIT-FFT�㷨

M=nextpow2(length(xn)); N=2^M;          %����x(n),M
if length(xn)<N
    xn=[xn,zeros(1,N-length(xn))];      %���㲹�����г���
end
for m=0:N/2-1;                          %������ת����ָ���ķ�Χ
    WN(m+1)=exp(-1i*2*pi/N)^m;
end
disp('���뵽�����浥Ԫ�����ݣ�'),disp(xn);

%���ݵ������
J=0;                                    %��������ʼֵ��Ϊ��
for O=0:N-1;                            %������㵹����
    if O<J;                             %���ݽ���
        T=xn(O+1);xn(O+1)=xn(J+1);xn(J+1)=T;
    end
    K=N/2;                              %��������ĵ�����
    while J>=K;
        J=J-K;K=K/2;
    end
    J=J+K;
end
disp('���������浥Ԫ�����ݣ�'),disp(xn);

%�ּ����ΰ�����е�������
for L=1:M;                              %�ּ�
    disp('���㼶�Σ�'),disp(L);
    B=2^(L-1);
    for R=0:B-1;                        %�����������
        P=2^(M-L)*R;
        for K=R:2^L:N-2;                %ÿ�����μ���
            T=xn(K+1)+xn(K+B+1)*WN(P+1);
            xn(K+B+1)=xn(K+1)-xn(K+B+1)*WN(P+1);
            xn(K+1)=T;
        end
    end
    disp('�������������浥Ԫ������:'),disp(xn);
end
end

%��������xn=[0,1,2,3,4,5,6,7]
%y=fft(xn)�Ľ���뱾����NewDIT_FFT2(xn)�ļ�������ͬ