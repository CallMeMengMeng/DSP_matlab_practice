%FIR Filter�����ʵ��
clear all;clc;
%����xtg�����ź�xt��xt����N=1000������ʾxt�Ĳ�����Ƶ��
N=1000;xt=xtg(N);
fp=120;fs=150;Rp=0.2;As=60;Fs=1000;T=1/Fs;

%��������
wc=(fp+fs)/Fs;%��һ��
B=2*pi*(fs-fp)/Fs;
Nb=ceil(11*pi/B);
hn1=fir1(Nb-1,wc,blackman(Nb));
Hw=abs(fft(hn1,1024));
ywt=fftfilt(hn1,xt,N);%���ú�����xt�˲�
%���Ʋ���
figure(2)
y1t='y_l(t)';
subplot(2,1,1);myplot(hn1,1);axis([0,1,-120,5]);title('(a) ��ͨ�˲�����Ƶ����');
subplot(2,1,2);tplot(ywt,T,y1t);title('(b) �˳���������źŲ���');

%�Ȳ�����ѱƽ���
fb=[fp,fs];m=[1,0];
dev=[(10^(Rp/20)-1)/(10^(Rp/20)+1),10^(-As/20)];
[Ne,fo,mo,W]=remezord(fb,m,dev,Fs);
hn2=remez(Ne,fo,mo,W);
Hw=abs(fft(hn2,1024));
yet=fftfilt(hn2,xt,N);
%���Ʋ���
figure(3)
y2t='y_e(t)';
subplot(2,1,1);myplot(hn2,1);axis([0,1,-80,5]);title('(a) ��ͨ�˲�����Ƶ����');
subplot(2,1,2);tplot(yet,T,y2t);title('(b) �˳���������źŲ���');