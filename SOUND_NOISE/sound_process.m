clc;clear;
close all;
[audio,Fs]=audioread('E:\PROGRAMS\MATLAB³ÌÐò\sound_noise\sound.wav');
f=2500;
n=1:length(audio);
noise=3*sin(2*pi*f*n/Fs)+3*cos(2*pi*f*n/Fs);
a_n=audio+noise.';
f_audio=fft(audio);
f_noise=fft(noise);
f_a_n=fft(a_n);


figure(1)
subplot(3,1,1)
plot((1:length(f_audio))/length(f_audio)*2,abs(f_audio))
subplot(3,1,2)
plot((1:length(f_noise))/length(f_noise)*2,abs(f_noise))
subplot(3,1,3)
plot((1:length(f_a_n))/length(f_a_n)*2,abs(f_a_n))
audiowrite('E:\PROGRAMS\MATLAB³ÌÐò\sound_noise\sound_with_noise.wav',a_n,Fs);
figure(2)
subplot(2,1,1)
plot((1:length(audio))/Fs,audio)
subplot(2,1,2)
plot((1:length(a_n))/Fs,a_n)
wp=[(f-200)*2/Fs,(f+200)*2/Fs];ws=[(f-100)*2/Fs,(f+100)*2/Fs];Rp=0.5;As=50;
[N,wpo]=ellipord(wp,ws,Rp,As);
[B,A]=ellip(N,Rp,As,wpo,'stop');
[H,w]=freqz(B,A,'whole');
figure(3);
plot(w,abs(H));
figure(4);
sound_after_process=filter(B,A,a_n);
f_sound_after_process=fft(sound_after_process);
plot(1:length(f_sound_after_process),abs(f_sound_after_process));
audiowrite('E:\PROGRAMS\MATLAB³ÌÐò\sound_noise\sound_after_process.wav',sound_after_process,Fs);


deci_audio=decimate(audio,4);
inter_audio=zeros(2*length(audio),1);
for i=1: length(audio)
    inter_audio(i*2-1)=audio(i);
end
f_d_audio=fft(deci_audio);
f_i_audio=fft(inter_audio);

figure(5)
subplot(2,1,1)
plot((1:length(f_audio))/length(f_audio)*2,abs(f_audio))
subplot(2,1,2)
plot((1:length(f_d_audio))/length(f_d_audio)*2,abs(f_d_audio))
figure(6)
subplot(2,1,1)
plot((1:length(f_audio))/length(f_audio)*2,abs(f_audio))
subplot(2,1,2)
plot((1:length(f_i_audio))/length(f_i_audio)*2,abs(f_i_audio))