function myplot(B,A)
%计算时域离散系统损耗函数并绘制曲线图
%   A   系统函数分母多项式系数向量
%   B   系统函数分子多项式系数向量
[H,W]=freqz(B,A,1000);
m=abs(H);
plot(W/pi, 20*log10(m/max(m)));grid on;
xlabel('f/Hz');ylabel('幅度(dB)');
%axis([0,1,-120,5]);%title('损耗函数曲线');
end

