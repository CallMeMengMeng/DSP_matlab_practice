clear;clc;
b=[1,-0.9];a=[1,0.9];

%�����㼫��ͼ��
subplot(2,2,1);zplane(b,a);
title('��-���ֲ�');

%�����䵥λ������Ӧ��
num=[1,-0.9];den=[1,0.9];
[h,t]=impz(den,num);
subplot(2,2,2);stem(t,h,'filled');%plot(t,h);
xlabel('k');ylabel('h(k)');title('��λ������Ӧh(k)');

%���Ʒ�Ƶ�������ߣ�
[H,w]=freqz(den,num);
subplot(2,2,3);plot(w/pi,abs(H));
title('��Ƶ��������');

%����x(n)=e^(jw0n)ʱ�����y(n);
w0=2*pi;n=0:pi/100:pi;x1=exp(1i*w0*n);
y=filter(den,num,x1);
subplot(2,2,4);%plot(n,y);
stem(n,y,'filled');
xlabel('n');ylabel('y(n)');title('�����Ӧy(n)');
