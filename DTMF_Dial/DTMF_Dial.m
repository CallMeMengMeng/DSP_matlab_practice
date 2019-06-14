%DTMF双频拨号信号的生成和检测程序
%clear all;clc;
tm=[1,2,3,65;4,5,6,66;7,8,9,67;42,0,35,68];
N=205;K=[18,20,22,24,31,34,38,42];
f1=[697,770,852,941];%行频率向量
f2=[1209,1336,1477,1633];%列频率向量
TN=input('键入6位电话号码=');
TNr=0;
for l=1:6
    d=fix(TN/10^(6-l));
    TN=TN-d*10^(6-l);
    for p=1:4
        for q=1:4
            if tm(p,q)==abs(d);break,end%检测码相符的列号q
        end
        if tm(p,q)==abs(d);break,end%检测码相符的行号p
    end
    n=0:1023;
    x=sin(2*pi*n*f1(p)/8000)+sin(2*pi*n*f2(q)/8000);%构成双频信号
    sound(x,8000);
    pause(0.1)
    %接收检测端的程序
    X=goertzel(x(1:205),K+1);
    val=abs(X);
    subplot(3,2,l);
    stem(K,val,'.');grid;xlabel('k');ylabel('|X(k)|');axis([10 50 0 120]);
    limit=80;
    for s=5:8
        if val(s)>limit,break,end%查找列号
    end
    for r=1:4
        if val(r)>limit,break,end%查找行号
    end
    TNr=TNr+tm(r,s-4)*10^(6-l);
end
disp('接收端检测到的号码为：')
disp(TNr)
    
        