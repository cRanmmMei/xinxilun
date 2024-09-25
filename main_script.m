% 读取两个Excel文件中的联合分布
joint_dist1 = xlsread('data1.xls'); % P(X, Y) for distribution 1
joint_dist2 = xlsread('data2.xls'); % P(X, Y) for distribution 2

% 计算第一个联合分布的熵和互信息
[H_X1, H_Y1, H_XY1, H_X_given_Y1, H_Y_given_X1, I_XY1] = compute_entropies(joint_dist1);

% 计算第二个联合分布的熵和互信息
[H_X2, H_Y2, H_XY2, H_X_given_Y2, H_Y_given_X2, I_XY2] = compute_entropies(joint_dist2);

% 输出结果
fprintf('For data1 (joint distribution 1):\n');
fprintf('H(X) = %.4f\n', H_X1);
fprintf('H(Y) = %.4f\n', H_Y1);
fprintf('H(X, Y) = %.4f\n', H_XY1);
fprintf('H(X|Y) = %.4f\n', H_X_given_Y1);
fprintf('H(Y|X) = %.4f\n', H_Y_given_X1);
fprintf('I(X, Y) = %.4f\n', I_XY1);

fprintf('\nFor data2 (joint distribution 2):\n');
fprintf('H(X) = %.4f\n', H_X2);
fprintf('H(Y) = %.4f\n', H_Y2);
fprintf('H(X, Y) = %.4f\n', H_XY2);
fprintf('H(X|Y) = %.4f\n', H_X_given_Y2);
fprintf('H(Y|X) = %.4f\n', H_Y_given_X2);
fprintf('I(X, Y) = %.4f\n', I_XY2);