function fstem(Xk,N,T)
%������������Ƶ���������Xk�ķ�Ƶ����ͼ
Tp=N*T;F=1/Tp;
k=-N/2:N/2-1;fk=k*F;                    
stem(fk,abs(Xk),'filled');box on;
xlabel('f(Hz)');ylabel('����');
axis([-N*F/2-1,N*F/2-1,0,1.5*max(abs(Xk))]);
end

