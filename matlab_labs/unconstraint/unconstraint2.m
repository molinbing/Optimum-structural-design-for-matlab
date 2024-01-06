function [k, endval,endpoint,time] = unconstraint2(f,x,e,n)
%共轭梯度下降法,f为目标函数 （两变量x1和x2），x为初始点,n为搜索次数
%梯度的方向与取得最大方向导数值的方向一致，梯度的模即函数在该点的方向导数的最大值。
syms x1 x2 a; %a为步长因子
F = matlabFunction(f);
FX0 = [diff(f,x1);diff(f,x2)];  %分别求x1和x2的偏导数，即梯度
%FX0_T = transpose(FX0);
%FX1 = jacobian(f,[x1,x2]);  %海森矩阵
flag = 1;  %循环标志
k = 0; %迭代次数
tic;
while(flag)
    %获取X矩阵现在的实际值
    xk = subs(FX0,x1,x(1));
    xk = subs(xk,x2,x(2));
    
    %范数
    nor = norm(xk);
    if(nor >= e) 
        %下一次迭代出发矩阵
        x_temp = x + a*xk;
        %将改变后的x1和x2代入目标函数
        f_temp = subs(f,x1,x_temp(1));
        f_temp = subs(f_temp,x2,x_temp(2));
        %对a求导，找出最佳步长
        h = diff(f_temp,a);
        %求方程，得到当次a
        a_temp = solve(h);
        %更新起始点x
        x = x + a_temp*xk; 

        if(k < n)
             %二次带入
            xkk = subs(FX0,x1,x(1));
            xkk = subs(xkk,x2,x(2));
            %计算系数
            beta = sum(xkk.^2) / sum(xk.^2);
            %下一次迭代出发矩阵
            x_temp = -xkk + beta*(-xk);
            %再沿着xtemp进行一维搜索
            x_temp2 = x + a*x_temp;
            %将改变后的x1和x2代入目标函数
            f_temp = subs(f,x1,x_temp2(1));
            f_temp = subs(f_temp,x2,x_temp2(2));
            %对a求导，找出最佳步长
            h = diff(f_temp,a);
            %求方程，得到当次a
            a_temp = solve(h);
            %更新起始点x
            x_2 = subs(x_temp2, a, a_temp);
            x_2 = subs(x_2, a, a_temp);
            x = x_2;
            %第三次带入得到梯度
            xkkk = subs(FX0,x1,x(1));
            xkkk = subs(xkkk,x2,x(2));
            xkkk_num = transpose(double(xkkk));
            if(xkkk_num == 0)
                %求海森矩阵
                h = jacobian(gradient(f));
                if(eig(h) > 0)
                    %得到最终值
                    endval = subs(f, x1, x(1));
                    endval = subs(endval, x2, x(2));
                    break;
                end
            end
            k = k+1;
        end
    else
        flag=0;
    end
end
endpoint = double(x);
endval = subs(f, x1, x(1));
endval = subs(endval, x2, x(2));  %终点
time = toc;
end
