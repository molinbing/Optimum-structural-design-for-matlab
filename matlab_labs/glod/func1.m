function [] = func1()
[x, f, t] = glod(@(x)((2*x-1)^2), 0, 6.21, 0.001);
disp("x = " + x);
disp("fval = " + f);
disp("time = " + t);
end
