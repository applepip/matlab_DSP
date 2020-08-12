% 利用M点的滑动平均系统滤除掉信号噪声

% Siganl Smoothing by Moving Average Filter

N = 201;
n = 1.0*rand(1,N)-0.5; %噪声
k = 0:N-1;

s = 2*k.*(0.9.^k)+2.0*cos(0.02*pi*k) + 5.0; %滑动平均系统
x= s+n;

subplot(2,1,1);
plot(k,n,'k-',k,s,'b--',k,x,'m-');
xlabel('Time index k');
legend('n[k]','s[k]','x[k]')

M =5; b = ones(M,1)/M; a =[1];
y = filter(b,a,x);

subplot(2,1,2);
plot(k,s,'b-',k,y,'r-');
xlabel('Time index k'); 
legend('s[k]','y[k]');