function [x,fval,exitflag] = GAfunc3(F,fc,gamaD,b0,L0,Cc,Cs,ros)

%目标函数
pi = 3.14;
W = @(x) x(1)*x(2)*Cc + x(3)*pi/4*x(4)^2 * ros * Cs;

%fy'取HRB400的360
fyp = 360;


% 定义约束条件
%c<0,ceq=0
function [c,ceq] = confun(x)
    phy = 1.2687 - 0.0291*(L0/x(1)) + 0.0001*(L0/x(1))^2;
    As = x(3)*x(4)^2*pi/4;
    Ac = x(1)*x(2);
    c = [F - phy*(fc * Ac + fyp*As)/gamaD;
        As / Ac - 0.03;
        0.008 - As/Ac;
        4.52 - As;
        b0 - x(1);
        -x(2);
        x(1) - x(2)];
    ceq = [];
end

A=[];
b=[];
Aeq=[];
beq=[];
%定义变量上下界
lb = [];
ub = [];
options =[];
nonlcon = @confun;
[x,fval,exitflag,output] = ga(W,4,A,b,Aeq,beq,lb,ub,nonlcon,options)

end

