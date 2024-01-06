function [] = testGA3()
clc
F = 6210/8;
fc = 10;
gamaD = 1.2;
b0 = 200;
L0 = 6500;
Cc = 400;
Cs = 4500;
ros = 7.8;
result = table();
for i = 1 : 30
    while(1)
    [x,fval,exitflag] = GAfunc3(F,fc,gamaD,b0,L0,Cc,Cs,ros)
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

