function mstem(Xk)
%��������������Ƶ���������Xk�ķ�Ƶ����ͼ
M=length(Xk);
k=0:M-1; wk=2*k/M;                           %����M��DFT��Ӧ�Ĳ�����Ƶ��
stem(wk,abs(Xk),'filled'); box on;          %����Ƶ��������еķ�Ƶ����ͼ
xlabel('\omega/\pi'); ylabel('����'); axis([0,2,0,1.5*max(abs(Xk))]);
end

