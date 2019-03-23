b=[1,-0.9];a=[1,0.9];
%绘制零极点图；
subplot(4,1,1);zplane(b,a);
%计算其单位脉冲响应；
num=[1,-0.9];den=[1,0.9];
[h,t]=impz(num,den);
subplot(4,1,2);stem(t,h,'filled');%plot(t,h);
%绘制幅频特性曲线；
[H,w]=freqz(num,den);
subplot(4,1,3);plot(w/pi,abs(H));
%输入x(n)=e^(jw0n)时的输出y(n);
w0=pi;n=0:100;ic=[0,0];x1=exp(1i*w0*n);
y=filter(num,den,x1);
subplot(4,1,4);stem(n,y,'filled');

