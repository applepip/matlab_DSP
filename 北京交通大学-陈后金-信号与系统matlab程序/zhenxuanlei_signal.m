% �������ź�

A = 1; % ���� 
w0 = 2*pi;  %Ƶ��
phi = pi/6;  %����
t = 0:0.001:8;

xt = A*cos(w0*t+phi);

plot(t,xt);

xt = A*sin(w0*t+phi);

plot(t,xt);