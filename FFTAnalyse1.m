clc;
%(1)ʹ��FFT���źŽ���Ƶ�׷���
x1n=[ones(1,4)];                                %��������x1(n)=R4(n)
N=8; x1=1:1:(N/2); x2=(N/2):-1:1;    %���ö�����
x2n=[x1,x2];                                      %��������x2(n)
x3n=[x2,x1];                                      %��������x3(n)
X1k8=fft(x1n,8);                                %�ֱ����N=8ʱ��DFT����
X2k8=fft(x2n,8);
X3k8=fft(x3n,8);
X1k16=fft(x1n,16);                            %�ֱ����N=16ʱ��DFT����          
X2k16=fft(x2n,16);
X3k16=fft(x3n,16);
figure(1);                                          %���Ʒ�Ƶ��������
subplot(2,3,1);mstem(X1k8);title('(a) 8��DFT[x_1(n)]');
subplot(2,3,2);mstem(X2k8);title('(b) 8��DFT[x_2(n)]');
subplot(2,3,3);mstem(X3k8);title('(c) 8��DFT[x_3(n)]');
subplot(2,3,4);mstem(X1k16);title('(d) 16��DFT[x_1(n)]');
subplot(2,3,5);mstem(X2k16);title('(e) 16��DFT[x_2(n)]');
subplot(2,3,6);mstem(X3k16);title('(f) 16��DFT[x_3(n)]');

%(2)�Ը����������н���Ƶ�׷���
N=8;n=0:N-1;
x4n=cos(n*(pi/4));                          %������������x4n
x5n=cos(n*(pi/4))+cos(n*(pi/8));    %������������x5n
X4k8=fft(x4n,8);                              %�ֱ����N=8ʱ��DFT����
X5k8=fft(x5n,8);
N=16;n=0:N-1;
x4n=cos(n*(pi/4));                          %������������x4n
x5n=cos(n*(pi/4))+cos(n*(pi/8));    %������������x5n
X4k16=fft(x4n,16);                          %�ֱ����N=16ʱ��DFT����
X5k16=fft(x5n,16);
figure(2)                                          %���Ʒ�Ƶ��������
subplot(2,2,1);mstem(X4k8);title('(a) 8��DFT[x_4(n)]');
subplot(2,2,2);mstem(X5k8);title('(b) 8��DFT[x_5(n)]');
subplot(2,2,3);mstem(X4k16);title('(c) 16��DFT[x_4(n)]');
subplot(2,2,4);mstem(X5k16);title('(d) 16��DFT[x_5(n)]');

%(3)��ģ�������źŽ����׷���
Fs=64;T=1/Fs;
N=16;n=0:N-1;
x6nT=cos(8*pi*n*T)+cos(16*pi*n*T)+cos(20*pi*n*T);
X6k16=fft(x6nT);
X6k16=fftshift(X6k16);
N=32;n=0:N-1;
x6nT=cos(8*pi*n*T)+cos(16*pi*n*T)+cos(20*pi*n*T);
X6k32=fft(x6nT);
X6k32=fftshift(X6k32);
N=64;n=0:N-1;
x6nT=cos(8*pi*n*T)+cos(16*pi*n*T)+cos(20*pi*n*T);
X6k64=fft(x6nT);
X6k64=fftshift(X6k64);
figure(3)
subplot(3,1,1);fstem(X6k16,16,T);title('(a) 16��DFT[x_6(n)]');
subplot(3,1,2);fstem(X6k32,32,T);title('(a) 32��DFT[x_6(n)]');
subplot(3,1,3);fstem(X6k64,64,T);title('(a) 64��DFT[x_6(n)]');
