%ϵͳ��Ӧ���ȶ���
clear all;close all;

%������ַ��̣���ⵥλ������Ӧ
A=[1,-0.9];B=[0.05,0.05];                                       %ϵͳ��ַ���ϵ������A��B
x1n=[1 1 1 1 1 1 1 1 zeros(1,50)];                         %�����ź�x1n=R8(n)
x2n=ones(1,128);                                                  %�����ź�x2n=u(n)
hn=impz(B,A,58);                                                  %��ϵͳ�õ�λ������Ӧh(n)
figure(1);
subplot(2,2,1);y='h(n)';tstem(hn,y);                       %�����Աຯ��tstem��ͼ
title('(a) ϵͳ��λ������Ӧh(n)');
y1n=filter(B,A,x1n);                                               %��ϵͳ��x1n����Ӧy1n
subplot(2,2,2);y='y_1(n)';tstem(y1n,y);                   %�����Աຯ��tstem��ͼ
title('(b) ϵͳ��R_8(n)����Ӧy_1(n)');
y2n=filter(B,A,x2n);                                               %��ϵͳ��x2n����Ӧy2n
subplot(2,2,4);y='y_2(n)';tstem(y2n,y);
title('(c) ϵͳ��u(n)����Ӧy_2(n)');

%ʹ��conv����������
x1n=[1 1 1 1 1 1 1 1];                                           %�����ź�x1n=R8(n)
h1n=[ones(1,10),zeros(1,10)];                              %�����ź�h1n=R10(n)
h2n=[1,2.5,2.5,1, zeros(1,10)];                              %�����ź�h2n
y21n=conv(h1n,x1n);                                            %x1n��h1n�ľ��
y22n=conv(h2n,x1n);                                            %x1n��h2n�ľ��
figure(2);
subplot(2,2,1);y='h_1(n)';tstem(h1n,y);
title('(d) ϵͳ��λ������Ӧh_1(n)');
subplot(2,2,2);y='y_2_1(n)';tstem(y21n,y);
title('(e) h_1(n)��R_8(n)�ľ��y_2_1(n)');
subplot(2,2,3);y='h_2(n)';tstem(h2n,y);
title('(f) ϵͳ�ĵ�λ������Ӧh_2(n)');
subplot(2,2,4);y='y_2_2(n)';tstem(y22n,y);
title('(g) h_2(n)��R_8(n)�ľ��y_2_2(n)');

%����г�����Ĳ���
n=0:255;
b=[1/100.49,0,-1/100.49];a=[1,-1.8237,0.9801];  %ϵͳ��ַ���ϵ������b��a
un=ones(1,256);                                                    %������λ��Ծ����u(n)
xsin=sin(0.014*n)+sin(0.4*n);                                %���������ź�x(n)
y31n=filter(b,a,un);                                                %����ϵͳ�ĵ�λ��Ծ��Ӧy31(n)
y32n=filter(b,a,xsin);                                              %���������źŵ������Ӧ
figure(3);
subplot(2,1,1);y='y_3_1(n)';tstem(y31n,y);
title('(h) �����ź�Ϊu(n)ʱϵͳ���������y_3_1(n)');
subplot(2,1,2);y='y_3_2(n)';tstem(y32n,y);
title('(i) ϵͳ�ڸ��������ź�x(n)=sin(0.014*n)+sin(0.4*n)ʱ���������y_3_2(n)');





