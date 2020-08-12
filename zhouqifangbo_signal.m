% 周期方波信号


t = 0:0.0001:5;
A = 1;
T = 1;
w0=2*pi/T;
ft = A*square(w0*t,20); %xt = square(w0*t,duty_cycle)用以产生一个幅度为+1和-1，基波频率为w0，即周期T=2*pi/w0的方波信号。
plot(t,ft);