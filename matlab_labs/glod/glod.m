function [x, fval, time] = glod(f, a, b,erf)
% 使用黄金分割法求解结构优化问题
%
% 输入：
%   f：目标函数
%   a：搜索区间的左端点
%   b：搜索区间的右端点
%  erf：精度要求
%
% 输出：
%   x：最优解
%   fval：最优值

% 计算黄金分割比
phi = (1 + sqrt(5)) / 2 - 1;

% 初始化
a2 = a + phi * (b - a);
a1 = b - phi * (b - a);
y1 = f(a1);
y2 = f(a2);
tic;
% 迭代求解
while ((abs(b - a) > erf) && (abs(y2 - y1) > erf))
    if (y1 >= y2)
        a = a1;
        a1 = a2;
        y1 = y2;
        a2 = a + phi * (b - a);
        y2 = f(a2);

    else
        b = a2;
        a2 = a1;
        y2 = y1;
        a1 = b - phi * (b - a);
        y1 = f(a1);

    end
end

x = (a + b) / 2;
fval = f(x);
time = toc;
