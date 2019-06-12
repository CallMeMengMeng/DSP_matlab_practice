function xt=xtg(N)
%�����ź�x(t)������ʾ�źŵķ�Ƶ��������
%����Ƶ��Fs=1KHz���ز�Ƶ��fc=Fs/10=100Hz
N=2000;Fs=1000;T=1/Fs;Tp=N*T;
t=0:T:(N-1)*T;
fc=Fs/10;f0=fc/10;%�����ز�Ƶ���뵥Ƶ�����źŵ�Ƶ��
mt=cos(2*pi*f0*t);%������Ƶ���Ҳ������ź�
ct=cos(2*pi*fc*t);%�����ز����Ҳ������ź�
xt=mt.*ct;
nt=2*rand(1,N)-1;%�����������nt

%��Ƹ�ͨ�˲���hn,�˳�����nt�еĵ�Ƶ����
fp=150;fs=200;Rp=0.1;As=70;
fb=[fp,fs];m=[0,1];
dev=[10^(-As/20),(10^(Rp/20)-1)/(10^(Rp/20)+1)];
[n,fo,mo,W]=remezord(fb,m,dev,Fs);%ȷ��remez��������Ҫ�Ĳ���
hn=remez(n,fo,mo,W);
yt=filter(hn,1,10*nt);

xt=xt+yt;
fst=fft(xt,N);k=0:N-1;f=k/Tp;
figure(1);
subplot(2,1,1);plot(t,xt);grid;xlabel('t/s');ylabel('x(t)');
axis([0,Tp/5,min(xt),max(xt)]);
title('(a) �źż���������');
subplot(2,1,2);plot(f,abs(fst)/max(abs(fst)));grid;xlabel('f/Hz');ylabel('����');
axis([0,Fs,0,1.2]);
title('(b) �źż�������Ƶ��');
end

