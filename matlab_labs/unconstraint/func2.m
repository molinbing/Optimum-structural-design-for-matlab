function [] = func2()
%最速梯度优化
N = 1000;
X0 = [N/1000, N/1000];
syms x1 x2;
%f = 10*(x1 + x2 - 3)^2 + (2*x1 - x2)^2;
f = 3*(x1-2)^2 + (x2-4)^2;
%f = (x1 -1)^2 + (x2-1)^2;
%f = x1^2+2*x2^2-4*x1-2*x2*x1;
%f = @(x1, x2) x1^2 + 2*x2^2 - 4*x1 - 2*x2*x1;
[xk, endval,endpoint,time] = unconstraint2(f, transpose(X0), 0.001,500);
disp("迭代次数： " + xk);
disp("最优点： ");
disp(endpoint);
disp("最优解： ");
disp(endval);
disp("时间：" + time)
%MATLAB自带优化
%f2 = @(x) 10*(x(1) + x(2) - 3)^2 + (2*x(1) - x(2))^2;
%fmincon_demo(f2);
f3 = @(x) 3*(x(1)-2)^2 + (x(2)-4)^2;
fmincon_demo(f3);
end
