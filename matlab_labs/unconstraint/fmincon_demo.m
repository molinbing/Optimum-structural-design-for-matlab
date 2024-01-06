function [x,fval] = fmincon_demo(f)

% 定义目标函数
%f = @(x) 10*(x(1) + x(2) - 3)^2 + (2*x(1) - x(2))^2;

% 定义初始解
x0 = [6.21,6.21];

% 调用fmincon函数求解
[x,fval] = fmincon(f,x0);

% 显示结果
disp('最优解：');
disp(x);
disp('最小值：');
disp(fval);
end
