function fstem(Xk,N,T)
%函数用来绘制频域采样序列Xk的幅频特性图
Tp=N*T;F=1/Tp;
k=-N/2:N/2-1;fk=k*F;                    
stem(fk,abs(Xk),'filled');box on;
xlabel('f(Hz)');ylabel('幅度');
axis([-N*F/2-1,N*F/2-1,0,1.5*max(abs(Xk))]);
end

