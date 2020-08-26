% 连续信号转换为离散信号的过程叫做抽样,T为抽样周期
% 当抽样信号通过一特定的低通滤波器时，可重构信号，
% 信号抽样后其频谱产生了周期延拓，每隔一个抽样频
% 率fs，重复出现一次，为了保证抽样后信号的频谱形状
% 不失真，抽样频率必须大于等于信号中最高频率成分的
% 两倍，这就是奈奎斯特抽样定理。

% 设信号sa(t)被抽样后形成sd(t),信号的重构是指由sd(t)经过内插处理后，恢复出原来的信号sa(t)的过程，该过程又称为信号恢复。

% 1.时间抽样与频率混叠
% 实验：设连续信号xa(t)=exp(-a*t).*sin(b*t),其中A=444.128, b=a=50*sqrt(2)*pi, 
% 若分别以抽样频率fs=1000Hz,400Hz,200Hz进行等间隔抽样，计算并图示三种
% 抽样频率下的抽样信号x(n)及其幅频特性函数|Xa(jf)|，观察Xa(jf)的周期及频
% 谱混叠程度与fs的关系。


clear;  % 清除工作空间的所有变量
close all;   % 关闭所有的Figure窗口
clc;  % 清除命令窗口的内容，对工作环境中的全部变量无任何影响,并把光标移到命令窗口左上

fs = 10000; fs1= 1000; fs2=400; fs3=200;  % 设置4种抽样频率
%求近似模拟信号频谱
t = 0:1/fs:0.1; % 采集信号长度为0.1秒
A = 444.128; % 幅度
a = 50*sqrt(2)*pi; % 频率
b = a;

xa = exp(-a*t).*sin(b*t);  % 连续信号Xa(t) 

k=0:511; 
f=fs*k/512; % 由wk=2*pi*k/512 = 2*pi*f*T求得模拟频率f
w=2*pi*k/512;
Xa=xa*exp(-j*[1:length(xa)]'*w);  % 近似模拟型号频谱

% 求抽样频率为1kHz时抽样信号频谱
T1 = 1/fs1; t1 = 0:T1:0.1; % 采集信号长度为0.1秒
x1 = A*exp(-a.*t1).*sin(b*t1);   % 1kHz抽样序列x1(n)
X1 = x1*exp(-j*[1:length(x1)]'*w);   % x1(n)的512点DTFT

% 求抽样频率为400Hz时抽样信号频谱
T2 = 1/fs2; t2 = 0:T2:0.1; % 采集信号长度为0.1秒k
x2 = A*exp(-a.*t2).*sin(b*t2);   % 400Hz抽样序列x1(n)
X2 = x2*exp(-j*[1:length(x2)]'*w);   % x2(n)的512点DTFT

% 求抽样频率为200Hz时抽样信号频谱
T3 = 1/fs3; t3 = 0:T3:0.1; % 采集信号长度为0.1秒
x3 = A*exp(-a.*t3).*sin(b*t3);   % 200Hz抽样序列x1(n)
X3 = x3*exp(-j*[1:length(x3)]'*w);   % x3(n)的512点DTFT

figure(1);
subplot(2,2,1);plot(t,xa);
axis([0,max(t),min(xa),max(xa)]);title('模拟信号');
xlabel('t(s)');ylabel('Xa(t)');
line([0,max(t)],[0,0]); % 绘制直线函数

subplot(2,2,2);plot(f,abs(Xa)/max(abs(Xa)));
title('模拟信号的幅度频率');
axis([0,500,0,1]);
xlabel('f(Hz)');ylabel('|Xa(jf)|');

subplot(2,2,3);stem(t1,x1,'.');
line([0,max(t1)],[0,0]); % 绘制直线函数
axis([0,max(t1),min(x1),max(x1)]);
title('抽样序列x1(n)(fs1=1kHz)');
xlabel('n');ylabel('|X1(n)|');

f1 = fs1*k/512;
subplot(2,2,4);plot(f1,abs(X1)/max(abs(X1)));
title('x1(n)的幅度谱');xlabel('f(Hz)');ylabel('|X1(jf)|');

figure(2);
subplot(2,2,1);stem(t2,x2,'.');
line([0,max(t2)],[0,0]); % 绘制直线函数
axis([0,max(t2),min(x2),max(x2)]);
title('抽样序列x2(n)(fs2=400Hz)')
xlabel('n');ylabel('|X2(n)|');

f = fs2*k/512;
subplot(2,2,2);plot(f,abs(X2)/max(abs(X2)));
title('x2(n)的幅度谱');xlabel('f(Hz)');ylabel('|X2(jf)|');

subplot(2,2,3);stem(t3,x3,'.');
line([0,max(t3)],[0,0]); % 绘制直线函数
axis([0,max(t3),min(x3),max(x3)]);
title('抽样序列x3(n)(fs3=200Hz)')
xlabel('n');ylabel('|X3(n)|');

f = fs3*k/512;
subplot(2,2,4);plot(f,abs(X3)/max(abs(X3)));
title('x3(n)的幅度谱');xlabel('f(Hz)');ylabel('|X3(jf)|');

% 当f>=500Hz时，|Xa(jf)|的值很小。所以，fs=1kHz的抽样序列x1(n)的频率混叠很小；
% 而fs=400Hz时，x2(n)的频谱混叠较大；而fs=200Hz时，x3(n)的频谱混叠最严重；