function tplot(xn,T,yn)
%ʱ�������������߻�ͼ���������������л�ͼ
%   xn �ź���������
%   yn ��ͼ�źŵ�����������
%   TΪ�������
n=0:length(xn)-1;t=n*T;
plot(t,xn);grid;
xlabel('t/s');ylabel(yn);
axis([0,0.2*t(end),min(xn),1.2*max(xn)]);
end

