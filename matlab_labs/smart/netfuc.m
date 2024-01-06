function [] = netfuc(x, f)

%构造一个前馈网络，其中一个隐藏层的大小为 10。
net = feedforwardnet(10);
% 设置训练参数
net.trainParam.epochs = 1000; % 最大训练轮次
net.trainParam.goal = 1e-5; % 训练目标误差
net.trainParam.lr = 0.1; % 学习率

% 划分数据集
net.divideParam.trainRatio = 0.6;
net.divideParam.valRatio = 0.2;
net.divideParam.testRatio = 0.2;

%将输入数据和目标数据转换为n*n大小
input_data = x
target_data = f
% 训练神经网络
[trained_net, tr] = train(net, input_data, target_data);

test_data = input_data;
test_output = trained_net(test_data);

% 将输出结果转换为二进制
binary_output = round(test_output);

% 显示结果
disp("测试数据：");
disp(test_data');
disp("测试输出：");
disp(binary_output);

% 可视化神经网络结构
view(trained_net);

% 可视化训练过程中的性能
figure;
plotperform(tr);
title('训练过程中的性能');

% 可视化训练过程中的梯度
figure;
plot(tr.gradient);
xlabel('迭代次数');
ylabel('梯度');
title('训练过程中的梯度');
end

