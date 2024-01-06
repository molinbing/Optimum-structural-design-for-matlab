function [x,fval,exitflag] = GAfunc4(Cc,R,Cs,gamaS,a,Tmin,Tmax,ROmin,ROmax,D,P)

%目标函数
pi = 3.14;
W = @(x) Cc* pi *((R +x(1))^2 -R^2) +Cs* gamaS* 2* pi* ((R+a) *x(1)*x(2) +(R+x(1)-a)*x(1)*x(3));

% 定义约束条件
%c<0,ceq=0
function [c,ceq] = confun(x)
    %环向应力限制P——实验水压强，Pa；D——管径，mm；x(1)——管壁厚，mm；
    tor = P*D/(2*x(1));
    c = [tor - 1.75;
        tor - 17];
    ceq = [];
end

A=[1,0,0;
    -1,0,0;
    0,1,0;
    0,-1,0;
    0,0,1;
    0,0,-1;
    1,0,0];
b=[Tmax;
    -Tmin;
    ROmax;
    -ROmin;
    ROmax;
    -ROmin;
    0.001*D];
Aeq=[];
beq=[];
%定义变量上下界
lb = [];
ub = [];
options =[];
nonlcon = @confun;
[x,fval,exitflag,output] = ga(W,3,A,b,Aeq,beq,lb,ub,nonlcon,options)

end

