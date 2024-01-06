function [k, endval,time] = unconstraint1(f,x,e)
%梯度下降法,f为目标函数 （两变量x1和x2），x为初始点
%梯度的方向与取得最大方向导数值的方向一致，梯度的模即函数在该点的方向导数的最大值。
syms x1 x2 a; %a为步长因子
FX = -[diff(f,x1);diff(f,x2)];  %分别求x1和x2的偏导数，即下降的方向
flag = 1;  %循环标志
k = 0; %迭代次数
tic;
while(flag)
    %获取X矩阵现在的实际值
    Sk = subs(FX,x1,x(1));
    Sk = subs(Sk,x2,x(2));
    %范数
    nor = norm(Sk);
    if(nor >= e)
        %下一次迭代出发矩阵
        x_temp = x + a*Sk;
        %将改变后的x1和x2代入目标函数
        f_temp = subs(f,x1,x_temp(1));
        f_temp = subs(f_temp,x2,x_temp(2));

        %对a求导，找出最佳步长
        h = diff(f_temp,a);
        %求方程，得到当次a
        a_temp = solve(h);
        %更新起始点x
        x = x + a_temp*Sk; 
        %更新次数
        k=k+1;
    else
        flag=0;
    end
end
endval=double(x);  %终点
time = toc;
end
