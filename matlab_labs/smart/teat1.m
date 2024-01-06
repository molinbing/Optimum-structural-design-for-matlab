function [] = teat1()
clc
L = 15;
mu = 1;
rou = 7800;
tor = 170;
tors = 240;
%F = 1000;
F= 6210/5
%syms dter h t b;
%x = [dter,h,t,b,tors];
result = table();
for i = 1 : 30
    while(1)
    [x,fval,exitflag] = gatest1(F,tor,tors,rou,L)
        if(exitflag > 0)
            result.x(i,:) = x;
            result.fval(i,:) = [fval,0,0,0];
            break;
        end
    end
end
deal(x);
xin = result.x
fin = result.fval
netfuc(xin, fin);
end

