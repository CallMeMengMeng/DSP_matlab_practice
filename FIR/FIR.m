%FIR Filter的设计实现
clear all;clc;
%调用xtg产生信号xt，xt长度N=1000，并显示xt的波形与频谱
N=1000;xt=xtg(N);
fp=120;fs=150;Rp=0.2;As=60;Fs=1000;T=1/Fs;

%窗函数法
wc=(fp+fs)/Fs;%归一化
B=2*pi*(fs-fp)/Fs;
Nb=ceil(11*pi/B);
hn1=fir1(Nb-1,wc,blackman(Nb));
Hw=abs(fft(hn1,1024));
ywt=fftfilt(hn1,xt,N);%调用函数对xt滤波
%绘制波形
figure(2)
y1t='y_l(t)';
subplot(2,1,1);myplot(hn1,1);axis([0,1,-120,5]);title('(a) 低通滤波器幅频特性');
subplot(2,1,2);tplot(ywt,T,y1t);title('(b) 滤除噪声后的信号波形');

%等波纹最佳逼近法
fb=[fp,fs];m=[1,0];
dev=[(10^(Rp/20)-1)/(10^(Rp/20)+1),10^(-As/20)];
[Ne,fo,mo,W]=remezord(fb,m,dev,Fs);
hn2=remez(Ne,fo,mo,W);
Hw=abs(fft(hn2,1024));
yet=fftfilt(hn2,xt,N);
%绘制波形
figure(3)
y2t='y_e(t)';
subplot(2,1,1);myplot(hn2,1);axis([0,1,-80,5]);title('(a) 低通滤波器幅频特性');
subplot(2,1,2);tplot(yet,T,y2t);title('(b) 滤除噪声后的信号波形');