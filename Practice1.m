%系统响应与稳定性
clear all;close all;

%产生差分方程，求解单位脉冲响应
A=[1,-0.9];B=[0.05,0.05];                                       %系统差分方程系数向量A和B
x1n=[1 1 1 1 1 1 1 1 zeros(1,50)];                         %产生信号x1n=R8(n)
x2n=ones(1,128);                                                  %产生信号x2n=u(n)
hn=impz(B,A,58);                                                  %求系统得单位脉冲响应h(n)
figure(1);
subplot(2,2,1);y='h(n)';tstem(hn,y);                       %调用自编函数tstem绘图
title('(a) 系统单位脉冲响应h(n)');
y1n=filter(B,A,x1n);                                               %求系统对x1n的响应y1n
subplot(2,2,2);y='y_1(n)';tstem(y1n,y);                   %调用自编函数tstem绘图
title('(b) 系统对R_8(n)的响应y_1(n)');
y2n=filter(B,A,x2n);                                               %求系统对x2n的响应y2n
subplot(2,2,4);y='y_2(n)';tstem(y2n,y);
title('(c) 系统对u(n)的响应y_2(n)');

%使用conv函数计算卷积
x1n=[1 1 1 1 1 1 1 1];                                           %产生信号x1n=R8(n)
h1n=[ones(1,10),zeros(1,10)];                              %产生信号h1n=R10(n)
h2n=[1,2.5,2.5,1, zeros(1,10)];                              %产生信号h2n
y21n=conv(h1n,x1n);                                            %x1n与h1n的卷积
y22n=conv(h2n,x1n);                                            %x1n与h2n的卷积
figure(2);
subplot(2,2,1);y='h_1(n)';tstem(h1n,y);
title('(d) 系统单位脉冲响应h_1(n)');
subplot(2,2,2);y='y_2_1(n)';tstem(y21n,y);
title('(e) h_1(n)与R_8(n)的卷积y_2_1(n)');
subplot(2,2,3);y='h_2(n)';tstem(h2n,y);
title('(f) 系统的单位脉冲响应h_2(n)');
subplot(2,2,4);y='y_2_2(n)';tstem(y22n,y);
title('(g) h_2(n)与R_8(n)的卷积y_2_2(n)');

%产生谐振器的波形
n=0:255;
b=[1/100.49,0,-1/100.49];a=[1,-1.8237,0.9801];  %系统差分方程系数向量b和a
un=ones(1,256);                                                    %产生单位阶跃函数u(n)
xsin=sin(0.014*n)+sin(0.4*n);                                %产生输入信号x(n)
y31n=filter(b,a,un);                                                %产生系统的单位阶跃响应y31(n)
y32n=filter(b,a,xsin);                                              %产生给定信号的输出响应
figure(3);
subplot(2,1,1);y='y_3_1(n)';tstem(y31n,y);
title('(h) 输入信号为u(n)时系统的输出波形y_3_1(n)');
subplot(2,1,2);y='y_3_2(n)';tstem(y32n,y);
title('(i) 系统在给定输入信号x(n)=sin(0.014*n)+sin(0.4*n)时的输出波形y_3_2(n)');





