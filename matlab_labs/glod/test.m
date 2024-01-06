function [] = test()
[x, f, t] = glod(@(x)(x^2 + 2*x), -3, 5, 0.0000000001);
disp("x = " + x);
disp("fval = " + f);
disp("time = " + t);
end

