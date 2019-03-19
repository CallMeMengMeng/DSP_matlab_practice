N=256; a1=5; a2=3;
f1=.1; f2=.2; fs=1;
w=2*pi/fs;
x=a1*sin(w*f1*(0:N-1))+sin(w*f2*(0:N-1))+randn(1,N);
%figure(1);
subplot(2,1,1); plot(x(1:N/4)); title('Original signal');
y=fft(x);
%figure(2);
subplot(2,1,2); plot(abs(y)); title('Frequenz signal');