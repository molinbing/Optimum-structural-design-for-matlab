function [] = testGA2()
clc
Cc=400;
ros=7.8;
Cs=4500;
M=6210/100
fc=12.5;
sigemad=1.2;
romin=0.0015;
fy=310;
V = 30;
b0 = 0.2;
result = table();
for i = 1 : 30
    while(1)
    [x,fval,exitflag] = GAfunc2(Cc, ros, Cs,M,fc,sigemad,romin,fy,V,b0)
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

