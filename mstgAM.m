function st=mstgAM
%产生信号序列向量st，并显示st的时域波形和频谱；
%mstg返回三路调幅信号相加形成的混合信号N=1600;
N=1600;
Fs=10000;T=1/Fs;Tp=N*T;%采样频率Fs=10KHz,Tp=为采样时间
t=0:T:(N-1)*T;k=0:N-1;f=k/Tp;
fc1=Fs/10;%第1路载波信号；
fm1=fc1/10;%第1路调制信号
fc2=Fs/20;%第2路载波信号；
fm2=fc2/10;%第2路调制信号
fc3=Fs/40;%第3路载波信号；
fm3=fc3/10;%第3路调制信号
xt1=[3+cos(2*pi*fm1*t)].*cos(2*pi*fc1*t);%产生第1路信号
xt2=[3+cos(2*pi*fm2*t)].*cos(2*pi*fc2*t);%产生第2路信号
xt3=[3+cos(2*pi*fm3*t)].*cos(2*pi*fc3*t);%产生第3路信号
st=xt1+xt2+xt3;%三路调幅信号相加
fxt=fft(st,N);      %计算频谱

%==========产生波形图==========================
figure(1)
subplot(2,1,1)
plot(t,st);grid;xlabel('t/s');ylabel('s(t)');
axis([0,Tp/8,min(st),max(st)]);title('(a) s(t)的波形');
subplot(2,1,2)
stem(f,abs(fxt)/max(abs(fxt)),'.');grid;title('(b) s(t)的频率谱');
axis([0,Fs/5,0,1.2]);
xlabel('f/Hz');ylabel('幅度');
