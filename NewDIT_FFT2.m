function NewDIT_FFT2(xn)
%自编函数NewDIT_FFT2实现基2 DIT-FFT算法

M=nextpow2(length(xn)); N=2^M;          %送入x(n),M
if length(xn)<N
    xn=[xn,zeros(1,N-length(xn))];      %用零补齐序列长度
end
for m=0:N/2-1;                          %设置旋转因子指数的范围
    WN(m+1)=exp(-1i*2*pi/N)^m;
end
disp('输入到各储存单元的数据：'),disp(xn);

%数据倒序操作
J=0;                                    %倒序数初始值设为零
for O=0:N-1;                            %按序计算倒序数
    if O<J;                             %数据交换
        T=xn(O+1);xn(O+1)=xn(J+1);xn(J+1)=T;
    end
    K=N/2;                              %计算后续的倒序数
    while J>=K;
        J=J-K;K=K/2;
    end
    J=J+K;
end
disp('倒序后各储存单元的数据：'),disp(xn);

%分级依次按序进行蝶形运算
for L=1:M;                              %分级
    disp('运算级次：'),disp(L);
    B=2^(L-1);
    for R=0:B-1;                        %各级按序蝶算
        P=2^(M-L)*R;
        for K=R:2^L:N-2;                %每序依次计算
            T=xn(K+1)+xn(K+B+1)*WN(P+1);
            xn(K+B+1)=xn(K+1)-xn(K+B+1)*WN(P+1);
            xn(K+1)=T;
        end
    end
    disp('本级运算后各储存单元的数据:'),disp(xn);
end
end

%测试所用xn=[0,1,2,3,4,5,6,7]
%y=fft(xn)的结果与本函数NewDIT_FFT2(xn)的计算结果相同