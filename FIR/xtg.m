function xt=xtg(N)
%产生信号x(t)，并显示信号的幅频特性曲线
%采样频率Fs=1KHz，载波频率fc=Fs/10=100Hz
N=2000;Fs=1000;T=1/Fs;Tp=N*T;
t=0:T:(N-1)*T;
fc=Fs/10;f0=fc/10;%设置载波频率与单频调制信号的频率
mt=cos(2*pi*f0*t);%产生单频正弦波调制信号
ct=cos(2*pi*fc*t);%产生载波正弦波调制信号
xt=mt.*ct;
nt=2*rand(1,N)-1;%产生随机噪声nt

%设计高通滤波器hn,滤除噪声nt中的低频部分
fp=150;fs=200;Rp=0.1;As=70;
fb=[fp,fs];m=[0,1];
dev=[10^(-As/20),(10^(Rp/20)-1)/(10^(Rp/20)+1)];
[n,fo,mo,W]=remezord(fb,m,dev,Fs);%确定remez函数所需要的参数
hn=remez(n,fo,mo,W);
yt=filter(hn,1,10*nt);

xt=xt+yt;
fst=fft(xt,N);k=0:N-1;f=k/Tp;
figure(1);
subplot(2,1,1);plot(t,xt);grid;xlabel('t/s');ylabel('x(t)');
axis([0,Tp/5,min(xt),max(xt)]);
title('(a) 信号加噪声波形');
subplot(2,1,2);plot(f,abs(fst)/max(abs(fst)));grid;xlabel('f/Hz');ylabel('幅度');
axis([0,Fs,0,1.2]);
title('(b) 信号加噪声的频谱');
end

