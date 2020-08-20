% 1.  已知有限长度序列为x(n)={1,2,3,4,5},-1<=n<=3,试利用周期延拓方式产生周期为5的周期序列

clear;  % 清除工作空间的所有变量
close all;   % 关闭所有的Figure窗口
clc;  % 清除命令窗口的内容，对工作环境中的全部变量无任何影响,并把光标移到命令窗口左上角

x = 1:5; n= -1:3; %x(n)序列及其时间

nxb = min(n);nxe = max(n); %x(n)序列的起始、终止问题

% 方法一：重复复制

x1 = [x,x,x,x];
nx1 = [nxb-5:nxe+2*5];  %将x(n)左移一次x(n+5);将x(n)右移两次x(n+5*2)

%% 方法二：矩阵产生，调用函数命令period()
%[x2, nx2] = period(x,n,4,1);

%% 调用mod（）函数实现，调用函数命令sigperi（）

%[x3,nx3] = sigperi(x,n,3,1);  %将x(n)左移一次x(n+5);将x(n)右移两次x(n+5*2)

stem(nx1,x1);xlabel('n');ylabel('x^~_1(n)'); grid on;
%subplot(3,1,2);stem(nx2,x2);ylabel('x^~ _2(n)'); grid on;
%subplot(3,1,3);stem(nx3,x3);xlabel('n');ylabel('x^~ _2(n)'); grid on;

% 2. 产生一种在雷达或通信系统中长用到的线性调频信号
%     Ulfm(n) = e-j*pi*b*n2, n1<=n<=n2
%  式中：b为线性调频扫描频率；|b|=D/T^2; D为脉冲压缩比；T为脉冲信号的周期。

z = LFMdemo(1e2,0,1e-6,1e-9)

function y = LFMdemo(D,be,Tp,s)
    % D为脉冲的压缩比
    % be为调频信号的起始时间
    % Tp为脉冲宽度
    % s为计算精度

    b = D/(Tp^2); ss = 1/s;
    t = be:s:(Tp+be); n = (t-be)*ss+1;
    y = exp(j*pi*b*t.*t);
    figure;
    Realx = real(y);
    Imagx = imag(y);

    subplot(2,1,1); plot(n, Realx);
    xlabel('n');ylabel('Real(x)');title('线性调频序列实部');
    subplot(2,1,2); plot(n, Imagx);
    xlabel('n');ylabel('Imag(x)');title('线性调频序列虚部');

end
