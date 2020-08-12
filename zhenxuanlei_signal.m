% 正弦类信号

A = 1; % 幅度 
w0 = 2*pi;  %频率
phi = pi/6;  %周期
t = 0:0.001:8;

xt = A*cos(w0*t+phi);

plot(t,xt);

xt = A*sin(w0*t+phi);

plot(t,xt);