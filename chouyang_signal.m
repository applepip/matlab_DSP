% 抽样信号

t = -3*pi:pi/100:3*pi;
xt = sinc(t/pi); %matlab中sinc函数和实际的抽样函数有一个pi的差值，所以要t/pi
plot(t,xt);