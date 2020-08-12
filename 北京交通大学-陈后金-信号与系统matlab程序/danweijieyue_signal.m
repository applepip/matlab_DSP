% 单位阶跃信号

t = -2:0.01:3;
t0 = 0;
ut = stepfun(t,t0); %ut = stepfun(t,t0);t是以向量形式表示的变量，t0表示信号发生突变的时刻。
plot(t,ut);