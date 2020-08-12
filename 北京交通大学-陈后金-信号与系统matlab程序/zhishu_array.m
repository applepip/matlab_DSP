% 指数序列

k = 0:10;
A = 1;
a = -0.6;

xk = A*a.^k;

stem(k,xk);  %stem表示离散点显示