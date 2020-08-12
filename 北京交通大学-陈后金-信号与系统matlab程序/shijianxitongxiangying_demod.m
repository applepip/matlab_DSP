% 连续时间系统响应的求解

% [例1] 描述系统的微分方程为y''(t) + 2y'(t) + 100y(t) = 2x(t)
% 试求系统的冲激响应和周期矩形波x(t)的零状态响应。

% 该系统的冲激响应

ts=0; %起点
te=10;  %终点
dt=0.01; %间隔 

sys=tf([2],[1 2 100]);

t=ts:dt:te;  

y=impulse(sys,t); %冲激响应

plot(t,y);

% 该系统的零状态响应

ts=0;
te=30;
dt=0.01;

sys=tf([2],[1 2 100]);
t=ts:dt:te;
x=heaviside(sin(pi*t)); %正弦信号产生矩形脉冲信号

y=lsim(sys,x,t） % 零状态响应

plot(t,y);