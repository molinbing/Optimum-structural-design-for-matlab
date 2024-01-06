function [x, fval] = restest(f, g1, x0, eps, maxiter)
% 外点惩罚函数法求解约束优化问题
% 输入：
%   f：目标函数
%   g：约束函数
%   x0：初始点
%   eps：收敛精度
%   maxiter：最大迭代次数
% 输出：
%   x：解
%   fval：目标函数值
%   r: 惩罚因子
r = 1;
%递增系数
c = 8;


% 定义惩罚函数
f_pen = @(x) f(x) + r * (max(0, g1(x0))^ 2);
%无约束优化得到最小值点
[xpoint0, fval0] = fmincon(f_pen,x0);
x0 = xpoint0;
% 迭代
for k = 1:maxiter
    r = r*c;
    % 惩罚函数
    f_pen = @(x) f(x) + r * (max(0, g1(x0))^ 2);

    %无约束优化得到最小值点
    [xpoint, fval] = fmincon(f_pen,x0);
    
    % 判断是否收敛
    if (norm(xpoint - x0) <= eps)
        break;
    end

    % 更新迭代次数
    iters = iters + 1;

    % 更新X
    x0 = xpoint;
end

fval = f(x0);
x = x0;
end
