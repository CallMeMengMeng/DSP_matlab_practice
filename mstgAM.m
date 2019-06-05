function st=mstgAM
%�����ź���������st������ʾst��ʱ���κ�Ƶ�ף�
%mstg������·�����ź�����γɵĻ���ź�N=1600;
N=1600;
Fs=10000;T=1/Fs;Tp=N*T;%����Ƶ��Fs=10KHz,Tp=Ϊ����ʱ��
t=0:T:(N-1)*T;k=0:N-1;f=k/Tp;
fc1=Fs/10;%��1·�ز��źţ�
fm1=fc1/10;%��1·�����ź�
fc2=Fs/20;%��2·�ز��źţ�
fm2=fc2/10;%��2·�����ź�
fc3=Fs/40;%��3·�ز��źţ�
fm3=fc3/10;%��3·�����ź�
xt1=[3+cos(2*pi*fm1*t)].*cos(2*pi*fc1*t);%������1·�ź�
xt2=[3+cos(2*pi*fm2*t)].*cos(2*pi*fc2*t);%������2·�ź�
xt3=[3+cos(2*pi*fm3*t)].*cos(2*pi*fc3*t);%������3·�ź�
st=xt1+xt2+xt3;%��·�����ź����
fxt=fft(st,N);      %����Ƶ��

%==========��������ͼ==========================
figure(1)
subplot(2,1,1)
plot(t,st);grid;xlabel('t/s');ylabel('s(t)');
axis([0,Tp/8,min(st),max(st)]);title('(a) s(t)�Ĳ���');
subplot(2,1,2)
stem(f,abs(fxt)/max(abs(fxt)),'.');grid;title('(b) s(t)��Ƶ����');
axis([0,Fs/5,0,1.2]);
xlabel('f/Hz');ylabel('����');
