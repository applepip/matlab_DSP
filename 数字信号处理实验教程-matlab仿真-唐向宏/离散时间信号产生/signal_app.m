% 1.  ��֪���޳�������Ϊx(n)={1,2,3,4,5},-1<=n<=3,�������������ط�ʽ��������Ϊ5����������

clear;  % ��������ռ�����б���
close all;   % �ر����е�Figure����
clc;  % �������ڵ����ݣ��Թ��������е�ȫ���������κ�Ӱ��,���ѹ���Ƶ���������Ͻ�

x = 1:5; n= -1:3; %x(n)���м���ʱ��

nxb = min(n);nxe = max(n); %x(n)���е���ʼ����ֹ����

% ����һ���ظ�����

x1 = [x,x,x,x];
nx1 = [nxb-5:nxe+2*5];  %��x(n)����һ��x(n+5);��x(n)��������x(n+5*2)

%% ��������������������ú�������period()
%[x2, nx2] = period(x,n,4,1);

%% ����mod��������ʵ�֣����ú�������sigperi����

%[x3,nx3] = sigperi(x,n,3,1);  %��x(n)����һ��x(n+5);��x(n)��������x(n+5*2)

stem(nx1,x1);xlabel('n');ylabel('x^~_1(n)'); grid on;
%subplot(3,1,2);stem(nx2,x2);ylabel('x^~ _2(n)'); grid on;
%subplot(3,1,3);stem(nx3,x3);xlabel('n');ylabel('x^~ _2(n)'); grid on;

% 2. ����һ�����״��ͨ��ϵͳ�г��õ������Ե�Ƶ�ź�
%     Ulfm(n) = e-j*pi*b*n2, n1<=n<=n2
%  ʽ�У�bΪ���Ե�Ƶɨ��Ƶ�ʣ�|b|=D/T^2; DΪ����ѹ���ȣ�TΪ�����źŵ����ڡ�

z = LFMdemo(1e2,0,1e-6,1e-9)

function y = LFMdemo(D,be,Tp,s)
    % DΪ�����ѹ����
    % beΪ��Ƶ�źŵ���ʼʱ��
    % TpΪ������
    % sΪ���㾫��

    b = D/(Tp^2); ss = 1/s;
    t = be:s:(Tp+be); n = (t-be)*ss+1;
    y = exp(j*pi*b*t.*t);
    figure;
    Realx = real(y);
    Imagx = imag(y);

    subplot(2,1,1); plot(n, Realx);
    xlabel('n');ylabel('Real(x)');title('���Ե�Ƶ����ʵ��');
    subplot(2,1,2); plot(n, Imagx);
    xlabel('n');ylabel('Imag(x)');title('���Ե�Ƶ�����鲿');

end
