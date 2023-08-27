close all; 
clc;
filename="C:\Users\syh\Desktop\信号与系统大作业\陈奕迅-爱情转移.mp3";
[x,fs]=audioread(filename);
x1=x(:,1); %左声道
x2=x(:,2); %右声道

n1=length(x1);
f1=fftshift(fft(x1));
w1=(0:n1-1)*fs/n1-fs/2;
figure(1)
subplot(4,1,1);
plot(x1);  
xlabel('时间');
title('初始信号左声道波形图');
grid on;
subplot(4,1,2);
plot(w1,abs(f1));
title('初始信号左声道频谱图');
xlabel('频率w/Hz');ylabel('幅值');
grid on;
n2=length(x2);
f2=fftshift(fft(x2));
w2=(0:n2-1)*fs/n2-fs/2;
subplot(4,1,3)
plot(x2);
title('初始信号右声道波形图')
xlabel('时间');
grid on;
subplot(4,1,4)
plot(w2,abs(f2));
xlabel('频率w/Hz');ylabel('幅值');
title('初始信号右声道频谱图');
grid;

sub=x1-x2;

n3=length(sub);
f_one=fftshift(fft(sub));
w3=(0:n3-1)*fs/n3-fs/2;
figure(2)
subplot(2,1,1);
plot(sub);  
xlabel('时间');
title('声道相减后信号波形图');
grid on;
subplot(2,1,2);
plot(w3,abs(f_one));
title('声道相减后信号频谱图');
xlabel('频率w/Hz');ylabel('幅值');

BandstopNew=filter(Hbs,sub);%Hbs为带阻滤波器，滤除人声所在频率范围
n4=length(BandstopNew); 
BANDSTOPNEW=fftshift(fft(BandstopNew));
w4=(0:n4-1)*fs/n4-fs/2;
figure(3);
subplot(2,1,1)
plot(BandstopNew);
title('滤除人声后信号波形图')
xlabel('时间');
grid on;
subplot(2,1,2)
plot(abs(BANDSTOPNEW));
xlabel('频率w/Hz');ylabel('幅值');
title('声道相减后信号频谱图');
grid on;
sound(BandstopNew,fs);
audiowrite('伴奏-陈奕迅-爱情转移.wav',BandstopNew,fs); %输出伴奏文件