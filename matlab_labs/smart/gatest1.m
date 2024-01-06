function [x,fval,exitflag] = gatest1(F,tor,tors,rous,L)

AS = @(x) x(1)*x(2) + 2*x(4)*x(3);
%约束条件
%g1 = (x(1)*x(2)^3)/12 + (x(4)*x(3)^3)/6 + (x(2)+x(3))^2/2;
%g2 = (x(3)*x(4)^3)/6 + (x(2)*x(1)^3)/12;
%g3 = x(2)/x(1);
%g4 = 50*(2400/x(3)ors)^(1/2) + 0.1*1;
%目标函数
W =@(x) rous * L * (x(1)*x(2) + 2*x(4)*x(3));
%约束
%g = W/A;
%惩罚函数
%f_pen =@(x(1),x(2),x(3),x(4)) W + r * (max(0, g ^ 2));
lamba = 1;
% 定义约束条件
function [c,ceq] = confun(x)
    c = [F/(x(1)*x(2)+2*x(4)*x(3))-tor;
        F/(yita*(x(1)*x(2)+2*x(4)*x(3)))-tor;
        x(2)/x(1) - 50*(2400/tors)^(1/2) - 0.1*lamba;
        x(4) - 30*x(3)*(2400/tors)^(1/2);
        -x(1);
        -x(2);
        -x(3);
        -x(4)];
    ceq =x(1)*x(2)^3/12+x(4)*x(3)^3/6+((x(2)+x(3))^2*x(4)*x(3)/2)-x(2)*x(1)^3/12-x(3)*x(4)^3/6;
end
%线性约束
%参数
%折减系数
yita = rand(1) * (1 - 0.6) + 0.6


%ga函数
%[x,fval] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,opbions)
%x的返回值是决策向量x的取值，fval的返回值是目标函数f(x)的取值
%fun是用M文件定义的函数f(x),代表了(非)线性目标函数。
%nvars表示变量个数。
%A,b,Aeq,beq定义了线性约束 ,如果没有线性约束，则A=[],b=[],Aeq=[],beq=[]。
%lb和ub是变量x的下界和上界，如果下界和上界没有约束，则lb=[],ub=[],也可以
%写成lb的各分量都为 -inf,ub的各分量都为inf。
%nonlcon是用M文件定义的非线性向量函数约束，没有的话可以设置为[]。
%opbions定义了优化参数，不填写表示使用Mablab默认的参数设置。
A=[];
b=[];
Aeq=[];
beq=[];
%定义变量上下界
lb = [];
ub = [];
options =[];
nonlcon = @confun;
[x,fval] = ga(W,4,A,b,Aeq,beq,lb,ub,nonlcon,options);
disp(x);
disp(fval);

%再次定yita值后重新计算
lamba = 1*L/((x(1)*x(2)^3/12+x(4)*x(3)^3/6+((x(2)+x(3))^2*x(4)*x(3)/2))/AS(x))
yita = 0.9938+0.0009*lamba-0.00006*lamba^2+0.0000002*lamba^3
[x,fval,exitflag,output] = ga(W,4,A,b,Aeq,beq,lb,ub,nonlcon,options)

end

