function [] = fun1()
clc
f = @(x)(x(1)-2)^2+(x(2)-1)^2;
%f = @(x) x(1)^2 + x(2)^2;
g1 = @(x)1+x(1)-x(2);
g2 = @(x)x(1)+x(2)-2;
%g0 = @(x) 1-x(1);
maxiter = 1000;
x0 = [0, 6.21];
eps = 0.0001;
A = [1, -1;1,1];
b = [-1;2];
[xt, fvalt] = example(f, x0, A, b);
disp(xt);
disp(fvalt);

%[x, fval] = restest(f, g0, x0, eps, maxiter);
%disp("1： " + x);
%disp("2： ");
%disp(fval);

[x, fval] = restraint(f, g1, g2, x0, eps, maxiter);
disp("最优点： ");
disp(x);
disp("结果： ");
disp(fval);
end

