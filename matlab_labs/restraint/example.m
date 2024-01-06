function [x,fval] = example(f, x0,A,b)
[x,fval] = fmincon(f,x0,A,b);
end

