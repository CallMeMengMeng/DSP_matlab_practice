clear;clc;
b=[1,-0.9];a=[1,0.9];

%绘制零极点图；
subplot(2,2,1);zplane(b,a);
title('极-零点分布');

%计算其单位脉冲响应；
num=[1,-0.9];den=[1,0.9];
[h,t]=impz(den,num);
subplot(2,2,2);stem(t,h,'filled');%plot(t,h);
xlabel('k');ylabel('h(k)');title('单位脉冲响应h(k)');

%绘制幅频特性曲线；
[H,w]=freqz(den,num);
subplot(2,2,3);plot(w/pi,abs(H));
title('幅频特性曲线');

%输入x(n)=e^(jw0n)时的输出y(n);
w0=2*pi;n=0:pi/100:pi;x1=exp(1i*w0*n);
y=filter(den,num,x1);
subplot(2,2,4);%plot(n,y);
stem(n,y,'filled');
xlabel('n');ylabel('y(n)');title('输出响应y(n)');
