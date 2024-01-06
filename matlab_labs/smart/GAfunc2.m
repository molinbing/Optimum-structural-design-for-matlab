function [x,fval,exitflag] = GAfunc2(Cc, ros, Cs,M,fc,sigemad,romin,fy,V,b0)

%目标函数
pi = 3.14;
W = @(x) x(1)*x(2)*Cc + x(3)*pi/4*x(4)^2 * ros * Cs;
%取h0=h-as = h-40
opsilonB = 0.618;

% 定义约束条件
function [c,ceq] = confun(x)
    opsilon = (fy*(x(3)*x(4)^2*pi/4)) / (fc*x(1)* (x(2) - 40));
    c = [M - (fc*1* x(1)* (x(2) - 40)^2)/sigemad;
        romin - (x(3)*x(4)^2*pi/4)/ (x(1)* (x(2) - 40));
        opsilon - opsilonB;
        V - 0.07*fc*x(1)*(x(2) - 40);
        -x(1);
        -x(2);
        b0-x(1)];
    ceq = fc*opsilon* x(1)* (x(2) - 40) - fy*(x(3)*x(4)^2*pi/4);
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

