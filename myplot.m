function myplot(B,A)
%����ʱ����ɢϵͳ��ĺ�������������ͼ
%   A   ϵͳ������ĸ����ʽϵ������
%   B   ϵͳ�������Ӷ���ʽϵ������
[H,W]=freqz(B,A,1000);
m=abs(H);
plot(W/pi, 20*log10(m/max(m)));grid on;
xlabel('\omega/\pi');ylabel('����(dB)');
axis([0,1,-80,5]);title('��ĺ�������');
end
