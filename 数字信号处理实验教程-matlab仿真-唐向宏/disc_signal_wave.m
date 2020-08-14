% 画出离散时间信号的波形图

clc;  % 清除命令窗口的内容，对工作环境中的全部变量无任何影响,并把光标移到命令窗口左上
clear;  % 清除工作空间的所有变量
close all;   % 关闭所有的Figure窗口

a = 0.8; N = 8;
n = -12:12; %生成从-12到12间隔数据为1的序列
Rn = [zeros(1,12),ones(1,N),zeros(1,5)];
stem(Rn);
x = a.^n.*Rn;

n1=n;
n2=n1-3;
n3=n1+2;
n4=-n1;
figure(1);
subplot(4,1,1);stem(n1,x,'fill');
grid on;% 画表格图
ylabel('x_1(n)');axis([-15,15,0,1]);
subplot(4,1,2);stem(n2,x,'fill');
grid on;ylabel('x_2(n)');axis([-15,15,0,1]);
subplot(4,1,3);stem(n3,x,'fill');
grid on;ylabel('x_3(n)');axis([-15,15,0,1]);
subplot(4,1,4);stem(n4,x,'fill');
grid on;ylabel('x_4(n)');axis([-15,15,0,1]);


x1=[1,2,3,4];
n1=[0:3];
x2=[3,4,2,1,3,2];
n2=[-2:3];

% 求两个序列和y(n) = x1(n)+x2(n)
[y,n]=sigadd(x1,n1,x2,n2);
figure(2);
subplot(3,1,1);stem(n1,x1);axis([-2,3,0,10])
subplot(3,1,2);stem(n2,x2);
subplot(3,1,3);stem(n,y);

% 求两个序列相乘y(n) = x1(n)*x2(n)
[y,n]=sigmult(x1,n1,x2,n2);
figure(3);
subplot(3,1,1);stem(n1,x1);axis([-2,3,0,10])
subplot(3,1,2);stem(n2,x2);
subplot(3,1,3);stem(n,y);

% 实现序列移位 y(n) = x(n-m)
x = [3,4,2,1,3,2];
nx = [-2:3];
[y,ny]=sigshift(x, nx, 3);
figure(4);
subplot(4,1,1);stem(nx,x);
subplot(4,1,2);stem(ny,y);

function[y,n] = sigadd(x1, n1, x2, n2)
% 求两个序列和y(n) = x1(n)+x2(n)
% x1为求和的第一序列，n1为序列x1(n)的时间序列
% x2为求和的第二序列，n2为序列x2(n)的时间序列
    n = min(min(n1),min(n2)):max(max(n1),max(n2));
    y1=zeros(1,length(n));
    y2=y1; %利用zeros函数产生等长的两个序列y1(n),y2(n)
    y1(find((n>=min(n1))&(n<=max(n1))==1)) = x1; %将x1(n)的值赋给y1(n)
    y2(find((n>=min(n2))&(n<=max(n2))==1)) = x2; %将x1(n)的值赋给y1(n)
    y = y1+y2; %y1(n)与y2(n)对应点n相加
end

function[y,n] = sigmult(x1, n1, x2, n2)
% 求两个序列相乘y(n) = x1(n)*x2(n)
% x1为求和的第一序列，n1为序列x1(n)的时间序列
% x2为求和的第二序列，n2为序列x2(n)的时间序列
    n = min(min(n1),min(n2)):max(max(n1),max(n2));
    y1=zeros(1,length(n));
    y2=y1; %利用zeros函数产生等长的两个序列y1(n),y2(n)
    y1(find((n>=min(n1))&(n<=max(n1))==1)) = x1; %将x1(n)的值赋给y1(n)
    y2(find((n>=min(n2))&(n<=max(n2))==1)) = x2; %将x1(n)的值赋给y1(n)
    y = y1.*y2; %y1(n)与y2(n)对应点n相乘
end

function[y,n] = sigshift(x, nx, m)
% 实现序列移位 y(n) = x(n-m)
% x为输入的第一序列，n为序列x的时间序列
% m为序列移位大小
    ny = nx+m;
    y=x;
end