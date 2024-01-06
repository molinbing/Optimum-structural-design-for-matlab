function [] = testGA4()
clc
Cc = 500;
R = 100;
Cs = 3000;
gamaS = 78;
a = 35;
Tmin = 0.004;
Tmax = 0.025;
ROmin = 0.004;
ROmax = 0.025;
D = 200;
P = 50;

[x,fval,exitflag] = GAfunc4(Cc,R,Cs,gamaS,a,Tmin,Tmax,ROmin,ROmax,D,P)

result.x(1,:) = x;
result.fval(1,:) = [fval,0,0];
deal(x);
xin = result.x
fin = result.fval
netfuc(xin, fin);
end

