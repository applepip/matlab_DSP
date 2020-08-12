% 矩形脉冲信号


t = 0:0.001:4;
T = 1;
xt = rectpuls(t-2*T,T); %xt = rectpuls(t,width)产生一个幅度为1，宽度为width以零点为对称的矩形波
plot(t,xt);