b=[1,-0.9];a=[1,0.9];
%�����㼫��ͼ��
subplot(4,1,1);zplane(b,a);
%�����䵥λ������Ӧ��
num=[1,-0.9];den=[1,0.9];
[h,t]=impz(num,den);
subplot(4,1,2);stem(t,h,'filled');%plot(t,h);
%���Ʒ�Ƶ�������ߣ�
[H,w]=freqz(num,den);
subplot(4,1,3);plot(w/pi,abs(H));
%����x(n)=e^(jw0n)ʱ�����y(n);
w0=pi;n=0:100;ic=[0,0];x1=exp(1i*w0*n);
y=filter(num,den,x1);
subplot(4,1,4);stem(n,y,'filled');

