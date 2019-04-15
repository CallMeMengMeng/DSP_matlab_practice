%时域采样理论验证程序
Tp=64/1000;                         %观察时间Tp=64us
%产生M长采样序列x(n)
%Fs=1000;T=1/Fs;
Fs=1000;T=1/Fs;
M=Tp*Fs;n=0:M-1;
A=444.128;alph=pi*50*2^0.5;omega=pi*50*2^0.5;
xnt=A*exp(-alph*n*T).*sin(omega*n*T);
Xk=T*fft(xnt,M);                    %M点FFT[xnt]
yn='xa(nT)';subplot(3,2,1);
tstem(xnt,yn);                       %调用自编绘图函数stem绘制序列图
box on;title('(a)Fs=1000Hz');
k=0:M-1;fk=k/Tp;
subplot(3,2,2);plot(fk,abs(Xk));title('(a)T*FT[xa(nT)],Fs=1000Hz');
xlabel('f(Hz)');ylabel('幅度');axis([0,Fs,0,1.2*max(abs(Xk))])
%====================================================================

Tp=64/1000;                         %观察时间Tp=64us
%产生M长采样序列x(n)
%Fs=300;T=1/Fs;
Fs=300;T=1/Fs;
M=Tp*Fs;n=0:M-1;
A=444.128;alph=pi*50*2^0.5;omega=pi*50*2^0.5;
xnt=A*exp(-alph*n*T).*sin(omega*n*T);
Xk=T*fft(xnt,M);                    %M点FFT[xnt]
yn='xa(nT)';subplot(3,2,3);
tstem(xnt,yn);                       %调用自编绘图函数stem绘制序列图
box on;title('(b)Fs=300Hz');
k=0:M-1;fk=k/Tp;
subplot(3,2,4);plot(fk,abs(Xk));title('(b)T*FT[xa(nT)],Fs=300Hz');
xlabel('f(Hz)');ylabel('幅度');axis([0,Fs,0,1.2*max(abs(Xk))])
%=====================================================================

Tp=64/1000;                         %观察时间Tp=64us
%产生M长采样序列x(n)
%Fs=200;T=1/Fs;
Fs=200;T=1/Fs;
M=Tp*Fs;n=0:M-1;
A=444.128;alph=pi*50*2^0.5;omega=pi*50*2^0.5;
xnt=A*exp(-alph*n*T).*sin(omega*n*T);
Xk=T*fft(xnt,M);                    %M点FFT[xnt]
yn='xa(nT)';subplot(3,2,5);
tstem(xnt,yn);                       %调用自编绘图函数stem绘制序列图
box on;title('(c)Fs=200Hz');
k=0:M-1;fk=k/Tp;
subplot(3,2,6);plot(fk,abs(Xk));title('(c)T*FT[xa(nT)],Fs=200Hz');
xlabel('f(Hz)');ylabel('幅度');axis([0,Fs,0,1.2*max(abs(Xk))])