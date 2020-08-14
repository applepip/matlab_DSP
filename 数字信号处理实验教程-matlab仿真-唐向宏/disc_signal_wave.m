% ������ɢʱ���źŵĲ���ͼ

clc;  % �������ڵ����ݣ��Թ��������е�ȫ���������κ�Ӱ��,���ѹ���Ƶ����������
clear;  % ��������ռ�����б���
close all;   % �ر����е�Figure����

a = 0.8; N = 8;
n = -12:12; %���ɴ�-12��12�������Ϊ1������
Rn = [zeros(1,12),ones(1,N),zeros(1,5)];
stem(Rn);
x = a.^n.*Rn;

n1=n;
n2=n1-3;
n3=n1+2;
n4=-n1;
figure(1);
subplot(4,1,1);stem(n1,x,'fill');
grid on;% �����ͼ
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

% ���������к�y(n) = x1(n)+x2(n)
[y,n]=sigadd(x1,n1,x2,n2);
figure(2);
subplot(3,1,1);stem(n1,x1);axis([-2,3,0,10])
subplot(3,1,2);stem(n2,x2);
subplot(3,1,3);stem(n,y);

% �������������y(n) = x1(n)*x2(n)
[y,n]=sigmult(x1,n1,x2,n2);
figure(3);
subplot(3,1,1);stem(n1,x1);axis([-2,3,0,10])
subplot(3,1,2);stem(n2,x2);
subplot(3,1,3);stem(n,y);

% ʵ��������λ y(n) = x(n-m)
x = [3,4,2,1,3,2];
nx = [-2:3];
[y,ny]=sigshift(x, nx, 3);
figure(4);
subplot(4,1,1);stem(nx,x);
subplot(4,1,2);stem(ny,y);

function[y,n] = sigadd(x1, n1, x2, n2)
% ���������к�y(n) = x1(n)+x2(n)
% x1Ϊ��͵ĵ�һ���У�n1Ϊ����x1(n)��ʱ������
% x2Ϊ��͵ĵڶ����У�n2Ϊ����x2(n)��ʱ������
    n = min(min(n1),min(n2)):max(max(n1),max(n2));
    y1=zeros(1,length(n));
    y2=y1; %����zeros���������ȳ�����������y1(n),y2(n)
    y1(find((n>=min(n1))&(n<=max(n1))==1)) = x1; %��x1(n)��ֵ����y1(n)
    y2(find((n>=min(n2))&(n<=max(n2))==1)) = x2; %��x1(n)��ֵ����y1(n)
    y = y1+y2; %y1(n)��y2(n)��Ӧ��n���
end

function[y,n] = sigmult(x1, n1, x2, n2)
% �������������y(n) = x1(n)*x2(n)
% x1Ϊ��͵ĵ�һ���У�n1Ϊ����x1(n)��ʱ������
% x2Ϊ��͵ĵڶ����У�n2Ϊ����x2(n)��ʱ������
    n = min(min(n1),min(n2)):max(max(n1),max(n2));
    y1=zeros(1,length(n));
    y2=y1; %����zeros���������ȳ�����������y1(n),y2(n)
    y1(find((n>=min(n1))&(n<=max(n1))==1)) = x1; %��x1(n)��ֵ����y1(n)
    y2(find((n>=min(n2))&(n<=max(n2))==1)) = x2; %��x1(n)��ֵ����y1(n)
    y = y1.*y2; %y1(n)��y2(n)��Ӧ��n���
end

function[y,n] = sigshift(x, nx, m)
% ʵ��������λ y(n) = x(n-m)
% xΪ����ĵ�һ���У�nΪ����x��ʱ������
% mΪ������λ��С
    ny = nx+m;
    y=x;
end