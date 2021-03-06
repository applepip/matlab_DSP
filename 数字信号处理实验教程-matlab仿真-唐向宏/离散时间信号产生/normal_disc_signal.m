% 利用MATLAB编程绘制常用的离散时间信号

clear;  % 清除工作空间的所有变量
close all;   % 关闭所有的Figure窗口
clc;  % 清除命令窗口的内容，对工作环境中的全部变量无任何影响,并把光标移到命令窗口左上角

N = 50  % 序列长度

x1 = [1, zeros(1,N-1)]; % 单位冲激序列
% disp(x1);

x2 = ones(1,N);  % 单位阶跃序列
% disp(x2);

n=0:N-1; a = 0.6; x3 = a.^n; %实指数序列

w0 = pi/3; ang= pi/15; x4 = sin(n*w0+ang); % 正弦型序列

x5 = exp((a+j*w0)*n);

figure(1);

subplot(3,1,1);stem(x1);   %绘制单位冲激序列
ylabel('x_1(n)=\delta(n)');

subplot(3,1,2);stem(x2);   %绘制单位阶跃序列
ylabel('x_2(n)=u(n)');

subplot(3,1,3);stem(x3);   %绘制实指数序列
ylabel('x_3(n)=0.6^n');xlabel('n');

figure(2);
subplot(2,1,1);stem(x4);
ylabel('x_4(n)=sin(\pin/3+\pi/5)');xlabel('n'); %绘制正弦序列

subplot(2,1,2);stem(x5);
ylabel('x_5(n)=e^(^0^.^6^+^j^*^\pi^/^3^)^*^n^)');xlabel('n');%绘制正弦序列

%利用function改写成相应的函数命令

figure(3);

[x,n] = impseq(1,-2,5);
subplot(3,1,1);stem(n,x);

[x,n] = stepseq(2,-2,7);
subplot(3,1,2);stem(n,x);

function[x,n] = impseq(n0, n1, n2)
% 产生一个有限长的单位冲激序列
% x(n) = delta(n-n0);n1<=n0<=n2
% n1,n2分别为有限长单位冲激序列的起点和终点
% n0为冲激点
    n = n1:n2;
    x=[(n-n0)==0];
end

function[x,n] = stepseq(n0, n1, n2)
% 产生一个有限长的单位阶跃序列x(n)=u(n-n0);n0<=n
% n1,n2wei
% n1,n2分别为阶跃序列的起点和终点
% n0为阶跃点
    n = n1:n2;
    x=[(n-n0)>=0];
end











