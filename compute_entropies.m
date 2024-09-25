function [H_X, H_Y, H_XY, H_X_given_Y, H_Y_given_X, I_XY] = compute_entropies(joint_dist)

    % 确保联合分布是概率分布（归一化）
    joint_dist = joint_dist / sum(joint_dist(:));

    % 计算边缘分布 P(X) 和 P(Y)
    px = sum(joint_dist, 2); % 对Y求和, 得到P(X)
    py = sum(joint_dist, 1); % 对X求和, 得到P(Y)

    % 删除零概率，以避免计算log(0)
    px = px(px > 0);
    py = py(py > 0);
    joint_dist_nonzero = joint_dist(joint_dist > 0);

    % 计算 H(X), H(Y), H(X,Y)
    H_X = -sum(px .* log2(px));        % H(X)
    H_Y = -sum(py .* log2(py));        % H(Y)
    H_XY = -sum(joint_dist_nonzero .* log2(joint_dist_nonzero));  % H(X,Y)

    % 计算条件熵 H(X|Y) 和 H(Y|X)
    H_X_given_Y = H_XY - H_Y;          % H(X|Y) = H(X,Y) - H(Y)
    H_Y_given_X = H_XY - H_X;          % H(Y|X) = H(X,Y) - H(X)

    % 计算互信息 I(X,Y)
    I_XY = H_X + H_Y - H_XY;           % I(X,Y) = H(X) + H(Y) - H(X,Y)

end