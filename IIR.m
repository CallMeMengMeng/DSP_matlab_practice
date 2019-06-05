% IIR�����˲�����Ƽ����ʵ��
clear all; close all
Fs= 10000; T= 1/Fs;  %����Ƶ��
%���ú���mstg���������ź�st 
st= mstg;

%��ͨ�˲���
fp= 280; fs= 450;
wp=2*fp/Fs; ws=2*fs/Fs; rp=0.1; rs= 60; %DFָ��(��ͨ�˲�����ͨ������߽�Ƶ��)
[N,wp]= ellipord(wp, ws, rp, rs); % ����llipord������ԲDF����N��ͨ����ֹƵ��wp
[B, A]= ellip(N, rp, rs, wp);  %����lip������Բ��ͨDFϵͳ����ϵ������B��A
y1t= filter(B, A, st);%�˲������ʵ��

%��ͨ�˲��������ʵ�ֻ�ͼ����
figure(2); 
subplot(2, 1, 1);
myplot(B, A);  %���û�ͼ����myplot������ĺ�������
yt='y_ 1(t)';
subplot(2, 1, 2); tplot(y1t, T,yt); %���û�ͼ����tplot�����˲����������

%��ͨ�˲���
fpl= 440; fpu=560; fsl=275; fsu= 900;
wp=[2* fpl/Fs, 2* fpu/Fs]; ws=[2* fsl/Fs, 2* fsu/Fs]; rp=0.1;rs=60;
[N, wp]= ellipord(wp, ws, rp, rs); %���� lliporld������ԲDF����N��ͨ����ֹƵ��wp
[B, A]=ellip(N, rp, rs, wp);%����llip������Բ��ͨDFϵͳ����ϵ������B��A
y2t= filter(B, A, st);  %�˲������ʵ��

%��ͨ�˲��������ʵ�ֻ�ͼ����
figure(3); 
subplot(2, 1, 1);
myplot(B, A);  %���û�ͼ����myplot������ĺ�������
yt='y_ 2(t)';
subplot(2, 1, 2); tplot(y2t, T,yt); %���û�ͼ����tplot�����˲����������

%��ͨ�˲���
fp=890; fs= 600;
wp=2*fp/Fs; ws=2*fs/Fs; rp=0.1; rs= 60; %DFָ��(��ͨ�˲�����ͨ������߽�Ƶ��)
[N, wp]= ellipord(wp, ws, rp, rs);  %����elipord������ԲDF����N��ͨ����ֹƵ��wp
[B,A]=ellip(N, rp, rs, wp, 'high');  %����ellip������Բ��ͨDFϵͳ����ϵ������B��A
 y3t=filter(B, A,st);   %�˲������ʵ��
 
%�ߵ�ͨ�˲��������ʵ�ֻ�ͼ����
figure(4); 
subplot(2, 1, 1);
myplot(B, A);  %���û�ͼ����myplot������ĺ�������
yt='y_ 3(t)';
subplot(2, 1, 2); tplot(y3t, T,yt); %���û�ͼ����tplot�����˲����������
