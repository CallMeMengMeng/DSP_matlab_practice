% IIR数字滤波器设计及软件实现
clear all; close all
Fs= 10000; T= 1/Fs;  %采样频率
%调用函数mstg产生复合信号st 
st= mstg;

%低通滤波器
fp= 280; fs= 450;
wp=2*fp/Fs; ws=2*fs/Fs; rp=0.1; rs= 60; %DF指标(低通滤波器的通、阻带边界频率)
[N,wp]= ellipord(wp, ws, rp, rs); % 调用llipord计算椭圆DF阶数N和通带截止频率wp
[B, A]= ellip(N, rp, rs, wp);  %调用lip计算椭圆带通DF系统函数系数向量B和A
y1t= filter(B, A, st);%滤波器软件实现

%低通滤波器设计与实现绘图部分
figure(2); 
subplot(2, 1, 1);
myplot(B, A);  %调用绘图函数myplot绘制损耗函数曲线
yt='y_ 1(t)';
subplot(2, 1, 2); tplot(y1t, T,yt); %调用绘图函数tplot绘制滤波器输出波形

%带通滤波器
fpl= 440; fpu=560; fsl=275; fsu= 900;
wp=[2* fpl/Fs, 2* fpu/Fs]; ws=[2* fsl/Fs, 2* fsu/Fs]; rp=0.1;rs=60;
[N, wp]= ellipord(wp, ws, rp, rs); %调用 lliporld计算椭圆DF阶数N和通带截止频率wp
[B, A]=ellip(N, rp, rs, wp);%调用llip计算椭圆带通DF系统函数系数向量B和A
y2t= filter(B, A, st);  %滤波器软件实现

%带通滤波器设计与实现绘图部分
figure(3); 
subplot(2, 1, 1);
myplot(B, A);  %调用绘图函数myplot绘制损耗函数曲线
yt='y_ 2(t)';
subplot(2, 1, 2); tplot(y2t, T,yt); %调用绘图函数tplot绘制滤波器输出波形

%高通滤波器
fp=890; fs= 600;
wp=2*fp/Fs; ws=2*fs/Fs; rp=0.1; rs= 60; %DF指标(低通滤波器的通、阻带边界频率)
[N, wp]= ellipord(wp, ws, rp, rs);  %调用elipord计算椭圆DF阶数N和通带截止频率wp
[B,A]=ellip(N, rp, rs, wp, 'high');  %调用ellip计算椭圆带通DF系统函数系数向量B和A
 y3t=filter(B, A,st);   %滤波器软件实现
 
%高低通滤波器设计与实现绘图部分
figure(4); 
subplot(2, 1, 1);
myplot(B, A);  %调用绘图函数myplot绘制损耗函数曲线
yt='y_ 3(t)';
subplot(2, 1, 2); tplot(y3t, T,yt); %调用绘图函数tplot绘制滤波器输出波形
