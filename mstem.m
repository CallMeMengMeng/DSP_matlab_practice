function mstem(Xk)
%本函数用来绘制频域采样序列Xk的幅频特性图
M=length(Xk);
k=0:M-1; wk=2*k/M;                           %产生M点DFT对应的采样点频率
stem(wk,abs(Xk),'filled'); box on;          %绘制频域采样序列的幅频特性图
xlabel('\omega/\pi'); ylabel('幅度'); axis([0,2,0,1.5*max(abs(Xk))]);
end

