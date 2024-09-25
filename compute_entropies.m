function [H_X, H_Y, H_XY, H_X_given_Y, H_Y_given_X, I_XY] = compute_entropies(joint_dist)

    % ȷ�����Ϸֲ��Ǹ��ʷֲ�����һ����
    joint_dist = joint_dist / sum(joint_dist(:));

    % �����Ե�ֲ� P(X) �� P(Y)
    px = sum(joint_dist, 2); % ��Y���, �õ�P(X)
    py = sum(joint_dist, 1); % ��X���, �õ�P(Y)

    % ɾ������ʣ��Ա������log(0)
    px = px(px > 0);
    py = py(py > 0);
    joint_dist_nonzero = joint_dist(joint_dist > 0);

    % ���� H(X), H(Y), H(X,Y)
    H_X = -sum(px .* log2(px));        % H(X)
    H_Y = -sum(py .* log2(py));        % H(Y)
    H_XY = -sum(joint_dist_nonzero .* log2(joint_dist_nonzero));  % H(X,Y)

    % ���������� H(X|Y) �� H(Y|X)
    H_X_given_Y = H_XY - H_Y;          % H(X|Y) = H(X,Y) - H(Y)
    H_Y_given_X = H_XY - H_X;          % H(Y|X) = H(X,Y) - H(X)

    % ���㻥��Ϣ I(X,Y)
    I_XY = H_X + H_Y - H_XY;           % I(X,Y) = H(X) + H(Y) - H(X,Y)

end