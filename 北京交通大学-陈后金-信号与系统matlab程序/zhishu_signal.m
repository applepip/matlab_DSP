% 指数信号产生

t = 0:0.01:10;
A = 1;
a = -0.4;

xt = A*exp(a*t);

plot(t,xt);