function [] = func2()
[x, f, t] = glod(@(x)((3*x+1)^x), -2, 0.621, 0.001);
disp("x = " + x);
disp("fval = " + f);
disp("time = " + t);
end
