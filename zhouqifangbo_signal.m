% ���ڷ����ź�


t = 0:0.0001:5;
A = 1;
T = 1;
w0=2*pi/T;
ft = A*square(w0*t,20); %xt = square(w0*t,duty_cycle)���Բ���һ������Ϊ+1��-1������Ƶ��Ϊw0��������T=2*pi/w0�ķ����źš�
plot(t,ft);